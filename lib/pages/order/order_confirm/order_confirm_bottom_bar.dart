import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';


class OrderConfirmBottomBar extends StatelessWidget {

  final Map amount;

  final GestureTapCallback callback;

  const OrderConfirmBottomBar({Key key, this.callback, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.amount == null) {
      return Container();
    }

    double bottom = MediaQuery.of(context).padding.bottom;
    return Container(
      height: (48+bottom),
      padding: EdgeInsets.fromLTRB(15, 0, 15, bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("￥${this.amount["amountTotle"]}",
            style: TextStyle(
              color: appCommonColor,
              fontSize: 20
            ),
          ),
          this.submitButton()
        ],
      ),
    );
  }

  submitButton() {
    return InkWell(
      onTap: () {
        if (this.callback != null) {
          this.callback();
        }
      },
      child: Container(
        width: 100,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appCommonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text("提交订单",
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    );

  }
}
