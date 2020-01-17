
import 'package:fire_shop/model/goods/category_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:flutter/material.dart';

class CategoryViewModel with ChangeNotifier {
  GoodsServer _server = GoodsServer();

  List<CategoryModel> categoryData;
  int leftIndex = 0;

  // 商品类别
  Future getAllCategoryList() async {
    List result = await _server.fetchAllCategoryList();
    categoryData = result.map((item){
      return CategoryModel.fromJson(item);
    }).toList();

    print(categoryData);
//    notifyListeners();
  }

  changeLeftIndex(index) {
    leftIndex = index;
    notifyListeners();
  }

}