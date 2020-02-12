import 'package:fire_shop/model/goods/goods_list_model.dart';
import 'package:flutter/foundation.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:fire_shop/model/home/home_bannar_model.dart';

class HomeBannerViewModel with ChangeNotifier {
  GoodsServer server = GoodsServer();

  List<HomeBannarModel> topData;

  List<HomeBannarModel> salesData;

  List<HomeBannarModel> hotData;

  int page = 0;
  List<GoodsListModel> goodsData;

  Future _getTopData() async {
    List data = await server.fetchBannerList("top");
    topData = data.map((item) {
      return HomeBannarModel.fromJson(item);
    }).toList();
  }

  Future _getSaleData() async {
    List data = await server.fetchBannerList("sale");
    salesData = data.map((item){
      return HomeBannarModel.fromJson(item);
    }).toList();
  }

  Future _getHotData() async {
    List data = await server.fetchBannerList("hot");
    hotData = data.map((item){
      return HomeBannarModel.fromJson(item);
    }).toList();
  }

  getBannerData() async {
    await Future.wait([
      _getTopData(),
      _getSaleData(),
      _getHotData(),
    ]);

    notifyListeners();
  }

  Future getRecommendGoods() async {
    var param = {"recommendStatus": "1", "pageSize": "20", "page": page};
    List data = await server.fetchGoodsList(param);
    goodsData = data.map((item){
      return GoodsListModel.fromJson(item);
    }).toList();
    print(data);

    notifyListeners();
  }



}