class GoodsListModel {
  String characteristic;
  int id;
  double minPrice;
  String name;
  double originalPrice;
  String pic;
  int recommendStatus;
  String recommendStatusStr;
  int userId;
  int numberOrders;

  GoodsListModel(
      {this.characteristic,
        this.id,
        this.minPrice,
        this.name,
        this.originalPrice,
        this.pic,
        this.recommendStatus,
        this.recommendStatusStr,
        this.userId,
        this.numberOrders});

  GoodsListModel.fromJson(Map<String, dynamic> json) {
    characteristic = json['characteristic'];
    id = json['id'];
    minPrice = json['minPrice'];
    name = json['name'];
    originalPrice = json['originalPrice'];
    pic = json['pic'];
    recommendStatus = json['recommendStatus'];
    recommendStatusStr = json['recommendStatusStr'];
    userId = json['userId'];
    numberOrders = json['numberOrders'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['characteristic'] = this.characteristic;
    data['id'] = this.id;
    data['minPrice'] = this.minPrice;
    data['name'] = this.name;
    data['originalPrice'] = this.originalPrice;
    data['pic'] = this.pic;
    data['recommendStatus'] = this.recommendStatus;
    data['recommendStatusStr'] = this.recommendStatusStr;
    data['userId'] = this.userId;
    return data;
  }
}