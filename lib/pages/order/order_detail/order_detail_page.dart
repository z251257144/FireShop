import 'package:fire_shop/model/order/order_detail_model.dart';
import 'package:fire_shop/pages/order/order_detail/order_detail_address_widget.dart';
import 'package:fire_shop/pages/order/order_detail/order_detail_amount_widget.dart';
import 'package:fire_shop/pages/order/order_detail/order_detail_bottom_bar.dart';
import 'package:fire_shop/pages/order/order_detail/order_detail_status_widget.dart';
import 'package:fire_shop/pages/order/order_detail/order_goods_list_view.dart';
import 'package:fire_shop/routes/app_routes.dart';
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
      body: Stack(
        children: <Widget>[
          this.detailContentView(),
          Positioned(
            child: this.bottomBar(),
            bottom: 0,
            left: 0,
            right: 0,
          ),
        ],
      ),
    );
  }

  detailContentView() {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer(builder: (context, OrderDetailViewModel viewModel, child){
        return ListView(
          children: <Widget>[
            this.statusView(),
            this.addressView(),
            this.goodsView(),
            this.amountView()
          ],
        );
      }),
    );
  }



  // 订单状态界面
  statusView() {
    if (_viewModel.model == null) {
      return Container();
    }
    return OrderDetailStatusWidget(
      status: _viewModel.model.status.value,
      statusStr: _viewModel.model.statusStr,
    );
  }

  // 订单状态界面
  addressView() {
    return OrderDetailAddressWidget(model: _viewModel.addressModel);
  }

  // 商品界面
  goodsView() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: OrderGoodsListView(goodsList: _viewModel.goodsList)
    );
  }

  // 订单金额界面
  amountView() {
    return OrderDetailAmountWidget(model: _viewModel.model);
  }

  /* 底部栏 */
  Widget bottomBar() {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer(builder: (BuildContext context, OrderDetailViewModel value, Widget child) {
        return OrderDetailBottomBar(
            model: _viewModel.model,
            callback: (status, type){
              if (status == OrderStatus.unpay && type == 0) {
                this.showOrderPayView();
              }
              else if (status == OrderStatus.unpay && type == 1) {
                this.closeOrder();
              }
            }
        );
      }),
    );
  }

  // 显示支付界面
  showOrderPayView() {
    Navigator.of(context).pushNamed(RoutePath.orderPay, arguments: {"orderId": orderId});
  }

  // 取消订单
  closeOrder(){

  }
}
