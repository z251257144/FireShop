
import 'package:fire_shop/model/goods/goods_detail_model.dart';

class CartGoodsModel {
  String key;
  int goodsId;
  int number;
  List<CartSkuModel> sku;
  double price;
  int score;
  String pic;
  String name;
  int logisticsId;

  int status;
  String statusStr;

  bool selected = false;

  CartGoodsModel(
      {this.key,
        this.goodsId,
        this.number,
        this.sku,
        this.price,
        this.score,
        this.pic,
        this.name,
        this.logisticsId});

  CartGoodsModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    goodsId = json['goodsId'];
    number = json['number'];
    if (json['sku'] != null) {
      sku = new List<CartSkuModel>();
      json['sku'].forEach((v) {
        sku.add(new CartSkuModel.fromJson(v));
      });
    }
    price = json['price'];
    score = json['score'];
    pic = json['pic'];
    name = json['name'];
    logisticsId = json['logisticsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['goodsId'] = this.goodsId;
    data['number'] = this.number;
    if (this.sku != null) {
      data['sku'] = this.sku.map((v) => v.toJson()).toList();
    }
    data['price'] = this.price;
    data['score'] = this.score;
    data['pic'] = this.pic;
    data['name'] = this.name;
    data['logisticsId'] = this.logisticsId;
    return data;
  }

  setStatus(Map sta) {
    if (sta == null) {
      return;
    }

    status = sta["status"];
    statusStr = sta["statusStr"];
  }
}

class CartSkuModel {
  int optionId;
  int optionValueId;
  String optionName;
  String optionValueName;

  CartSkuModel(
      {this.optionId,
        this.optionValueId,
        this.optionName,
        this.optionValueName});

  CartSkuModel.fromJson(Map<String, dynamic> json) {
    optionId = json['optionId'];
    optionValueId = json['optionValueId'];
    optionName = json['optionName'];
    optionValueName = json['optionValueName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['optionId'] = this.optionId;
    data['optionValueId'] = this.optionValueId;
    data['optionName'] = this.optionName;
    data['optionValueName'] = this.optionValueName;
    return data;
  }
}