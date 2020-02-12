

import 'package:fire_shop/model/goods/goods_childs_property_model.dart';

class GoodsPropertyModel {
  List<GoodsChildsPropertyModel> childsProperties;
  String dateAdd;
  String dateUpdate;
  int id;
  String name;
  int paixu;
  int userId;
  int selectedIndex = -1;

  GoodsPropertyModel(
      {this.childsProperties,
        this.dateAdd,
        this.dateUpdate,
        this.id,
        this.name,
        this.paixu,
        this.userId});

  GoodsPropertyModel.fromJson(Map<String, dynamic> json) {
    if (json['childsCurGoods'] != null) {
      childsProperties = new List<GoodsChildsPropertyModel>();
      json['childsCurGoods'].forEach((v) {
        childsProperties.add(new GoodsChildsPropertyModel.fromJson(v));
      });
    }
    dateAdd = json['dateAdd'];
    dateUpdate = json['dateUpdate'];
    id = json['id'];
    name = json['name'];
    paixu = json['paixu'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childsProperties != null) {
      data['childsCurGoods'] =
          this.childsProperties.map((v) => v.toJson()).toList();
    }
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['id'] = this.id;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['userId'] = this.userId;
    return data;
  }
}