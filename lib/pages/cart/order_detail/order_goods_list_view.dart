import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/pages/cart/order_detail/order_goods_item_widget.dart';
import 'package:flutter/material.dart';

class OrderGoodsListView extends StatelessWidget {

  final List<CartGoodsModel> goodsList;

  const OrderGoodsListView({Key key, this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List list = <Widget>[header()];
    list.addAll(goodsViewList());

    return Container(
      child: ListView(
        children: list,
      ),
    );
  }

  header() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Text("商品信息"),
    );
  }

  goodsViewList() {
    return goodsList.map((item){
      return OrderGoodsItemWidget(item);
    }).toList();
  }
}
