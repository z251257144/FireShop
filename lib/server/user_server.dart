import 'package:fire_shop/model/user_model.dart';
import 'package:fire_shop/server/base_server.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:dio/dio.dart';
import 'package:fire_shop/model/user_model.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';

class UserServer extends BaseServer {
  /*用户登录*/
  Future fetchLogin(phone, password) async {
    var param = Map<String, dynamic>();
    param["deviceId"] = await DeviceUtil.deviceID();
    param["deviceName"] = await DeviceUtil.deviceName();
    param["mobile"] = phone;
    param["pwd"] = password;
    debugPrint(param.toString());

    return super.requestPostData("user/m/login", param);
  }

  Future fetchUserProfile(token) async {
    var param = {"token": token};
    await super.requestPostData("user/detail", param).then((result) {
      debugPrint(result['base'].toString());

      var model = UserModel.fromJson(result['base']);
      UserinfoManager.shared.setLoginInfo(model);
      print(UserinfoManager.shared.isLogin ? "用户已登录" : "用户未登录");

    });
  }
}