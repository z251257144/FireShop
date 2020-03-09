import 'package:fire_shop/pages/order/order_pay/order_pay_info_widget.dart';
import 'package:fire_shop/pages/order/order_pay/order_payment_list_view.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/view_model/order/order_pay_view_model.dart';
import 'package:fire_shop/widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
/*
* 订单支付界面
* */
class OrderPayPage extends StatefulWidget {

  final String orderId;

  const OrderPayPage({Key key, this.orderId}) : super(key: key);

  @override
  _OrderPayPageState createState() => _OrderPayPageState(this.orderId);
}

class _OrderPayPageState extends State<OrderPayPage> {
  final String orderId;

  OrderPayViewModel _viewModel = OrderPayViewModel();

  _OrderPayPageState(this.orderId);

//  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    this._viewModel.orderId = orderId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("支付订单"),
      ),
      body: FutureBuilder(
        future: this._viewModel.fetchOrderDetail(),
        builder: this._buildFuture
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: LoadingDialog(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return this.bodyView();
      default:
        return null;
    }
  }

  bodyView(){
    if (_viewModel.model == null) {
      return Container();
    }
    else {
      return this.refresher();
    }
  }

  refresher() {
    return EasyRefresh(
      header: BallPulseHeader(color: appCommonColor),
      onRefresh: () async {
        await _viewModel.fetchOrderDetail();
      },
      child: this.listView()
    );
  }

  listView(){
    return ListView(
      children: <Widget>[
        this.infoView(),
        this.paymentView()
      ],
    );
  }

  // 订单信息界面
  infoView() {
    return OrderPayInfoWidget();
  }

  // 支付方式界面
  paymentView(){
    return OrderPaymentListView();
  }
}
