
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/address_model.dart';
import 'package:fire_shop/server/order_server.dart';
import 'package:flutter/cupertino.dart';

class OrderConfirmViewModel with ChangeNotifier {
  var _server = OrderServer();

  AddressModel address;

  // 获取默认收货地址
  Future fetchDefaultShippingAddress() async {
    var token = UserinfoManager.shared.user.token;
    var res = await _server.fetchDefaultShippingAddress(token);
    this.address = AddressModel.fromJson(res["info"]);
    print(this.address);
    notifyListeners();
  }

}