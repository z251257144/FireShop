
import 'package:fire_shop/pages/order/add_order/add_order_page.dart';
import 'package:fire_shop/pages/order/order_detail/order_detail_page.dart';
import 'package:fire_shop/pages/order/order_list/order_list_page.dart';
import 'package:fire_shop/pages/order/order_confirm/order_confirm_page.dart';

final orderListFunction = (context, {arguments}) {
  return OrderListPage(
    orderIndex: arguments["orderIndex"],
  );
};

final addOrderFunction = (context, {arguments}) => AddOrderPage(
);

// ignore: top_level_function_literal_block
final orderConfirmFunction = (context, {arguments}) {
  return OrderConfirmPage(
      goodsList: arguments["goodsList"]
  );
};


// ignore: top_level_function_literal_block
final orderDetailFunction = (context, {arguments}) {
  return OrderDetailPage(
      orderId: arguments["orderId"].toString()
  );
};

