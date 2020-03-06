import 'package:fire_shop/server/base_server.dart';
import 'package:flutter/material.dart';

class OrderServer extends BaseServer {

  // 获取默认收货地址
  Future fetchDefaultShippingAddress(token) async {
    var param = {"token": token};
    return super.requestGetData("user/shipping-address/default/v2", param: param);
  }

  // 创建订单[下单]
  Future fetchCreateOrder(param) async {
    return super.requestPostData("order/create", param: param);
  }

  // 获取订单统计
  Future fetchOrderStatistics(token) async {
    var param = {"token": token};
    return super.requestGetData("order/statistics", param: param);
  }

  // 获取订单列表
  Future fetchOrderList(param) async {
    return super.requestPostData("order/list", param: param);
  }

  // 获取订单详情
  Future fetchOrderDetail(token, orderId) async {
    var param = {"token": token, "id": orderId};
    return super.requestPostData("order/detail", param: param);
  }








}