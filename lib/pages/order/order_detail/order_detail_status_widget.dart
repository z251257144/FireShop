import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

class OrderDetailStatusWidget extends StatelessWidget {

  final int status;
  final String statusStr;

  const OrderDetailStatusWidget({Key key, this.status, this.statusStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.status == null || this.statusStr == null) {
      return Container();
    }

    return Container(
      height: 60,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Image.asset("images/order/icon-ddgb.png", width: 40, height: 40,),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(this.statusStr,
              style: TextStyle(
                color: appCommonColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
