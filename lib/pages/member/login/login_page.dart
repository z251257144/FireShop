
import 'package:fire_shop/pages/member/resigter/register_page.dart';

import 'package:fire_shop/view_model/member/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/validator_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fire_shop/widgets/LoadingWidget.dart';

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
    usernameController.text = "18652905788";
    passwordController.text = "123456";
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
            this.loginButton()
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
  
  // 显示注册页面
  showRegisterPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return RegisterPage();
      }
    ));
  }

  //登录方法
  doLogin() {
    var phone = this.usernameController.text;
    if (phone == null || phone.length == 0 ) {
      Fluttertoast.showToast(msg: "请输入手机号");
      return;
    }
    else if (!ValidatorUtil.isPhone(phone)) {
      Fluttertoast.showToast(msg: "请输入有效的11位手机号");
      return;
    }

    var password = this.passwordController.text;
    if (password == null || password.length == 0 ) {
      Fluttertoast.showToast(msg: "请输入密码");
      return;
    }

    print("开始登录");
    print({"username": this.usernameController.text, "password": this.passwordController.text});

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return LoadingDialog(
            outsideDismiss: false,
          );
        });

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