import 'package:fire_shop/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {

  final String image;
  final String title;

  final GestureTapCallback callback;

  const EmptyView({
    Key key,
    this.image = "images/member/profile_dfunding.png",
    this.title = "暂无数据",
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
//        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            imageView(),
            infoLabel(),
            button()
          ],
        )
      ),
    );
  }

  imageView() {
    return Container(
      child: Image.asset(image),
    );
  }

  infoLabel() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
      child: Text(title,
        textAlign: TextAlign.center,
        maxLines: 5,
      ),
    );
  }

  button() {
    if (callback == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: RaisedButton(
        onPressed: (){
          callback();
        },
        color: appCommonColor,
        child: Text("立即登录",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      )
    );
  }
}
