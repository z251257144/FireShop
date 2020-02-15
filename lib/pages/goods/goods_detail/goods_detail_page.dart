import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/pages/cart/order_confirm/order_confirm_page.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_image_widget.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_info_widget.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_property_view.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_specification_bar.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_tab_bar.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_details_bottom_bar.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/view_util.dart';
import 'package:fire_shop/manager/cart_manager.dart';
import 'package:fire_shop/view_model/goods/goods_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

enum GoodsDetailOperateType {
  showCart,
  favorite,
  addToCart,
  buyNow,
}

class GoodsDetailPage extends StatefulWidget {
  final String id;

  GoodsDetailPage({Key key, this.id});

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState(id);
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  GoodsDetailViewModel _viewModel;

  _GoodsDetailPageState(String id) {
    _viewModel = GoodsDetailViewModel(id);
    _viewModel.checkGoodsFavorite();
  }

  Future future;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState

    future = _viewModel.fetchGoodsDetial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("商品详情"),
      ),

      body: Stack(
        children: <Widget>[
          futureBuilder(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: bottomBar()
          )
        ],
      ),
    );
  }

  FutureBuilder futureBuilder() {
    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return goodsDetailList();
        }
        if (snapshot.hasError) return errorWidget(snapshot.error);
        return Center(child: CircularProgressIndicator());
    });
  }

  Widget errorWidget(FormatException error) {
    if (error.offset == 700) {
      return Center(child: Text("没有相关商品！"));
    }
    return Center(child: Text(error.message));
  }

  bottomBar() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: _viewModel
        ),
        ChangeNotifierProvider.value(value: CartManager())
      ], 
      child: Consumer2(builder: (BuildContext context, GoodsDetailViewModel value, CartManager value2, Widget child) {
        return GoodsDetailBottomBar(
          model: _viewModel.model,
          cartCount: value2.cartCount(),
          isFavorite: _viewModel.isFavorite,
          onTap: (type) {
            if (type == GoodsDetailOperateType.favorite) {
              this.favoriteGoods();
            }
            else if (type == GoodsDetailOperateType.buyNow ||
                    type == GoodsDetailOperateType.addToCart ) {
              this.showPropertyView(type);
            }
            else if (type == GoodsDetailOperateType.showCart) {
              this.showCart();
            }
          }
        );
      })
    );
  }

  // 商品详情列表
  Widget goodsDetailList() {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 48),
      children: <Widget>[
        GoodsDetailImageWidget(pics: _viewModel.model.pics),
        GoodsDetailInfoWidget(model: _viewModel.model),
        GoodsDetailSpecificationBar(model: _viewModel.model),
        GoodsDetailTabBar(index: index, onChange: (index) {
          this.change(index);
        },),
        Html(data: _viewModel.model.content,)
      ],
    );
  }

  // 显示购物车
  showCart() {
    Fluttertoast.showToast(msg: "显示购物车");
  }

  // 收藏商品
  favoriteGoods() {
    if (!UserinfoManager.shared.isLogin) {
      Navigator.of(context).pushNamed(RoutePath.login);
      return;
    }

    Future future = _viewModel.isFavorite ? _viewModel.deleteGoodsFavorite()
        : _viewModel.addGoodsFavorite();

    showLoadingView(context);

    future.catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }

  // 加入购物车
  addToCart() {
    Navigator.of(context).pop();
    CartManager.shared.addGoodsDetail(_viewModel.model, 1);
  }

  // 立即购买
  buyNow() {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(RoutePath.orderConfirm);
  }

  // 显示商品规格、购买数量界面
  showPropertyView(type) {
    // 重置商品规格
    _viewModel.model.resetProperties();

    GoodsDetailPropertyView(
      model: _viewModel.model,
      type: type,
      callBack: (type) {
        if (type == GoodsDetailOperateType.addToCart) {
          this.addToCart();
        }
        else if (type == GoodsDetailOperateType.buyNow) {
          this.buyNow();
        }
      },
    ).show(context);
  }


  change(index) {
    setState(() {
      this.index = index;
    });
  }

}
