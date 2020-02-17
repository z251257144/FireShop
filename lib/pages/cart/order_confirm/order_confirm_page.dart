import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/pages/cart/order_detail/order_goods_list_view.dart';

class OrderConfirmPage extends StatefulWidget {

  final List<CartGoodsModel> goodsList;

  const OrderConfirmPage({Key key, this.goodsList}) : super(key: key);

  @override
  _OrderConfirmPageState createState() => _OrderConfirmPageState(
    goodsList
  );
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {

  final List<CartGoodsModel> goodsList;

  _OrderConfirmPageState(this.goodsList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("确认订单"),
      ),
      body: Container(
        child: OrderGoodsListView(goodsList: goodsList,),
      ),
    );
  }
}
