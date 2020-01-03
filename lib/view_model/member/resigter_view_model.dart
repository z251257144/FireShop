import 'package:fire_shop/server/user_server.dart';
import 'package:fire_shop/utils/validator_util.dart';
import 'package:fire_shop/view_model/member/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/model/member/user_model.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterViewModel {
  UserServer server = UserServer();
  LoginViewModel loginViewModel = LoginViewModel();

  // 获取短信验证码
  Future getSmsCode(phone) async {
    await server.fetchSmsCode(phone);
  }

  // 用户注册
  Future registerUser(phone, code, password, nick) async {
    var result =  await server.fetchRegisterUser(phone, code, password, nick);
    print(result);
  }

  // 校验手机号
  bool checkPhone(phone) {
    if (phone == null || phone.length == 0) {
      Fluttertoast.showToast(msg: "请输入手机号");
      return false;
    }

    if (!ValidatorUtil.isPhone(phone)) {
      Fluttertoast.showToast(msg: "请输入有效的手机号");
      return false;
    }

    return true;
  }

  // 校验手机号
  bool checkSmsCode(code) {
    if (code == null || code.length == 0) {
      Fluttertoast.showToast(msg: "请输入验证码");
      return false;
    }

    if (!ValidatorUtil.isSmsCode(code)) {
      Fluttertoast.showToast(msg: "请输入有效的验证码");
      return false;
    }

    return true;
  }

  // 校验密码
  bool checkPassword(password) {
    if (password == null || password.length == 0) {
      Fluttertoast.showToast(msg: "请输入密码");
      return false;
    }

    return true;
  }

  // 校验昵称
  bool checkNick(nick) {
    if (nick == null || nick.length == 0) {
      Fluttertoast.showToast(msg: "请输入昵称");
      return false;
    }

    return false;
  }

}