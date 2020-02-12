import 'package:fire_shop/model/goods/goods_list_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:fire_shop/utils/string_uril.dart';
import 'package:flutter/material.dart';

class GoodsSearchResultViewModel with ChangeNotifier {
  GoodsServer _server = GoodsServer();

  List<GoodsListModel> goodsList;

  String word;
  int categoryId;

  Future fetchGoodsList() async {
    List result = await _server.fetchGoodsList(searchParams());
    goodsList = result.map((item){
      return GoodsListModel.fromJson(item);
    }).toList();

    print(goodsList);
    notifyListeners();
    return 1;
  }

  searchParams() {
    var param = <String, dynamic>{};
    if (StringUtil.isNotEmpty(word)){
      param["nameLike"] = word;
    }

    if (categoryId != null){
      param["categoryId"] = categoryId;
    }

    print(param);
    return param;
  }



}