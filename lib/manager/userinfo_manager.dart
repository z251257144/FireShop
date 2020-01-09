import 'package:fire_shop/model/member/user_model.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/*
* APP当前登录用户信息管理
* */
class UserinfoManager with ChangeNotifier {
  /*使用单例模式管理用户信息*/
  static final UserinfoManager _instance = UserinfoManager._internal();

  UserinfoManager._internal();

  factory UserinfoManager() => _instance;

  static UserinfoManager get shared => _instance;

  /*用户登录信息*/
  UserModel user;

  /*用户是否登录*/
  bool get isLogin {
    return (user != null) && (user.id != null) && (user.id > 0);
  }

  void setLoginInfo(UserModel user) {
    _instance.user = user;
    notifyListeners();
  }

  bool isShowLogin(context) {
    if (!isLogin) {
      Navigator.of(context).pushNamed(RoutePath.login);
    }

    return isLogin;
  }
}