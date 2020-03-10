import 'package:fire_shop/model/order/order_detail_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

typedef OrderDetailBottomBarCallBack = void Function(OrderStatus ,int);

class OrderDetailBottomBar extends StatelessWidget {

  final OrderDetailModel model;

  final OrderDetailBottomBarCallBack callback;

  const OrderDetailBottomBar({Key key, this.callback, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (!this.willShowBarButtons()) {
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: this.barButtons()
      ),
    );
  }

  // 是否显示底部按钮
  willShowBarButtons() {
    if (this.model == null) {
      return false;
    }

    return this.model.status == OrderStatus.unpay ||
        this.model.status == OrderStatus.undelivering ||
        this.model.status == OrderStatus.unship ||
        this.model.status == OrderStatus.uncomment;
  }

  // 底部按钮数据
  barButtons() {
    if (this.model.status == OrderStatus.unpay) {
      return this.unpayButtons();
    }
    if (this.model.status == OrderStatus.undelivering) {
      return this.undeliveringButtons();
    }
    if (this.model.status == OrderStatus.unship) {
      return this.unshipButtons();
    }
    if (this.model.status == OrderStatus.uncomment) {
      return this.uncommentButtons();
    }
  }

  // 待支付按钮
  unpayButtons() {
    var payButton = this.highButton("立即支付", (){
      this.callback(this.model.status, 0);
    });
    var closeButton = this.normalButton("取消订单", (){
      this.callback(this.model.status, 1);
    });
    return <Widget>[closeButton, payButton];
  }

  // 待发货按钮
  undeliveringButtons() {
    var closeButton = this.normalButton("退款", (){

    });
    return <Widget>[closeButton];
  }

  // 待收货按钮
  unshipButtons() {
    var payButton = this.highButton("确认收货", (){

    });
    var closeButton = this.normalButton("退款", (){

    });
    return <Widget>[closeButton, payButton];
  }

  // 评价按钮
  uncommentButtons() {
    var payButton = this.highButton("评价", (){

    });
    return <Widget>[payButton];
  }



  highButton(title, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: appCommonColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12
          ),
        ),
      ),
    );
  }

  normalButton(title, onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: appCommonColor,
            width: 1
          )
        ),
        child: Text(title,
          style: TextStyle(
            color: appCommonColor,
            fontSize: 12
          ),
        ),
      ),
    );
  }
}
