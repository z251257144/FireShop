import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_image_widget.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_info_widget.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_specification_bar.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_details_bottom_bar.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/view_util.dart';
import 'package:fire_shop/manager/cart_manager.dart';
import 'package:fire_shop/view_model/goods/goods_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

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
      future: _viewModel.fetchGoodsDetial(),
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
          onTap: (index) {
            if (index == 1) {
              favButtonTap();
            }
            else if (index == 3) {
              value2.addGoodsDetail(_viewModel.model);
              addGoodsToCart();
            }
          }
        );
      })
    );
  }

  Widget goodsDetailList() {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 48),
      children: <Widget>[
        GoodsDetailImageWidget(pics: _viewModel.model.pics),
        GoodsDetailInfoWidget(model: _viewModel.model),
        GoodsDetailSpecificationBar(model: _viewModel.model),
      ],
    );
  }

  // 收藏按钮点击事件
  favButtonTap() {
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

  addGoodsToCart() {
//    var cart = Provider.of<CartViewModel>(context, listen: false);
//    cart.addGoodsDetail(_viewModel.model);
  }

}
