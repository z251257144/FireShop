import 'package:fire_shop/manager/cart_manager.dart';
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/pages/order/cart_list/cart_item_widget.dart';
import 'package:fire_shop/pages/order/cart_list/cart_list_bottom_bar.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/list_util.dart';
import 'package:fire_shop/widgets/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartListPage extends StatefulWidget {
  @override
  _CartListPageState createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  void didUpdateWidget(CartListPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  Widget build(BuildContext context) {
    print("_CartListPageState");
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("购物车"),
      ),
      body: ChangeNotifierProvider.value(
        value: CartManager(),
        child: Consumer(builder: (_, CartManager value, child) {
          if (ListUtil.isEmpty(CartManager.shared.goodsList)) {
            return nodataView();
          }

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

  nodataView() {
    var title = "去添加商品吧";
    var callback = null;
    if (!UserinfoManager.shared.isLogin) {
      title = "登录后享受更多优惠...";
      callback = () {
        Navigator.of(context).pushNamed(RoutePath.login);
      };
    }
    return EmptyView(
      image: "images/cart/cart_empty.png",
      title: title,
      callback: callback,
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
        this.showOrderConfirm();
      },
    );
  }

  // 设置全部商品是否选中
  selectAll(bool select) {
    CartManager.shared.selectAllGoods(select);
  }

  // 显示下单确认页
  showOrderConfirm() {
    Navigator.of(context).pushNamed(RoutePath.orderConfirm, arguments: {"goodsList": CartManager.shared.goodsList});
  }
}