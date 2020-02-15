
import 'dart:convert';

import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/cart/cart_goods_model.dart';
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
  addGoodsDetail(GoodsDetailModel model, int count) async {
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
      items.forEach((item){
        var goods = CartGoodsModel.fromJson(item);
        goods.setStatus(goodsStatusMap[goods.goodsId]);
        goodsList.add(goods);
      });
    }

    notifyListeners();
  }

  // 清空购物车缓存
  clear() {
    StorageUtil.remove(kCartGoodsKey);
  }

  // 获取购物车所有商品数量
  int cartCount() {
    int count = 0;
    goodsList.forEach((item){
      count += item.number;
    });
    return count;
  }

  // 设置商品是否选中
  selectGoods(CartGoodsModel model) {
    model.selected = !model.selected;
    notifyListeners();
  }

  // 设置全部商品是否选中
  selectAllGoods(bool select) {
    for (CartGoodsModel item in goodsList) {
      item.selected = select;
    }
    notifyListeners();
  }

  // 是否已经全选
  bool isSelectAll() {
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

  // 是否已经全选
  bool canOrder() {
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

}