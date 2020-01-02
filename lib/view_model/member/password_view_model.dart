import 'package:fire_shop/server/user_server.dart';
import 'package:fire_shop/utils/validator_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PasswordViewModel {
  UserServer server = UserServer();

  // 获取短信验证码
  Future getSmsCode(phone) async {
    await server.fetchSmsCode(phone);
  }

  // 重置密码
  Future resetPassword(phone, code, password) async {
    var result =  await server.fetchResetPassword(phone, code, password);
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

  // 校验验证码
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
}