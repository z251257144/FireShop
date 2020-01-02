import 'package:fire_shop/pages/member/login/login_page.dart';
import 'package:fire_shop/pages/member/password/password_page.dart';
import 'package:fire_shop/pages/member/resigter/register_page.dart';

final loginFunction = (context, {arguments}) => LoginPage();

final registerFunction = (context, {arguments}) => RegisterPage(
  arguments: arguments,
);

final passwordFunction = (context, {arguments}) => PasswordPage(
  phone: arguments["phone"],
);