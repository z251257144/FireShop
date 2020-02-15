import 'package:fire_shop/server/base_server.dart';
import 'package:fire_shop/utils/string_uril.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/device_util.dart';

class CartServer extends BaseServer {
  // 加入购物车
  Future fetchCartAdd(param) async {
    return super.requestPostData("/shopping-cart/add", param: param);
  }

  // 读取购物车数据
  Future fetchCartData(token) async {
    var param = {"token": token};
    return super.requestGetData("/shopping-cart/info", param: param);
  }

  // 购物车修改购买数量
  Future fetchModifyCartNumber(key, number, token) async {
    var param = Map<String, dynamic>();
    if (StringUtil.isNotEmpty(token)) {
      param["token"] = token;
    }
    param["key"] = key;
    param["number"] = number;
    return super.requestPostData("/shopping-cart/modifyNumber", param: param);
  }
}