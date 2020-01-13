import 'package:fire_shop/routes/cart_route.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/pages/index_page.dart';
import 'route_path.dart';
import 'member_route.dart';
import 'goods_toute.dart';
export 'route_path.dart';

//配置命名路由信息
final routes = {
  //如果需要传参，那么在配置的时候加上{arguments}；如果不需要传参，则不用加{arguments}
  RoutePath.root: (context) => IndexPage(),
  RoutePath.login: loginFunction,
  RoutePath.register: registerFunction,
  RoutePath.password: passwordFunction,

  RoutePath.orderList: orderListFunction,

  RoutePath.addressList: addressListFunction,
  RoutePath.addAddress: addAddressFunction,

  RoutePath.goodsDetail: goodsDetailFunction,
};

//统一处理命名路由
// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    //能寻找到对应的路由
    if (settings.arguments != null) {
      //页面跳转前有传参
      final Route route = MaterialPageRoute( builder: (context) =>
          pageContentBuilder(context, arguments: settings.arguments)
      );
      return route;
    }
    else {
      //页面跳转前没有传参
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }

  return null;
};