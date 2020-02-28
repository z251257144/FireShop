import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/pages/order/order_confirm/order_confirm_ship_widget.dart';
import 'package:fire_shop/view_model/order/order_confirm_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/pages/order/order_detail/order_goods_list_view.dart';
import 'package:provider/provider.dart';

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
  final OrderConfirmViewModel _viewModel = OrderConfirmViewModel();

  _OrderConfirmPageState(this.goodsList);

  @override
  void initState() {
    // TODO: implement initState
    _viewModel.fetchDefaultShippingAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("确认订单"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            OrderGoodsListView(goodsList: goodsList),
            this.shipWidget(),
          ],
        ),
      ),
    );
  }

  Widget shipWidget() {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer(builder: (BuildContext context, OrderConfirmViewModel value, Widget child) {
        return OrderConformShipWidget(model: _viewModel.address);
      }),
    );
  }
}
