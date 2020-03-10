import 'dart:async';

import 'package:fire_shop/model/order/order_detail_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

typedef PayEndCallBack = void Function();

// 订单信息界面（保护剩余时间、编号、金额）
class OrderPayInfoWidget extends StatefulWidget {

  final OrderDetailModel model;
  final PayEndCallBack callBack;

  const OrderPayInfoWidget({Key key, this.model, this.callBack}) : super(key: key);

  @override
  _OrderPayInfoWidgetState createState() => _OrderPayInfoWidgetState(this.model, this.callBack);
}

class _OrderPayInfoWidgetState extends State<OrderPayInfoWidget> {

  final OrderDetailModel model;
  final PayEndCallBack callBack;

  _OrderPayInfoWidgetState(this.model, this.callBack);

  Duration payDifferenceDuration;
  Timer _payTimer;

  @override
  void initState() {
    this.parsePayDifferenceDuration();
    this.startTimer();

    super.initState();
  }

  @override
  void dispose() {
    _payTimer?.cancel();
    _payTimer = null;
    super.dispose();
  }

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
          Text(this.getPayDifferenceTimeString()),
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
          Text(this.model.id.toString())
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
          Text("￥ ${this.model.amountReal}",
            style: TextStyle(
                color: appCommonColor
            )
          )
        ],
      ),
    );
  }

  startTimer() {
    if (this._payTimer != null) {
      return;
    }
    this._payTimer = Timer.periodic(new Duration(seconds: 1), (timer) {
      this.parsePayDifferenceDuration();
    });
  }

  // 获取剩余支付时间
  parsePayDifferenceDuration(){
    DateTime dateClose = DateTime.parse(this.model.dateClose);
    DateTime dateNow = DateTime.now().add(Duration(hours: 8));

    this.payDifferenceDuration = dateClose.difference(dateNow);

    if (this.payDifferenceDuration.inSeconds <= 0) {
      this._payTimer?.cancel();
      this._payTimer = null;
      this.callBack();
    }

    setState(() {
    });
  }

  getPayDifferenceTimeString() {
    if (this.payDifferenceDuration == null) {
      return "已关闭";
    }

    int hours = this.payDifferenceDuration.inHours;
    int minutes = this.payDifferenceDuration.inMinutes;
    int seconds = this.payDifferenceDuration.inSeconds;

    if (seconds <= 0) {
      return "";
    }

    if (hours <= 0) {
      return "${minutes}分 ${seconds-minutes*60}秒";
    }

    return "${hours}时 ${minutes-hours*60}分 ${seconds-minutes*60}秒";
  }
}
