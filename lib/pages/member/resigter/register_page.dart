import 'dart:async';

import 'package:fire_shop/view_model/member/resigter_view_model.dart';
import 'package:fire_shop/widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/validator_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dio/dio.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nickController = TextEditingController();
  
  RegisterViewModel viewModel = RegisterViewModel();

  Timer countTimer;
  String codeButtonTitle = "获取验证码";
  int count = 60;
  bool codeButtonEnable = true;

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
        title: Text("注册"),
      ),
      body: ListView(
        children: <Widget>[
          // Container(height: 25,),
          this.phoneTextField(),
          this.codeTextField(),
          this.passwordTextField(),
          this.nickTextField(),
          this.registerButton()
        ],
      ),
    );
  }

  Widget commonBgWidget({Widget subWidget, bool fullLine = false}) {
    var border = Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 0.5
      )
    );

    return Container(
      height: appCommonTextFieldHeight,
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: fullLine ? border : null
      ),
      child: Container(
        decoration: BoxDecoration(
          border: fullLine ?  null : border
        ),
        child: subWidget,
      ),
    );
  }

  // 邮箱输入框
  Widget phoneTextField() {
    Widget eamilField = TextField(
      controller: phoneController,
      maxLength: 11,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "手机号",
        icon: Icon(Icons.phone_iphone),
        border: InputBorder.none,
        counterText: ""
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
      child: this.commonBgWidget(subWidget: eamilField),
    );
  }

  // 验证码输入框
  Widget codeTextField() {
    Row codeField = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: this.codeController,
            maxLength: 6,
            decoration: InputDecoration(
              hintText: "验证码",
              icon: Icon(Icons.collections),
              border: InputBorder.none,
              counterText: ""
            ),
          )
        ),
        Container(
          child: FlatButton(
            disabledTextColor: Colors.grey,
            textColor: appCommonColor,
            child: Text(this.codeButtonTitle),
            onPressed: !this.codeButtonEnable ? null : (){
              this.getVerificationCode();
            }
          ),
        )
      ],
    );
    return this.commonBgWidget(subWidget: codeField);
  }

  // 密码输入框
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
    return this.commonBgWidget(subWidget: codeField);
  }

  // 昵称输入框
  Widget nickTextField() {
    TextField codeField = TextField(
      controller: this.nickController,
      decoration: InputDecoration(
        hintText: "昵称",
        icon: Icon(Icons.perm_contact_calendar),
        border: InputBorder.none,
      ),
    );
    return this.commonBgWidget(subWidget: codeField, fullLine: true);
  }

  Widget registerButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      height: 48,
      child: FlatButton(
        color: appCommonColor,
        textColor: Colors.white,
        child: Text("注册", style: TextStyle(fontSize: 16),),
        onPressed: () {
          this.registerUser();
        },
      ),
    );
  }

  // 获取验证码
  getVerificationCode() {
    var phone = this.checkPhone();
    if (phone != null) {
      this.fetchPhoneCode(phone);
    }
  }

  // 获取验证码按钮倒计时
  regetCodeCountdown() {
    if (this.countTimer != null) {
      return;
    }

    this.count = 5;
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

  // 获取邮箱验证码
  fetchPhoneCode(phone) async {
    var phone = this.checkPhone();
    if (phone == null) { return; }

    showDialog(context: context, barrierDismissible: false, builder: (_){
      return LoadingDialog();
    });

    this.viewModel.getSmsCode(phone).then((result){
      Fluttertoast.showToast(msg: "验证码已发送，请注意查收");
    }).catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }

  // 注册用户
  registerUser() {
    var phone = this.checkPhone();
    if (phone == null) { return; }

    var code = this.checkSmsCode();
    if (code == null) { return; }

    showDialog(context: context, barrierDismissible: false, builder: (_){
      return LoadingDialog();
    });

    this.viewModel.getSmsCode(phone).then((result){
      Fluttertoast.showToast(msg: "验证码已发送，请注意查收");
    }).catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }

  // 校验手机号
  String checkPhone() {
    var phone = this.phoneController.text;
    if (phone == null || phone.length == 0) {
      Fluttertoast.showToast(msg: "请输入手机号");
      return null;
    }

    if (!ValidatorUtil.isPhone(phone)) {
      Fluttertoast.showToast(msg: "请输入有效的手机号");
      return null;
    }

    return phone;
  }

  // 校验手机号
  String checkSmsCode() {
    var code = this.codeController.text;
    if (code == null || code.length == 0) {
      Fluttertoast.showToast(msg: "请输入验证码");
      return null;
    }

    if (!ValidatorUtil.isPhone(code)) {
      Fluttertoast.showToast(msg: "请输入有效的验证码");
      return null;
    }

    return code;
  }

  // 校验密码
  String checkPasswordCode() {
    var password = this.passwordController.text;
    if (password == null || password.length == 0) {
      Fluttertoast.showToast(msg: "请输入密码");
      return null;
    }

    return password;
  }
}