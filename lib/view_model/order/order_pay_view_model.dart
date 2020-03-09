import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/order/order_detail_model.dart';
import 'package:fire_shop/server/order_server.dart';
import 'package:flutter/material.dart';

class OrderPayViewModel with ChangeNotifier {

  OrderServer _server = OrderServer();
  String orderId;

  OrderDetailModel model;

  // 获取订单详情
  Future fetchOrderDetail() async {
    var token = UserinfoManager.shared.user.token;
    var res = await _server.fetchOrderDetail(token, orderId);
    Map orderInfo = res["orderInfo"];
    this.model = OrderDetailModel.fromJson(orderInfo);
    notifyListeners();
  }

}