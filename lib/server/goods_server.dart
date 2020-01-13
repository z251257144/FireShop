import 'package:fire_shop/server/base_server.dart';

class GoodsServer extends BaseServer {

  // Banner列表
  Future fetchBannerList(type) async {
    var param = {"type": type};
    return super.requestGetData("banner/list", param);
  }

  // 商品详情
  Future fetchGoodsDetail(id) async {
    var param = {"id": id};
    return super.requestGetData("shop/goods/detail", param);
  }






}