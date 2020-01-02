import 'dart:core';

class ValidatorUtil {

  // 邮箱校验
  static bool isEmail(String input) {
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(input);
  }

  // 手机号校验
  static bool isPhone(String input) {
    RegExp emailRegExp = RegExp(r"^[1][3,4,5,6,7,8,9][0-9]{9}$");
    return emailRegExp.hasMatch(input);
  }

  // 手机验证码校验
  static bool isSmsCode(String input) {
    RegExp emailRegExp = RegExp(r"^[0-9]{4,6}$");
    return emailRegExp.hasMatch(input);
  }
}


