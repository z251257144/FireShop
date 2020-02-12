
import 'dart:convert';

import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/model/goods/goods_detail_model.dart';
import 'package:fire_shop/utils/storage_util.dart';
import 'package:flutter/material.dart';

const String kCartGoodsKey = "kCartGoodsKey";

class CartManager with ChangeNotifier {
  /*使用单例模式管理用户信息*/
  static final CartManager _instance = CartManager._internal();

  CartManager._internal() {
    read();
  }

  factory CartManager() => _instance;

  static CartManager get shared => _instance;

  List<CartGoodsModel> goodsList = List<CartGoodsModel>();

  // 向购物车添加商品
  addGoodsDetail(GoodsDetailModel model) {
    CartGoodsModel goods = getCartGoods(model.id);
    if (goods == null) {
      goods = CartGoodsModel.fromGoodsDetail(model);
      goodsList.insert(0, goods);
    }
    goods.count += 1;
    goods.selected = true;
    notifyListeners();

    save();
  }

  // 根据商品ID获取购物车商品model
  getCartGoods(id) {
    if (id == null) {
      return null;
    }

    CartGoodsModel model;
    goodsList.forEach((item){
      if (item.id == id) {
        model = item;
      }
    });
    return model;
  }

  // 获取购物车所有商品数量
  int cartCount() {
    int count = 0;
    goodsList.forEach((item){
      count += item.count;
    });
    return count;
  }

  // 设置商品是否选中
  selectGoods(CartGoodsModel model) {
    model.selected = !model.selected;
    notifyListeners();
    save();
  }

  // 设置全部商品是否选中
  selectAllGoods(bool select) {
    for (CartGoodsModel item in goodsList) {
      item.selected = select;
    }
    notifyListeners();
    save();
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
        price += item.minPrice * item.count;
      }
    }

    return price;
  }



  // 缓存购物车商品数据
  save() {
    List<String> list = goodsList.map((item){
      return jsonEncode(item.toJson());
    }).toList();
    print(list);
    StorageUtil.save(kCartGoodsKey, list);
  }

  // 读取购物车缓存数据
  read() async {
    List list = await StorageUtil.getValue<List<String>>(kCartGoodsKey);
    print(list.toString());
    if (list != null) {
      list.forEach((item){
        var json = jsonDecode(item);
        goodsList.add(CartGoodsModel.fromJson(json));
      });
    }
  }

  // 清空购物车缓存
  clear() {
    StorageUtil.remove(kCartGoodsKey);
  }

}