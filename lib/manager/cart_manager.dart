import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/model/goods/goods_detail_model.dart';
import 'package:fire_shop/server/cart_server.dart';
import 'package:fire_shop/utils/list_util.dart';
import 'package:fire_shop/utils/storage_util.dart';
import 'package:flutter/material.dart';

const String kCartGoodsKey = "kCartGoodsKey";

class CartManager with ChangeNotifier {
  /*使用单例模式管理用户信息*/
  static final CartManager _instance = CartManager._internal();

  CartManager._internal() {

  }

  factory CartManager() => _instance;

  static CartManager get shared => _instance;

  List<CartGoodsModel> goodsList = List<CartGoodsModel>();

  CartServer _server = CartServer();

  // 向购物车添加商品
  Future addGoodsDetail(GoodsDetailModel model, int count) async {
    var param = Map<String, dynamic>();
    param["goodsId"] = model.id;
    param["number"] = count;
    param["token"] = UserinfoManager.shared.user.token;

    if (ListUtil.isNotEmpty(model.properties)) {
      List sku = List();
      model.properties.forEach((item){
        var map = Map<String, dynamic>();
        map["optionId"] = item.id;
        map["optionValueId"] = item.selectedChildId();
        sku.add(map);
      });
      param["sku"] = sku.toString();
      print(sku.toString());
    }

    var result = await _server.fetchCartAdd(param);
    print(result);

    notifyListeners();
  }

  // 刷新购物车数据
  refreshCartData() async {
    if (!UserinfoManager.shared.isLogin) {
      return;
    }

    var token = UserinfoManager.shared.user.token;
    Map result = await _server.fetchCartData(token);
    print(result.toString());

    // 解析商品状态
    List goodsStatus = result["goodsStatus"];
    var goodsStatusMap = Map<int, dynamic>();
    goodsStatus.map((item) {
      goodsStatusMap[item["id"]] = item;
    });

    // 解析商品信息
    List items = result["items"];
    if (result != null) {
      goodsList = items.map((item){
        var goods = CartGoodsModel.fromJson(item);
        goods.setStatus(goodsStatusMap[goods.goodsId]);
        return goods;
      }).toList();
    }

    this.updateGoodsSelectStatus();

    notifyListeners();
  }

  // 从缓存更新商品选择状态
  updateGoodsSelectStatus() async {
    if (ListUtil.isEmpty(this.goodsList)){
      return;
    }

    List goodsKeys = await StorageUtil.getValue<List>(kCartGoodsKey);
    if (ListUtil.isEmpty(goodsKeys)) {
      return;
    }

    for (CartGoodsModel model in this.goodsList) {
      bool isSelected = goodsKeys.contains(model.key);
      if (isSelected) {
        model.selected = isSelected;
        goodsKeys.remove(model.key);
      }
    }

    if (ListUtil.isNotEmpty(goodsKeys)) {
      this.saveGoodsSelectStatus();
    }
  }

  // 删除购物车记录
  removeCartRecord(List keys) async {
    var token = UserinfoManager.shared.user.token;
    var res = await _server.fetchRemoveCartRecord(token, keys.join(","));
//    keys
    for (CartGoodsModel item in goodsList) {
//      if () {
//
//      }
    }
    notifyListeners();
  }

  // 设置商品是否选中
  selectGoods(CartGoodsModel model, bool isEdit) {
    if (isEdit) {
      model.removeSelected = !model.removeSelected;
      notifyListeners();
    }
    else {
      model.selected = !model.selected;
      notifyListeners();

      this.saveGoodsSelectStatus();
    }
  }

  // 设置全部商品是否选中
  selectAllGoods(bool select, bool isEdit) {
    if (isEdit) {
      for (CartGoodsModel item in goodsList) {
        item.removeSelected = select;
      }
      notifyListeners();
    }
    else {
      for (CartGoodsModel item in goodsList) {
        item.selected = select;
      }
      notifyListeners();

      this.saveGoodsSelectStatus();
    }
  }

  // 是否已经全选
  bool isSelectAll(bool isEdit) {
    if (isEdit) {
      if (goodsList.length == 0) {
        return false;
      }

      for (CartGoodsModel item in goodsList) {
        if (!item.removeSelected) {
          return false;
        }
      }
      return true;
    }

    if (goodsList.length == 0) {
      return false;
    }

    for (CartGoodsModel item in goodsList) {
      if (!item.selected) {
        return false;
      }
    }

    return true;
  }

  // 是否有选择商品
  bool hasSelectedGoods(bool isEdit) {
    if (isEdit) {
      if (goodsList.length == 0) {
        return false;
      }

      for (CartGoodsModel item in goodsList) {
        if (item.removeSelected) {
          return true;
        }
      }

      return false;
    }

    if (goodsList.length == 0) {
      return false;
    }

    for (CartGoodsModel item in goodsList) {
      if (item.selected) {
        return true;
      }
    }

    return false;
  }

  // 获取商品合计价格
  double goodsPrice() {
    if (goodsList.length == 0) {
      return 0;
    }

    double price = 0;
    for (CartGoodsModel item in goodsList) {
      if (item.selected) {
        price += item.price * item.number;
      }
    }

    return price;
  }

  // 获取购物车所有商品数量
  int cartCount() {
    int count = 0;
    goodsList.forEach((item){
      count += item.number;
    });
    return count;
  }

  // 缓存商品选择状态
  saveGoodsSelectStatus() async {
    List<String> keys = List<String>();
    if (ListUtil.isNotEmpty(this.goodsList)) {
      for (CartGoodsModel item in goodsList) {
        if (item.selected) {
          keys.add(item.key.toString());
        }
      }
    }

    if (ListUtil.isEmpty(keys)) {
      StorageUtil.remove(kCartGoodsKey);
    }
    else {
      StorageUtil.save(kCartGoodsKey, keys);
    }
  }

}