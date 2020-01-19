
import 'package:fire_shop/model/goods/category_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:flutter/material.dart';

class CategoryViewModel with ChangeNotifier {
  GoodsServer _server = GoodsServer();

  List<CategoryModel> categoryData;
  int leftIndex = 0;

  // 获取商品类别
  Future getAllCategoryList() async {
    List result = await _server.fetchAllCategoryList();

    categoryData = [];
    Map<int, List<CategoryModel>> map = {};

    result.forEach((item){
      var model = CategoryModel.fromJson(item);

      if (model.level == 1) {
        categoryData.add(model);

        List list = map[model.id];
        if (list == null) {
          map[model.id] = [];
          list = map[model.id];
        }
        model.subCategoryList = list;
      }
      else {
        List list = map[model.pid];
        if (list == null) {
          map[model.pid] = [];
          list = map[model.pid];
        }

        list.add(model);
      }
    });
  }

  changeLeftIndex(index) {
    leftIndex = index;
    var list = categoryData[leftIndex];
    print(list.subCategoryList);
    notifyListeners();
  }

  // 已选中的目录
  CategoryModel selectCategory() {
    if (categoryData == null || categoryData.length == 0) {
      return null;
    }

    if (leftIndex < 0 || leftIndex >= categoryData.length) {
      return null;
    }

    return categoryData[leftIndex];
  }

}