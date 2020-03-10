
import 'dart:convert';

import 'package:fire_shop/manager/cart_manager.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/address_model.dart';
import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/server/cart_server.dart';
import 'package:fire_shop/server/order_server.dart';
import 'package:flutter/cupertino.dart';

class OrderConfirmViewModel with ChangeNotifier {
  var _server = OrderServer();
  CartServer _cartServer = CartServer();

  List<CartGoodsModel> goodsList;
  bool fromCart = false;

  AddressModel address;

  Map amount;

  // 获取默认收货地址
  Future fetchDefaultShippingAddress() async {
    var token = UserinfoManager.shared.user.token;
    var res = await _server.fetchDefaultShippingAddress(token);
    this.address = AddressModel.fromJson(res["info"]);
    notifyListeners();

    this.fetchCalculateOrderAmount();
  }

  // 拼接订单参数
  getOrderParam() {
    var token = UserinfoManager.shared.user.token;
    var param = {"token": token};
    param["address"] = this.address.address;
    param["cityId"] = this.address.cityId;
    param["code"] = this.address.code;
    param["districtId"] = this.address.districtId;
    param["linkMan"] = this.address.linkMan;
    param["mobile"] = this.address.mobile;
    param["provinceId"] = this.address.provinceId;
    param["goodsJsonStr"] = this.getGoodsParam();

    return param;
  }

  // 拼接商品参数
  getGoodsParam() {
    var goodsParam = [];
    for (CartGoodsModel model in this.goodsList ) {
      Map<String, dynamic> param = {"goodsId":model.goodsId,
        "number":model.number,
        "logisticsType":0};
      if (model.sku != null) {
        // 有SKU信息
        List<String> list = model.sku.map((item){
          return "${item.optionId}:${item.optionValueId}";
        }).toList();
        param["propertyChildIds"] = list.join(",");
      }
      goodsParam.add(param);
    }
    return jsonEncode(goodsParam);
  }

  // 计算订单价格
  Future fetchCalculateOrderAmount() async {
    var param = this.getOrderParam();
    param["calculate"] = "true";
    var res = await _server.fetchCreateOrder(param);
    this.amount = res;
    notifyListeners();
  }

  // 创建订单
  Future fetchCreateOrder() async {
    var param = this.getOrderParam();
    print(param);

    try {
      var res = await _server.fetchCreateOrder(param);

      if (this.fromCart != null && this.fromCart) {
        // 删除购物车已下单记录
        var keys = this.goodsList.map((item){
          return item.key;
        }).toList();
        CartManager.shared.removeCartRecord(keys);
      }
      return res;
    }
    catch (err){
      return err;
    }
  }




}