import 'package:fire_shop/model/goods/goods_list_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:flutter/material.dart';

class GoodsSearchResultViewModel with ChangeNotifier {
  GoodsServer _server = GoodsServer();

  List<GoodsListModel> goodsList;

  Future fetchGoodsList() async {
    var param = {"nameLike":"小米"};
    List result = await _server.fetchGoodsList(param);
    goodsList = result.map((item){
      return GoodsListModel.fromJson(item);
    }).toList();

    print(goodsList);
    notifyListeners();
    return 1;
  }




}