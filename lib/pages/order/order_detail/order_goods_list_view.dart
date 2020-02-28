import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/pages/order/order_detail/order_goods_item_widget.dart';
import 'package:flutter/material.dart';

class OrderGoodsListView extends StatelessWidget {

  final List<CartGoodsModel> goodsList;

  const OrderGoodsListView({Key key, this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List list = <Widget>[header()];
    list.addAll(goodsViewList());

    double height = OrderGoodsItemWidgetHeight*goodsList.length + 44;

    return Container(
      height: height,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: list,
      ),
    );
  }

  header() {
    return Container(
      height: 44,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Text("商品信息"),
    );
  }

  goodsViewList() {
    return goodsList.map((item){
      return OrderGoodsItemWidget(item);
    }).toList();
  }
}
