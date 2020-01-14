
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/goods_detail_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:flutter/material.dart';

class GoodsDetailViewModel with ChangeNotifier {
  GoodsServer _server = GoodsServer();

  final String id;

  GoodsDetailViewModel(this.id);

  GoodsDetailModel model;
  bool isFavorite = false;

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
    notifyListeners();
    return 1;
  }

  Future checkGoodsFavorite() async {
    if (!UserinfoManager.shared.isLogin) {
      return;
    }

    var token = UserinfoManager.shared.user.token;
    try {
      var result = await _server.fetchGoodsFavorite(id, token);
      isFavorite = true;
    }
    catch (e) {
      print("sdafsdfsdafas");
      print(e);
    }
    notifyListeners();
    return 1;
  }

  Future addGoodsFavorite() async {
    var token = UserinfoManager.shared.user.token;

    var result = await _server.fetchAddGoodsFavorite(id, token);
    isFavorite = true;
    notifyListeners();
  }

  Future deleteGoodsFavorite() async {
    var token = UserinfoManager.shared.user.token;

    var result = await _server.fetchDeleteGoodsFavorite(id, token);
    isFavorite = false;
    notifyListeners();
  }
}