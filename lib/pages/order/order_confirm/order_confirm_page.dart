import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/model/order/order_goods_model.dart';
import 'package:fire_shop/pages/order/order_confirm/order_confirm_amount_widget.dart';
import 'package:fire_shop/pages/order/order_confirm/order_confirm_bottom_bar.dart';
import 'package:fire_shop/pages/order/order_confirm/order_confirm_ship_widget.dart';
import 'package:fire_shop/view_model/order/order_confirm_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/pages/order/order_detail/order_goods_list_view.dart';
import 'package:provider/provider.dart';

// 订单确认页
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
  List<OrderGoodsModel> orderGoodsList;

  _OrderConfirmPageState(this.goodsList);

  @override
  void initState() {
    // TODO: implement initState
    this.orderGoodsList = this.goodsList.map((item){
      return OrderGoodsModel.fromCartGoods(item);
    }).toList();
    _viewModel.goodsList = this.goodsList;
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
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              this.goodsWidget(),
              this.shipWidget(),
              this.amountWidget()
            ],
          ),
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

  // 商品界面
  Widget goodsWidget() {
    return Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: OrderGoodsListView(goodsList: this.orderGoodsList),
    );
  }

  /* 状态变更 */
  Widget changeNotifierWidget(Widget widget) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer(builder: (BuildContext context, OrderConfirmViewModel value, Widget child) {
        return widget;
      }),
    );
  }

  // 收货地址
  Widget shipWidget() {
    var widget = OrderConformShipWidget(model: _viewModel.address);
    return this.changeNotifierWidget(widget);
  }

  /* 订单金额 */
  Widget amountWidget() {
    var widget = OrderConfirmAmountWidget(amount: _viewModel.amount);
    return this.changeNotifierWidget(widget);
  }

  /* 底部栏 */
  Widget bottomBar() {
    var widget = OrderConfirmBottomBar(
      amount: _viewModel.amount,
      callback: (){
        this.submitOrder();
      }
    );
    return this.changeNotifierWidget(widget);
  }

  // 提交订单
  submitOrder(){
    _viewModel.fetchCreateOrder();
  }
}
