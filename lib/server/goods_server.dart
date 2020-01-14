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

  // 检测是否已收藏
  Future fetchGoodsFavorite(id, token) async {
    var param = {"goodsId": id, "token": token};
    return super.requestGetData("shop/goods/fav/check", param);
  }

  // 添加商品收藏
  Future fetchAddGoodsFavorite(id, token) async {
    var param = {"goodsId": id, "token": token};
    return super.requestGetData("shop/goods/fav/add", param);
  }

  // 删除商品收藏
  Future fetchDeleteGoodsFavorite(id, token) async {
    var param = {"goodsId": id, "token": token};
    return super.requestGetData("shop/goods/fav/delete", param);
  }






}