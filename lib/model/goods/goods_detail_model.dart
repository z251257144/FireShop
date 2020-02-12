import 'package:fire_shop/model/goods/goods_property_model.dart';

class GoodsDetailModel {
  int categoryId;
  String characteristic;
  double commission;
  int commissionType;
  String dateAdd;
  String dateUpdate;
  int gotScore;
  int gotScoreType;
  int id;
  bool kanjia;
  double kanjiaPrice;
  bool limitation;
  int logisticsId;
  bool miaosha;
  double minPrice;
  int minScore;
  String name;
  int numberFav;
  int numberGoodReputation;
  int numberOrders;
  int numberSells;
  double originalPrice;
  int paixu;
  String pic;
  bool pingtuan;
  double pingtuanPrice;
  int recommendStatus;
  String recommendStatusStr;
  int shopId;
  int status;
  String statusStr;
  int stores;
  int userId;
  int vetStatus;
  int views;
  double weight;
  List pics;
  String content;

  List<GoodsPropertyModel> properties;

  GoodsDetailModel(
      {this.categoryId,
        this.characteristic,
        this.commission,
        this.commissionType,
        this.dateAdd,
        this.dateUpdate,
        this.gotScore,
        this.gotScoreType,
        this.id,
        this.kanjia,
        this.kanjiaPrice,
        this.limitation,
        this.logisticsId,
        this.miaosha,
        this.minPrice,
        this.minScore,
        this.name,
        this.numberFav,
        this.numberGoodReputation,
        this.numberOrders,
        this.numberSells,
        this.originalPrice,
        this.paixu,
        this.pic,
        this.pingtuan,
        this.pingtuanPrice,
        this.recommendStatus,
        this.recommendStatusStr,
        this.shopId,
        this.status,
        this.statusStr,
        this.stores,
        this.userId,
        this.vetStatus,
        this.views,
        this.weight,
        this.properties});

  GoodsDetailModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    characteristic = json['characteristic'];
    commission = json['commission'];
    commissionType = json['commissionType'];

    dateAdd = json['dateAdd'];
    dateUpdate = json['dateUpdate'];
    gotScore = json['gotScore'];
    gotScoreType = json['gotScoreType'];
    id = json['id'];
    kanjia = json['kanjia'];
    kanjiaPrice = json['kanjiaPrice'];
    limitation = json['limitation'];
    logisticsId = json['logisticsId'];
    miaosha = json['miaosha'];
    minPrice = json['minPrice'];
    minScore = json['minScore'];
    name = json['name'];
    numberFav = json['numberFav'];
    numberGoodReputation = json['numberGoodReputation'];
    numberOrders = json['numberOrders'];
    numberSells = json['numberSells'];
    originalPrice = json['originalPrice'];
    paixu = json['paixu'];
    pic = json['pic'];
    pingtuan = json['pingtuan'];
    pingtuanPrice = json['pingtuanPrice'];
    recommendStatus = json['recommendStatus'];
    recommendStatusStr = json['recommendStatusStr'];
    shopId = json['shopId'];
    status = json['status'];
    statusStr = json['statusStr'];
    stores = json['stores'];
    userId = json['userId'];
    vetStatus = json['vetStatus'];
    views = json['views'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['characteristic'] = this.characteristic;
    data['commission'] = this.commission;
    data['commissionType'] = this.commissionType;
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['gotScore'] = this.gotScore;
    data['gotScoreType'] = this.gotScoreType;
    data['id'] = this.id;
    data['kanjia'] = this.kanjia;
    data['kanjiaPrice'] = this.kanjiaPrice;
    data['limitation'] = this.limitation;
    data['logisticsId'] = this.logisticsId;
    data['miaosha'] = this.miaosha;
    data['minPrice'] = this.minPrice;
    data['minScore'] = this.minScore;
    data['name'] = this.name;
    data['numberFav'] = this.numberFav;
    data['numberGoodReputation'] = this.numberGoodReputation;
    data['numberOrders'] = this.numberOrders;
    data['numberSells'] = this.numberSells;
    data['originalPrice'] = this.originalPrice;
    data['paixu'] = this.paixu;
    data['pic'] = this.pic;
    data['pingtuan'] = this.pingtuan;
    data['pingtuanPrice'] = this.pingtuanPrice;
    data['recommendStatus'] = this.recommendStatus;
    data['recommendStatusStr'] = this.recommendStatusStr;
    data['shopId'] = this.shopId;
    data['status'] = this.status;
    data['statusStr'] = this.statusStr;
    data['stores'] = this.stores;
    data['userId'] = this.userId;
    data['vetStatus'] = this.vetStatus;
    data['views'] = this.views;
    data['weight'] = this.weight;
    return data;
  }

  addProperties(List json) {
    if (json != null) {
      properties = json.map((item){
        return GoodsPropertyModel.fromJson(item);
      }).toList();
    }
  }

  addPictures(List json) {
    if (json != null) {
      pics = json.map((item){
        return item["pic"];
      }).toList();
    }
  }
}