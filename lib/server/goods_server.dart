import 'package:fire_shop/server/base_server.dart';

class GoodsServer extends BaseServer {

  // Banner列表
  Future fetchBannerList(type) async {
    var param = {"type": type};
    return super.requestGetData("banner/list", param);
  }





}