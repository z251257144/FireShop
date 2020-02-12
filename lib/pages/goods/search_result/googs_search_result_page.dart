import 'package:fire_shop/model/goods/goods_list_model.dart';
import 'package:fire_shop/pages/goods/search_result/goods_search_result_grid_item_widget.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/list_util.dart';
import 'package:fire_shop/view_model/goods/goods_search_result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoodsSearchResultPage extends StatefulWidget {
  final String searchWord;
  final int categoryId;

  const GoodsSearchResultPage({this.searchWord, this.categoryId});

  @override
  _GoodsSearchResultPageState createState() => _GoodsSearchResultPageState(
    searchWord: searchWord,
    categoryId: categoryId
  );
}

class _GoodsSearchResultPageState extends State<GoodsSearchResultPage> {

  final String searchWord;
  final int categoryId;

  GoodsSearchResultViewModel _viewModel;

  _GoodsSearchResultPageState({this.searchWord, this.categoryId}) {
    _viewModel = GoodsSearchResultViewModel();
    _viewModel.word = searchWord;
    _viewModel.categoryId = categoryId;
  }

  @override
  Widget build(BuildContext context) {
    _viewModel.fetchGoodsList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("search"),
      ),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer(builder: (BuildContext context, GoodsSearchResultViewModel value, Widget child){
          return gridView();
        }),
      ),
    );
  }

  gridView(){
    if (ListUtil.isEmpty(_viewModel.goodsList)){
      return Center(
        child: Text("暂无搜索结果")
      );
    }

    return Container(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
        itemCount: _viewModel.goodsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: GoodsSearchResultGridItemWidget.aspectRatio()
        ),
        itemBuilder: (context, index){
          var model = _viewModel.goodsList[index];
          return GoodsSearchResultGridItemWidget(
            model: model,
            onTap: (){
              this.showGoodsDetail(model);
            },
          );
        }
      ),
    );
  }

  showGoodsDetail(GoodsListModel model){
    Navigator.of(context).pushNamed(RoutePath.goodsDetail, arguments: {"id": model.id});
  }
}

