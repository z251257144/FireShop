import 'package:fire_shop/manager/cart_manager.dart';
import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/pages/cart/cart_list/cart_item_widget.dart';
import 'package:fire_shop/pages/cart/cart_list/cart_list_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListPage extends StatefulWidget {
  @override
  _CartListPageState createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("购物车"),
      ),
      body: ChangeNotifierProvider.value(
        value: CartManager(),
        child: Consumer(builder: (_, CartManager value, child) {
          return Stack(
            children: <Widget>[
              listView(value),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: bottomBar()
              ),
            ],
          );
        }),
      ),
    );
  }

  // 购物车商品列表
  listView(CartManager value) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 48),
      itemCount: value.goodsList.length,
      itemBuilder: (_, index) {
        CartGoodsModel model = value.goodsList[index];
        return CartItemWidget(
          model: model,
          selectCallback: (_) {
            value.selectGoods(model);
          },
        );
      }
    );
  }

  // 购物车底部操作栏
  bottomBar() {
    bool isSelectAll = CartManager.shared.isSelectAll();
    bool canOrder = CartManager.shared.canOrder();
    double price = CartManager.shared.goodsPrice();

    return CartListBottomBar(
      isSelectAll: isSelectAll,
      canOrder: canOrder,
      price: price,
      selectCallBack: () {
        this.selectAll(!isSelectAll);
      },
      orderCallBack: (){

      },
    );
  }

  // 设置全部商品是否选中
  selectAll(bool select) {
    CartManager.shared.selectAllGoods(select);
  }
  
}