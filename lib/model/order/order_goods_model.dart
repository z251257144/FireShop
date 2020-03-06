import 'package:fire_shop/model/order/cart_goods_model.dart';

class OrderGoodsModel {
  double amount;
  double amountSingle;
  String dateAdd;
  int fxType;
  int goodsId;
  String goodsName;
  int id;
  int number;
  int orderId;
  String pic;
  int priceId;
  String property;
  int score;
  int status;
  int uid;
  int userId;

  OrderGoodsModel(
      {this.amount,
        this.amountSingle,
        this.dateAdd,
        this.fxType,
        this.goodsId,
        this.goodsName,
        this.id,
        this.number,
        this.orderId,
        this.pic,
        this.priceId,
        this.property,
        this.score,
        this.status,
        this.uid,
        this.userId});

  OrderGoodsModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    amountSingle = json['amountSingle'];
    dateAdd = json['dateAdd'];
    fxType = json['fxType'];
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    id = json['id'];
    number = json['number'];
    orderId = json['orderId'];
    pic = json['pic'];
    priceId = json['priceId'];
    property = json['property'];
    score = json['score'];
    status = json['status'];
    uid = json['uid'];
    userId = json['userId'];
  }

  OrderGoodsModel.fromCartGoods(CartGoodsModel model) {
    amount = model.price;
//    amountSingle = json['amountSingle'];
//    dateAdd = json['dateAdd'];
//    fxType = json['fxType'];
    goodsId = model.goodsId;
    goodsName = model.name;
    number = model.number;
    pic = model.pic;
    property = model.skuString();
    score = model.score;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['amountSingle'] = this.amountSingle;
    data['dateAdd'] = this.dateAdd;
    data['fxType'] = this.fxType;
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['id'] = this.id;
    data['number'] = this.number;
    data['orderId'] = this.orderId;
    data['pic'] = this.pic;
    data['priceId'] = this.priceId;
    data['property'] = this.property;
    data['score'] = this.score;
    data['status'] = this.status;
    data['uid'] = this.uid;
    data['userId'] = this.userId;
    return data;
  }
}