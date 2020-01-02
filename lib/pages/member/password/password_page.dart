import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/view_util.dart';
import 'package:fire_shop/view_model/member/password_view_model.dart';
import 'package:fire_shop/widgets/common_input_bg_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';

class PasswordPage extends StatefulWidget {
  final String phone;

  const PasswordPage({Key key, this.phone}) : super(key: key);

  @override
  _PasswordPageState createState() => _PasswordPageState(phone);
}

class _PasswordPageState extends State<PasswordPage> {
  final String phone;

  _PasswordPageState(this.phone);

  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  PasswordViewModel viewModel = PasswordViewModel();

  Timer countTimer;
  String codeButtonTitle = "获取验证码";
  int count = 60;
  bool codeButtonEnable = true;

  @override
  void initState() {
    this.phoneController.text = this.phone;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (this.countTimer != null) {
      this.countTimer.cancel();
      this.countTimer = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCommonBackgroudColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("找回密码"),
      ),
      body: ListView(
        children: <Widget>[
          // Container(height: 25,),
          this.phoneTextField(),
          this.codeTextField(),
          this.passwordTextField(),
          this.passwordButton()
        ],
      ),
    );
  }

  Widget phoneTextField() {
    var textField = TextField(
      maxLength: 11,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        icon: Image.asset("images/member/login_icon_member.png"),
        hintText: "手机号",
        border: InputBorder.none,
        counterText: "",
      ),
    );
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Colors.grey,
              width: 0.5
          )
        )
      ),
      child: CommonInputBgWidget(subWidget: textField),
    );
  }

  Widget codeTextField() {
    var textField = TextField(
      maxLength: 6,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: "验证码",
        border: InputBorder.none,
        counterText: ""
      ),
    );

    var codeWidget = Row(
      children: <Widget>[
        Expanded(child: textField),
        FlatButton(
          disabledColor: Colors.grey,
          color: appCommonColor,
          child: Text("获取验证码",
            style: TextStyle(
              color: codeButtonEnable ? Colors.white : Colors.grey
            ),
          ),
          onPressed: (){
            this.getVerificationCode();
          }
        ),
      ],
    );
    return CommonInputBgWidget(subWidget: codeWidget);
  }

  Widget passwordTextField() {
    TextField codeField = TextField(
      controller: this.passwordController,
      decoration: InputDecoration(
        hintText: "密码",
        icon: Icon(Icons.lock_outline),
        border: InputBorder.none,
      ),
      obscureText: true,
    );
    return CommonInputBgWidget(subWidget: codeField);
  }

  Widget passwordButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      height: 48,
      child: FlatButton(
        color: appCommonColor,
        textColor: Colors.white,
        child: Text("立即重置", style: TextStyle(fontSize: 16),),
        onPressed: () {
          this.resetPassword();
        },
      ),
    );
  }

  // 获取验证码
  getVerificationCode() {
    var phone = this.phoneController.text;
    if (viewModel.checkPhone(phone)) {
      this.fetchPhoneCode(phone);
    }
  }

  // 获取验证码
  fetchPhoneCode(phone) async {
    var phone = this.phoneController.text;
    if (!viewModel.checkPhone(phone)) { return; }

    showLoadingView(context);

    this.viewModel.getSmsCode(phone).then((result){
      Fluttertoast.showToast(msg: "验证码已发送，请注意查收");
      this.regetCodeCountdown();
    }).catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }

  // 获取验证码按钮倒计时
  regetCodeCountdown() {
    if (this.countTimer != null) {
      return;
    }

    this.count = 60;
    String title = "获取验证码";
    this.countTimer = Timer.periodic(Duration(seconds: 1), (timer){
      if (this.count > 0) {
        title = "${this.count}秒后重新获取";
      }
      else if (this.count == 0) {
        title = "获取验证码";
      }

      this.count--;

      this.codeButtonEnable = this.count < 0;

      setState(() {
        this.codeButtonTitle = title;

        if (this.count < 0) {
          debugPrint("定时器已销毁");
          this.countTimer.cancel();
          this.countTimer = null;
        }
      });
    });
  }

  // 重置密码
  resetPassword() {
    FocusScope.of(context).requestFocus(FocusNode());

    var phone = this.phoneController.text;
    if (!viewModel.checkPhone(phone)) { return; }

    var code = this.codeController.text;
    if (!viewModel.checkSmsCode(code)) { return; }

    var password = this.passwordController.text;
    if (!viewModel.checkPassword(password)) { return; }

    showLoadingView(context);

    this.viewModel.resetPassword(phone, code, password).then((result){
      Future.delayed(Duration(seconds: 1), (){
        Navigator.of(context).pop({"phone":phone, "password": password});
      });
    }).catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }
}
