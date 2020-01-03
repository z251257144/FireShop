import 'package:fire_shop/server/user_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/model/member/user_model.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fire_shop/utils/validator_util.dart';

class LoginViewModel {
  UserServer server = UserServer();

  Future doLogin(phone, password) async {
    var result = await this.fetchLogin(phone, password);
    await this.fetchUserProfile(result["token"]);
  }

  // 用户登录
  fetchLogin(phone, password) {
    return server.fetchLogin(phone, password);
  }

  // 获取用户详细信息
  fetchUserProfile(token) async {
    await server.fetchUserProfile(token).then((result) {
      debugPrint(result['base'].toString());

      var model = UserModel.fromJson(result['base']);
      UserinfoManager.shared.setLoginInfo(model);
      print(UserinfoManager.shared.isLogin ? "用户已登录" : "用户未登录");
    });
  }

  // 校验手机号
  bool checkPhone(text) {
    if (text == null || text.length == 0 ) {
      Fluttertoast.showToast(msg: "请输入手机号");
      return false;
    }
    else if (!ValidatorUtil.isPhone(text)) {
      Fluttertoast.showToast(msg: "请输入有效的11位手机号");
      return false;
    }
    return true;
  }

  // 校验密码
  bool checkPassword(text) {
    if (text == null || text.length == 0 ) {
      Fluttertoast.showToast(msg: "请输入密码");
      return false;
    }
    return true;
  }


}