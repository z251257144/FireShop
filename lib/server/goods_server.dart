import 'package:fire_shop/server/base_server.dart';

class GoodsServer extends BaseServer {

  // Banner列表
  Future fetchBannerList(type) async {
    var param = {"type": type};
    return super.requestGetData("banner/list", param: param);
  }

  // 商品详情
  Future fetchGoodsDetail(id) async {
    var param = {"id": id};
    return super.requestGetData("shop/goods/detail", param: param);
  }

  // 检测是否已收藏
  Future fetchGoodsFavorite(id, token) async {
    var param = {"goodsId": id, "token": token};
    return super.requestGetData("shop/goods/fav/check", param: param);
  }

  // 添加商品收藏
  Future fetchAddGoodsFavorite(id, token) async {
    var param = {"goodsId": id, "token": token};
    return super.requestGetData("shop/goods/fav/add", param: param);
  }

  // 删除商品收藏
  Future fetchDeleteGoodsFavorite(id, token) async {
    var param = {"goodsId": id, "token": token};
    return super.requestGetData("shop/goods/fav/delete", param: param);
  }

  // 商品列表
  Future fetchGoodsList(param) async {
    return super.requestGetData("shop/goods/list", param: param);
  }

  // 商品类别
  Future fetchAllCategoryList() async {
    return super.requestGetData("shop/goods/category/all");
  }

  // 商品收藏列表
  Future fetchFavoriteGoodsList(param) async {
    return super.requestPostData("shop/goods/fav/list", param: param);
  }






}