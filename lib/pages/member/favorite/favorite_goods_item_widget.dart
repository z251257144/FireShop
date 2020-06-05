import 'package:fire_shop/model/goods/favorite_goods_model.dart';
import 'package:flutter/material.dart';

class FavoriteGoodsItemWidget extends StatelessWidget {

  final FavoriteGoodsModel model;

  const FavoriteGoodsItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.imageView(),
          this.nameLabel()
        ],
      ),
    );
  }

  Widget imageView() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Image.network(this.model.pic,
        width: 80,
        height: 80,
      )
    );
  }

  Widget nameLabel() {
    return Text(this.model.goodsName);
  }
}
