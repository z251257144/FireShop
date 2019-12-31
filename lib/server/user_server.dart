import 'package:fire_shop/server/base_server.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/device_util.dart';

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
    return super.requestPostData("user/detail", param);
  }
}