import 'package:fire_shop/server/base_server.dart';
import 'package:flutter/material.dart';

class OrderServer extends BaseServer {

  // 获取默认收货地址
  Future fetchDefaultShippingAddress(token) async {
    var param = {"token": token};
    return super.requestGetData("user/shipping-address/default/v2", param: param);
  }



  // 添加地址
  Future fetchAddArrress(token, linkMan, mobile, provinceId, cityId, districtId, address, code) async {
    var param = {"token": token,
      "linkMan":linkMan,
      "mobile": mobile,
      "provinceId": provinceId,
      "cityId": cityId,
      "districtId": districtId,
      "address": address,
      "code": code,
      "isDefault": "true"
    };
    return super.requestGetData("user/shipping-address/add", param: param);
  }








}