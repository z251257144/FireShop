import 'package:flutter/material.dart';
import 'package:fire_shop/utils/const.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();

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
          this.emailTextField(),
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
  Widget emailTextField() {
    Widget eamilField = TextField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: "邮箱",
        icon: Icon(Icons.email),
        border: InputBorder.none
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
            decoration: InputDecoration(
              hintText: "验证码",
              icon: Icon(Icons.collections),
              border: InputBorder.none
            ),
          )
        ),
        Container(
          child: FlatButton(
            child: Text("获取验证码"),
            onPressed: () {
              this.getVerificationCode();
            },
          ),
        )
      ],
    );
    return this.commonBgWidget(subWidget: codeField);
  }

  // 密码输入框
  Widget passwordTextField() {
    TextField codeField = TextField(
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

        },
      ),
    );
  }

  // 获取验证码
  getVerificationCode() {
    var email = this.emailController.text;
    print(email);
  }
}