import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

// 订单信息界面（保护剩余时间、编号、金额）
class OrderPayInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          this.timeView(),
          this.orderNumberWidget(),
          this.orderAmountWidget(),
        ],
      ),
    );
  }

  // 支付剩余时间
  timeView(){
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        children: <Widget>[
          Text("剩余时间",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black45
            ),
          ),
          Text("20分15秒"),
        ],
      ),
    );
  }

  // 订单编号
  orderNumberWidget() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("订单编号"),
          Text("12123234")
        ],
      ),
    );
  }

  //  订单金额
  orderAmountWidget() {
    return Container(
      height: 44,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("订单金额"),
          Text("￥ 121",
            style: TextStyle(
                color: appCommonColor
            )
          )
        ],
      ),
    );
  }
}
