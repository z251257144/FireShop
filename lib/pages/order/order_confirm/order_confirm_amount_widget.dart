import 'package:flutter/material.dart';

class OrderConfirmAmountWidget extends StatelessWidget {

  final Map amount;

  const OrderConfirmAmountWidget({Key key, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.amount == null) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          this.goodsAmountWidget(),
          this.logisticsAmountWidget(),
        ],
      ),
    );
  }

  // 商品金额
  goodsAmountWidget() {
    double amountTotle = this.amount["amountTotle"].toDouble();
    double amountLogistics = this.amount["amountLogistics"].toDouble();
    return this.singleAmountWidget("商品金额", "￥${amountTotle - amountLogistics}");
  }

  // 运费
  logisticsAmountWidget() {
    return this.singleAmountWidget("运费", "+ ￥${this.amount["amountLogistics"]}");
  }

  singleAmountWidget(title, amount){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title),
        Text(amount)
      ],
    );
  }
}
