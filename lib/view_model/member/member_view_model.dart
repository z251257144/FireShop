import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/member_model.dart';
import 'package:fire_shop/server/order_server.dart';
import 'package:fire_shop/server/user_server.dart';
import 'package:flutter/cupertino.dart';

final List _orderData = [
  {
    "title": "待付款",
    "icon": "images/member/orderform_pay.png",
    "type": 1,
  },
  {
    "title": "待发货",
    "icon": "images/member/orderform_ship.png",
    "type": 2,
  },
  {
    "title": "待收货",
    "icon": "images/member/delivering.png",
    "type": 3,
  },
  {
    "title": "待评价",
    "icon": "images/member/orderform.png",
    "type": 4,
  }
];

final _functionData = [
  {
    "title": "我的余额",
    "value": "0 元",
    "icon": "images/member/profile_tegral.png",
    "type": 11,
  },
  {
    "title": "我的积分",
    "value": "3 积分",
    "icon": "images/member/jifen.png",
    "type": 12,
  },
  {
    "title": "我的礼券",
    "icon": "images/member/profile_ticket.png",
    "type": 13,
  },
  {
    "title": "我的收藏",
    "icon": "images/member/profile_collection.png",
    "type": 14,
  },
  {
    "title": "我的地址",
    "icon": "images/member/profile_address.png",
    "type": 15,
  }
];

class MemberViewModel with ChangeNotifier {

  /*使用单例模式管理用户信息*/
  static final MemberViewModel _instance = MemberViewModel._internal();

  MemberViewModel._internal() {
    initData();
  }

  factory MemberViewModel() => _instance;

  static MemberViewModel get shared => _instance;

  List<MemberModel> orderData;

  List<MemberModel> functionData;

  OrderServer _orderServer = OrderServer();

  initData() {
    orderData = _orderData.map<MemberModel>((item) => MemberModel.fromData(item))
        .toList();
    print(orderData);

    functionData = _functionData.map((item) {
      return MemberModel.fromData(item);
    }).toList();
  }

  fetchOrderStatistics() async {
    if (UserinfoManager.shared.isLogin) {
      var token = UserinfoManager.shared.user.token;
      var res = await _orderServer.fetchOrderStatistics(token);

      for (MemberModel model in this.orderData) {
        if (model.memberType == MemberType.orderPay) {
          model.value = res["count_id_no_pay"].toString();
        }
        else if (model.memberType == MemberType.orderDelivering) {
          model.value = res["count_id_no_transfer"].toString();
        }
        else if (model.memberType == MemberType.orderShip) {
          model.value = res["count_id_no_confirm"].toString();
        }
        else if (model.memberType == MemberType.orderComment) {
          model.value = res["count_id_no_reputation"].toString();
        }
      }
      print(res);
    }


  }
}