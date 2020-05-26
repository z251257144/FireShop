
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/goods/favorite_goods_model.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:flutter/cupertino.dart';

class FavoriteViewModel with ChangeNotifier {
  GoodsServer server = GoodsServer();

  int page = 1;

  List goodsList = [];

  Future fetchFavoriteGoodsList() async {
    print("fetchFavoriteGoodsList");
    var token = UserinfoManager.shared.user.token;
    var param = {"token": token, "pageSize": 20};
    param["pageSize"] = this.page;

    try {
      List res = await server.fetchFavoriteGoodsList(param);
      this.goodsList = res.map((item){
        FavoriteGoodsModel model = FavoriteGoodsModel.fromJson(item);
        return model;
      }).toList();
    }
    catch (err) {
      this.goodsList = [];
    }
    notifyListeners();
    return "";
  }

}