
import 'package:fire_shop/model/goods_detail_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:flutter/material.dart';

class GoodsDetailViewModel with ChangeNotifier {
  GoodsServer _server = GoodsServer();

  final String id;

  GoodsDetailViewModel(this.id);

  GoodsDetailModel model;

  Future fetchGoodsDetial() async {
    var result = await _server.fetchGoodsDetail(id);
//    print(result["basicInfo"]);
//    try {
//      Map data = result["basicInfo"];
//      for (var key in data.keys) {
//        print("$key  ==  ${data[key].runtimeType}  ==  ${data[key]} ");
//      }
//    }
//    catch (e) {
//      print(e);
//    }
    model = GoodsDetailModel.fromJson(result["basicInfo"]);
    model.content = result["content"];
    model.pics = (result["pics"] as List).map((item){
      for (var key in item.keys) {
        print("$key  ==  ${item[key].runtimeType}  ==  ${item[key]} ");
      }
      return item["pic"];
    }).toList();
    return 1;
  }
}