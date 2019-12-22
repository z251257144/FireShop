import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/pages/member/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: ChangeNotifierProvider(
        builder: (context) {
            return UserinfoManager();
        },
        child: Consumer(builder: (context, UserinfoManager provider, child) {
            return provider.isLogin ? this.hasLoginWidget(context) : this.loginTapWidget(context);
//          return provider.isLogin ? Text("已登录") : Text("未登录");
        }),
      )
    );
  }

  Widget hasLoginWidget(context) {
    return InkWell(
        onTap: () {
          print("logout");
          this.logout(context);
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 58, 0, 0),
            child: Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(UserinfoManager.shared.user.avatarUrl),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 200,
                      height: 35,
                      alignment: Alignment.center,
                      child: Text(UserinfoManager.shared.user.mobile,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }

  Widget loginTapWidget(context) {
    return InkWell(
        onTap: () {
            print("login");
            this.showLoginPage(context);
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 58, 0, 0),
            child: Container(
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
            )
        )
    );
  }

  void logout(context) {
    var alert = CupertinoAlertDialog(
      title: Text("是否退出登录?"),
      actions: <Widget>[
        CupertinoButton(child: Text("取消"), onPressed: (){
          Navigator.pop(context);
        }),
        CupertinoButton(child: Text("确定"), onPressed: (){
          UserinfoManager.shared.setLoginInfo(null);
          Navigator.pop(context);
        }),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
  /* 显示登录界面 */
  void showLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LoginPage();
      }
    ));
  }
}