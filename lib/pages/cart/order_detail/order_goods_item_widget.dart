import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

class OrderGoodsItemWidget extends StatelessWidget {
  final CartGoodsModel model;

  const OrderGoodsItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(175)+30,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
                  color: Colors.black12,
                  width: 0.5
              )
          )
      ),
      child: Row(
        children: <Widget>[
          imageWidget(),
          goodsInfoWidget(),
        ],
      ),
    );
  }

  imageWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      width: ScreenUtil().setWidth(175),
      height: ScreenUtil().setWidth(175),
      child: Image.network(model.pic,
        fit: BoxFit.fill,
      ),
    );
  }

  goodsInfoWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model.name),
          priceWidget(),
        ],
      ),
    );
  }

  priceWidget() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("￥ ${model.price.toString()}",
            maxLines: 2,
            style: TextStyle(
                color: appCommonColor
            ),
          ),
//          CartNumberButton(
//            defaultValue: model.number,
//            maxValue: 5,
//          )
        ],
      ),
    );
  }
}
