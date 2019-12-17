import 'package:fire_shop/pages/member/login/login_page.dart';
import 'package:flutter/material.dart';

class MemberHeaderWidget extends StatelessWidget {
  const MemberHeaderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/member/user-bg.jpg"),
          fit: BoxFit.cover
        )
      ),
      child: InkWell(
        onTap: () {
          print("login");
          this.showLoginPage(context);
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 58, 0, 0),
          child: loginTapWidget(),
        ),
      ),
    );
  }

  Widget loginTapWidget() {
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset("images/member/my_account0.png", width: 56,),
          Container(
            margin: EdgeInsets.only(top: 10),
            width: 200,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: BorderRadius.circular(4)
            ),
            child: Text("请登录", style: TextStyle(
              color: Colors.white
            ),),
          )
        ],
      )
    );
  }

  void showLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      }
    ));
  }
}