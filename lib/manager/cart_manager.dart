
import 'dart:convert';

import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/model/goods_detail_model.dart';
import 'package:fire_shop/utils/storage_util.dart';
import 'package:flutter/material.dart';

const String kCartGoodsKey = "kCartGoodsKey";

class CartManager with ChangeNotifier {
  /*使用单例模式管理用户信息*/
  static final CartManager _instance = CartManager._internal();

  CartManager._internal() {
//    clear();
    read();
  }

  factory CartManager() => _instance;

  static CartManager get shared => _instance;

  List<CartGoodsModel> goodsList = List<CartGoodsModel>();

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

  int cartCount() {
    int count = 0;
    goodsList.forEach((item){
      count += item.count;
    });
    return count;
  }

  save() {
    List<String> list = goodsList.map((item){
      return jsonEncode(item.toJson());
    }).toList();
    print(list);
    StorageUtil.save(kCartGoodsKey, list);
  }

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

  clear() {
    StorageUtil.remove(kCartGoodsKey);
  }

}