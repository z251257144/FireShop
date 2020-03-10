import 'package:fire_shop/model/order/order_detail_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

class OrderDetailAmountWidget extends StatelessWidget {
  final OrderDetailModel model;

  const OrderDetailAmountWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.model == null) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          this.goodsAmountWidget(),
          this.logisticsAmountWidget(),
          this.realAmountWidget()
        ],
      ),
    );
  }

  // 商品金额
  goodsAmountWidget() {
    return this.singleAmountWidget("商品金额", "￥${this.model.amount}", Colors.black);
  }

  // 运费
  logisticsAmountWidget() {
    return this.singleAmountWidget("运费", "+ ￥${this.model.amountLogistics}", Colors.black);
  }

  // 实付金额
  realAmountWidget() {
    return this.singleAmountWidget("实付金额", "￥${this.model.amountReal}", appCommonColor);
  }

  singleAmountWidget(title, amount, color){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title),
        Text(amount,
          style: TextStyle(
            color: color
          )
        )
      ],
    );
  }

}
