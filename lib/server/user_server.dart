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

  // 查看用户详情
  Future fetchUserProfile(token) async {
    var param = {"token": token};
    return super.requestPostData("user/detail", param);
  }

  // 获取短信验证码
  Future fetchSmsCode(phone) async {
    var param = {"mobile": phone};
    return super.requestGetData("verification/sms/get", param);
  }

  // 用户注册[手机号]
  Future fetchRegisterUser(phone, code, password, nick) async {
    var param = {"mobile": phone, "code": code, "pwd": password, "nick":nick};
    return super.requestPostData("user/m/register", param);
  }


}