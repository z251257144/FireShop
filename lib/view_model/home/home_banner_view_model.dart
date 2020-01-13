import 'package:flutter/foundation.dart';
import 'package:fire_shop/server/goods_server.dart';
import 'package:fire_shop/model/home/home_bannar_model.dart';

class HomeBannerViewModel with ChangeNotifier {
  GoodsServer server = GoodsServer();

  List<HomeBannarModel> topData;

  List<HomeBannarModel> salesData;

  List<HomeBannarModel> hotData;
  
  getTopData() async {
    List data = await server.fetchBannerList("top");
    topData = data.map((item){
      return HomeBannarModel.fromJson(item);
    }).toList();
    notifyListeners();
  }

  getSaleData() async {
    List data = await server.fetchBannerList("sale");
    salesData = data.map((item){
      return HomeBannarModel.fromJson(item);
    }).toList();
    notifyListeners();
  }

  getHotData() async {
    List data = await server.fetchBannerList("hot");
    hotData = data.map((item){
      return HomeBannarModel.fromJson(item);
    }).toList();
    notifyListeners();
  }




}