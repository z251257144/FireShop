
import 'package:fire_shop/routes/app_routes.dart';

import 'package:fire_shop/view_model/member/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fire_shop/utils/view_util.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginViewModel _viewModel = LoginViewModel();

  bool showPassword = false;

  @override
  void initState() {
//    usernameController.text = "18652905788";
//    passwordController.text = "123456";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("登录"),
        actions: <Widget>[
          FlatButton(
            child: Text("注册", 
              style: TextStyle(
                fontSize: 16
              ),  
            ),
            onPressed: () {
              this.showRegisterPage(context);
            },
          )
        ],
      ),
      body: Container(
        color: Color(0xffF0F1F2),
        child: ListView(
          children: <Widget>[
            this.usernameField(),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15),
              color: Colors.grey,
              height: 0.5,
            ),
            this.passwordField(),
            this.loginButton(),
            this.findPasswordWidget()
          ],
        ),
      ),
    );
  }

  //用户名输入框
  Widget usernameField() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey, 
            width: 0.5,
          )
        )
      ),
      child: TextField(
        controller: this.usernameController,
        maxLength: 11,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          icon: Image.asset("images/member/login_icon_member.png"),
          hintText: "手机号",
          border: InputBorder.none,
          counterText: ""
        ),
      ),
    );
  }

  //密码输入框
  Widget passwordField() {
    return Container(
      height: 52,
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          )
        )
      ),
      child: TextField(
        controller: this.passwordController,
        obscureText: !showPassword,
        maxLength: 20,
        decoration: InputDecoration(
          hintText: "密码",
          border: InputBorder.none,
          icon: Image.asset("images/member/login_icon_password.png"),
          suffixIcon: this.passwordShowWidget(),
          counterText: ""
        ),
      ),
    );
  }

  //密码显示控制按钮
  Widget passwordShowWidget() {
    return IconButton(
      icon: this.showPassword ? Image.asset("images/member/login_icon_see.png") : Image.asset("images/member/login_icon_hide.png"),
      onPressed: () {
        this.setState((){
          showPassword = !showPassword;
        });
        print("show password");
      },
    );
  }

  //登录按钮
  Widget loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 48,
      child: FlatButton(
        color: Color(0xffB4282D),
        child: Text("登录"),
        textColor: Colors.white,
        onPressed: () {
          this.doLogin();
        },
      ),
    );
  }

  //找回密码按钮
  Widget findPasswordWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
//      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            this.showPasswordPage();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Text("找回密码"),
          ),
        ),
      )

      ,
    );
  }
  
  // 显示注册页面
  showRegisterPage(BuildContext context) {
    Navigator.of(context).pushNamed(RoutePath.register, arguments: {"phone":this.usernameController.text}).then((value){
      print(value);
      if (value != null) {
        var phone = (value as Map)["phone"];
        var password = (value as Map)["password"];
        this.usernameController.text = phone;
        this.passwordController.text = password;
        this.doLogin();
      }
    });
  }

  showPasswordPage() {
    Navigator.of(context).pushNamed(RoutePath.password, arguments: {"phone":this.usernameController.text});
  }

  //登录方法
  doLogin() {

    // 隐藏键盘
    FocusScope.of(context).requestFocus(FocusNode());

    var phone = this.usernameController.text;
    if ( !_viewModel.checkPhone(phone) ) {return;}

    var password = this.passwordController.text;
    if (!_viewModel.checkPassword(password)) {return;}

    showLoadingView(context);

    _viewModel.doLogin(phone, password).then((result){
      print(result);
      Future.delayed(Duration(seconds: 1), (){
        Navigator.of(context).pop();
      });
    }).catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }
}