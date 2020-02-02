
import 'package:flutter/material.dart';
import 'package:fire_shop/pages/goods/search/goods_search_history_item_widget.dart';
import 'package:fire_shop/view_model/goods/goods_search_history_view_model.dart';

typedef SearchWordSelectCallBack = void Function(String word);

class GoodsSearchHistoryPage extends StatelessWidget {

  final GoodsSearchHistoryViewModel viewModel = GoodsSearchHistoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
//        title: SearchBar(onTap: (){
//          this.showSearchView(context);
//        }),
      ),
      backgroundColor: Colors.white,
      body: ddd(context),
    );
  }

  @override
  Widget ddd(BuildContext context) {


//    if (words == null || words.length == 0) {
//      return nodataView();
//    }

    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.titleLabel(),
          this.contentView()
        ],
      ),
    );
  }

  nodataView() {
    return Container(
      padding: EdgeInsets.only(top: 50),
      alignment: Alignment.topCenter,
      child: Text("暂无搜索记录",
        style: TextStyle(
          fontSize: 16
        )
      ),
    );
  }

  titleLabel() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Text("历史记录"),
    );
  }

  contentView() {
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 6,
        children: viewModel.words.map((item){
          return GoodsSearchItemWidget(title: item);
        }).toList(),
      ),
    );
  }
}
