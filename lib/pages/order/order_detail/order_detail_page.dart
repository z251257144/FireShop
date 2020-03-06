import 'package:fire_shop/pages/order/order_detail/order_detail_status_widget.dart';
import 'package:fire_shop/pages/order/order_detail/order_goods_list_view.dart';
import 'package:fire_shop/view_model/order/order_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatefulWidget {

  final String orderId;

  const OrderDetailPage({Key key, this.orderId}) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState(this.orderId);
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final String orderId;

  OrderDetailViewModel _viewModel = OrderDetailViewModel();

  _OrderDetailPageState(this.orderId);

  @override
  void initState() {
    // TODO: implement initState
    _viewModel.orderId = this.orderId;
    _viewModel.fetchOrderDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("订单详情"),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          this.statusView(),
          this.goodsView()
        ],
      ),
    );
  }

  // 订单状态界面
  statusView() {
    return OrderDetailStatusWidget();
  }

  // 商品界面
  goodsView() {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer(builder: (context, OrderDetailViewModel viewModel, child){
        return OrderGoodsListView(goodsList: _viewModel.goodsList,);
      }),
    );
  }
}
