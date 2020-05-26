import 'package:fire_shop/model/goods/favorite_goods_model.dart';
import 'package:flutter/material.dart';

class FavoriteGoodsItemWidget extends StatelessWidget {

  final FavoriteGoodsModel model;

  const FavoriteGoodsItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.model.goodsName),
    );
  }
}
