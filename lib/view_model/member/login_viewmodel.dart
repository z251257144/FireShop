
import 'package:fire_shop/server/user_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/model/user_model.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';

class LoginViewModel {
  Future doLogin(phone, password) async {
    var result = await this.fetchLogin(phone, password);
    await this.fetchUserProfile(result["token"]);
  }

  // 用户登录
  fetchLogin(phone, password) {
    return UserServer().fetchLogin(phone, password);
  }

  // 获取用户详细信息
  fetchUserProfile(token) async {
    await UserServer().fetchUserProfile(token).then((result) {
      debugPrint(result['base'].toString());

      var model = UserModel.fromJson(result['base']);
      UserinfoManager.shared.setLoginInfo(model);
      print(UserinfoManager.shared.isLogin ? "用户已登录" : "用户未登录");
    });
  }
}