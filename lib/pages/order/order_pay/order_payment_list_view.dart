import 'package:flutter/material.dart';

class OrderPaymentListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.headerView(),
          this.paymentItemView("images/order/weixin_pay.jpg", "微信支付"),
          this.paymentItemView("images/order/zhifubao.jpg", "支付宝")
        ],
      ),
    );
  }

  headerView() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Text("支付方式"),
    );
  }

  paymentItemView(icon, title){
    return Container(
      height: 52,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Colors.black12,
                  width: 0.5
              )
          )
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(icon, width: 30, height: 30)
          ),
          Expanded(child: Text(title)),
          Image.asset("images/member/arrow-right.png", width: 10, height: 19)
        ],
      ),

    );
  }
}
