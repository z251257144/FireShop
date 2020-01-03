import 'package:fire_shop/server/user_server.dart';

class MemeberViewModel {
  final List orderData = [
    {
      "title": "待付款",
      "icon": "images/member/orderform_pay.png",
      "type": 1,
    },
    {
      "title": "待发货",
      "icon": "images/member/orderform_ship.png",
      "type": 1,
    },
    {
      "title": "待收货",
      "icon": "images/member/delivering.png",
      "type": 1,
    },
    {
      "title": "待评价",
      "icon": "images/member/orderform.png",
      "type": 1,
    }
  ];

  final functionData = [
    {
      "title": "我的余额",
      "value": "0 元",
      "icon": "images/member/profile_tegral.png",
      "type": 1,
    },
    {
      "title": "我的积分",
      "value": "3 积分",
      "icon": "images/member/jifen.png",
      "type": 1,
    },
    {
      "title": "我的礼券",
      "icon": "images/member/profile_ticket.png",
      "type": 1,
    },
    {
      "title": "我的收藏",
      "icon": "images/member/profile_collection.png",
      "type": 1,
    },
    {
      "title": "我的地址",
      "icon": "images/member/profile_address.png",
      "type": 1,
    }
  ];


}