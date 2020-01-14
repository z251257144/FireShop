
import 'package:fire_shop/model/goods_detail_model.dart';

class CartGoodsModel {

  int id;
  String name;
  double originalPrice;
  String pic;
  int count = 0;
  bool selected = true;

  CartGoodsModel(
      {this.id,
        this.name,
        this.originalPrice,
        this.pic,
        this.count,
        this.selected});

  CartGoodsModel.fromGoodsDetail(GoodsDetailModel model) {
    id = model.id;
    name = model.name;
    originalPrice = model.originalPrice;
    pic = model.pic;
  }

  CartGoodsModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    originalPrice = json["originalPrice"];
    pic = json["pic"];
    count = json["count"];
    selected = json["selected"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['originalPrice'] = this.originalPrice;
    data['pic'] = this.pic;
    data['count'] = this.count;
    data['selected'] = this.selected;
    return data;
  }
}