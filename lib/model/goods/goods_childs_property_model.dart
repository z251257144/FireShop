
// 规格子属性
class GoodsChildsPropertyModel {
  String dateAdd;
  int id;
  String name;
  int paixu;
  int propertyId;
  int userId;

  GoodsChildsPropertyModel(
      {this.dateAdd,
        this.id,
        this.name,
        this.paixu,
        this.propertyId,
        this.userId});

  GoodsChildsPropertyModel.fromJson(Map<String, dynamic> json) {
    dateAdd = json['dateAdd'];
    id = json['id'];
    name = json['name'];
    paixu = json['paixu'];
    propertyId = json['propertyId'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateAdd'] = this.dateAdd;
    data['id'] = this.id;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['propertyId'] = this.propertyId;
    data['userId'] = this.userId;
    return data;
  }
}