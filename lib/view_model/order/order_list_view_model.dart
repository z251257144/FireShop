
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/order/order_list_model.dart';
import 'package:fire_shop/server/order_server.dart';
import 'package:fire_shop/utils/map_util.dart';
import 'package:flutter/cupertino.dart';

// 订单列表状态配置
final List _orderTypeConfig = [
  {
    "title": "全部",
    "type": "",
  },
  {
    "title": "待付款",
    "type": "0",
  },
  {
    "title": "待发货",
    "type": "1",
  },
  {
    "title": "待收货",
    "type": "2",
  },
  {
    "title": "待评价",
    "type": "3",
  }
];

class OrderListViewModle with ChangeNotifier {
  OrderServer _server = OrderServer();

  int page = 0;

  List orderTypeConfig = _orderTypeConfig;
  int typeIndex = 0;

  List<OrderListModel> orderList;

  // 获取订单列表
  Future fetchOrderList() async {
    var token = UserinfoManager.shared.user.token;
    var param = {"token": token, "page": page};
    param["status"] = this.orderTypeConfig[this.typeIndex]["type"];
    try {
      var res = await _server.fetchOrderList(param);
      List tempOrderList = res["orderList"];
      Map goodsMap = res["goodsMap"];
      this.orderList = tempOrderList.map((item){
        OrderListModel orderListModel = OrderListModel.fromJson(item);
        orderListModel.goodsList = goodsMap[orderListModel.id.toString()];
        return orderListModel;
      }).toList();
    }
    catch (err) {
      this.orderList = [];
    }
    notifyListeners();
    return "";
  }

}