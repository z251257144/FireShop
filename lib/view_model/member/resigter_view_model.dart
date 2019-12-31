import 'package:fire_shop/server/user_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/model/user_model.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';

class RegisterViewModel {
  UserServer server = UserServer();

  // 获取短信验证码
  Future getSmsCode(phone) async {
    await server.fetchSmsCode(phone);
  }

  // 用户注册
  Future registerUser(phone, code, password, nick) async {
    await server.fetchRegisterUser(phone, code, password, nick).then((result){
      print(result);
    });
  }

}