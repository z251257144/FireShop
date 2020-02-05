
import 'package:fire_shop/pages/goods/search_input/goods_search_history_item_widget.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/string_uril.dart';
import 'package:fire_shop/view_model/goods/goods_search_history_view_model.dart';
import 'package:fire_shop/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef SearchWordSelectCallBack = void Function(String word);

// ignore: must_be_immutable
class GoodsSearchHistoryPage extends StatelessWidget {

  final GoodsSearchHistoryViewModel viewModel = GoodsSearchHistoryViewModel();

  String searchWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: appBar(context),
      ),
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer(builder: (_, GoodsSearchHistoryViewModel value, child) {
          return content(context);
        })
      ),
    );
  }

  appBar(context) {
    return Container(
      child: Row(
        children: <Widget>[
          backButton(context),
          Expanded(child:
            SearchBar(
              onSubmitted: (text){
                searchWord = text;
                this.searchGoods(context);
              },
              onChanged: (text){
                searchWord = text;
              },
            )
          ),
          searchButton(context),
        ],
      ),
    );
  }

  // 返回按钮
  backButton(context){
    return InkWell(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  // 搜索按钮
  searchButton(context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 15),
        child: Text("搜索",
          style: TextStyle(
              fontSize: 16
          ),
        ),
      ),
      onTap: (){
        this.searchGoods(context);
      },
    );
  }


  Widget content(BuildContext context) {
    if (viewModel.words == null || viewModel.words.length == 0) {
      return nodataView();
    }

    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.headView(context),
          this.contentView(context)
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

  headView(context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(child:
            Text("历史记录")
          ),
          InkWell(
            onTap: (){
              this.clear(context);
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.delete,
                color: Color(0xff6C6C6C),
              ),
            ),
          )
        ],
      ),
    );
  }

  contentView(context) {
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 6,
        children: viewModel.words.map((item){
          return GoodsSearchHistoryItemWidget(
              title: item,
              onTap: (text){
                searchWord = text;
                this.searchGoods(context);
              }
          );
        }).toList(),
      ),
    );
  }

  clear(context) {
    var alert = CupertinoAlertDialog(
      title: Text('是否清空历史记录？'),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
              viewModel.clearWords();
            },
            child: Text('确定')),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('取消')),
      ],
    );

    showDialog(context: context, child: alert, barrierDismissible: false);
  }

  // 开始搜索
  searchGoods(context){
    if (StringUtil.isEmpty(searchWord)) {
      return;
    }

    print("searchGoods = " + searchWord);
    viewModel.addWord(searchWord);
    
    Navigator.of(context).pushNamed(RoutePath.goodsSearchResult, arguments: {"word": searchWord});
  }

}
