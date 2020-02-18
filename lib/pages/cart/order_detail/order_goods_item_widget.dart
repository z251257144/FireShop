import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

final double OrderGoodsItemWidgetHeight = ScreenUtil().setWidth(175)+30;

class OrderGoodsItemWidget extends StatelessWidget {
  final CartGoodsModel model;

  const OrderGoodsItemWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: OrderGoodsItemWidgetHeight,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                  color: Colors.black12,
                  width: 0.5
              )
          )
      ),
      child: Row(
        children: <Widget>[
          imageWidget(),
          centerWidget(),
          rightWidget()
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

  centerWidget() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(model.skuString(),
            maxLines: 2,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14
            ),
          )
        ],
      ),
    );
//    return ;
  }

  rightWidget() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("￥${model.price.toString()}",
            maxLines: 2,
            style: TextStyle(
                color: Colors.black87
            ),
          ),
          Text("x${model.number.toString()}",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}
