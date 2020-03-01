
import 'dart:convert';

import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/address_model.dart';
import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/server/order_server.dart';
import 'package:flutter/cupertino.dart';

class OrderConfirmViewModel with ChangeNotifier {
  var _server = OrderServer();

  List<CartGoodsModel> goodsList;

  AddressModel address;

  // 获取默认收货地址
  Future fetchDefaultShippingAddress() async {
    var token = UserinfoManager.shared.user.token;
    var res = await _server.fetchDefaultShippingAddress(token);
    this.address = AddressModel.fromJson(res["info"]);
    print(this.address);
    notifyListeners();
  }

  getCreateOrderParam() {
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

  getGoodsParam() {
    var goodsParam = [];
    for (CartGoodsModel model in this.goodsList ) {
      Map<String, dynamic> param = {"goodsId":model.goodsId,
                  "number":model.number,
                  "logisticsType":0};
      List<String> list = model.sku.map((item){
        return "${item.optionId}:${item.optionValueId}";
      }).toList();
      param["propertyChildIds"] = list.join(",");
      goodsParam.add(param);
    }
    return jsonEncode(goodsParam);
  }

  // 创建订单
  Future fetchCreateOrder() async {
    var param = this.getCreateOrderParam();
    print(param);
    var res = await _server.fetchCreateOrder(param);
    print(res);
    notifyListeners();
  }

}