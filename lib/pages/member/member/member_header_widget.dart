import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef MemberHeaderCallBack = void Function(int);

class MemberHeaderWidget extends StatelessWidget {
  final MemberHeaderCallBack callBack;

  const MemberHeaderWidget({Key key, this.callBack}) : super(key: key);

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
        create: (context) {
            return UserinfoManager();
        },
        child: Consumer(builder: (context, UserinfoManager provider, child) {
            return provider.isLogin ? this.hasLoginWidget() : this.loginTapWidget();
        }),
      )
    );
  }

  // 已登录界面
  Widget hasLoginWidget() {
    return InkWell(
        onTap: () {
          this.callBack(1);
        },
        child: Container(
            margin: EdgeInsets.fromLTRB(0, 58, 0, 0),
            child: Container(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: UserinfoManager.shared.user.avatarUrl != null ? NetworkImage(UserinfoManager.shared.user.avatarUrl) : AssetImage("images/member/photo_MyAccount.png"),
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

  // 未登录界面
  Widget loginTapWidget() {
    return InkWell(
        onTap: () {
            this.callBack(0);
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

}