import 'package:fire_shop/pages/member/favorite/favorite_goods_item_widget.dart';
import 'package:fire_shop/view_model/member/favorite_view_model.dart';
import 'package:fire_shop/widgets/zm_future.dart';
import 'package:fire_shop/widgets/zm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FavoritePage extends StatelessWidget {
  FavoriteViewModel _viewModel = FavoriteViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏夹"),
        backgroundColor: Colors.white,
      ),
      body: ZMFuture.builder(
        future: _viewModel.fetchFavoriteGoodsList(),
        view: this.listViewProvider()
      )
    );
  }

  listViewProvider(){
    return ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer(builder: (context, ChangeNotifier _, child){
          return this.listView(context);
        })
    );
  }
  
  Widget listView(context) {
    return ListView.builder(
      itemCount: _viewModel.goodsList.length,
      itemBuilder: (context, index) {
        return FavoriteGoodsItemWidget(_viewModel.goodsList[index]);
      }
    );
  }
}


ZMFuture.builder(
  future: _viewModel.fetchFavoriteGoodsList(),
  view: this.listViewProvider()
)

