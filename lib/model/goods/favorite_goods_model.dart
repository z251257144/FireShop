class FavoriteGoodsModel {
  int id;
  int goodsId;
  String goodsName;
  String pic;
  String dateAdd;

  FavoriteGoodsModel(
      {this.id,
        this.goodsId,
        this.goodsName,
        this.pic,
        this.dateAdd});

  FavoriteGoodsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    pic = json['pic'];
    dateAdd = json['dateAdd'];
  }
}