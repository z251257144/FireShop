import 'package:fire_shop/model/goods/goods_detail_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

class GoodsDetailInfoWidget extends StatelessWidget {

  final GoodsDetailModel model;

  const GoodsDetailInfoWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Column(
        children: <Widget>[
          nameWidget(model.name),
          goodsPointWidget(model.characteristic),
          priceWidget()
        ],
      ),
    );
  }

  nameWidget(name) {
    return Container(
      width: ScreenUtil().setWidth(appScreenWidth)-30,
      child: Text(name,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 18
        ),
      ),
    );
  }

  goodsPointWidget(text) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      width: ScreenUtil().setWidth(appScreenWidth)-30,
      child: Text(text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.black26,
          fontSize: 14
        ),
      ),
    );
  }
  
  priceWidget() {
    return Container(
      child: Row(
        children: <Widget>[
          Text("￥ ${model.minPrice.toString()}  ",
            style: TextStyle(
              color: appCommonColor,
              fontSize: 18
            ),
          ),
          Expanded(
              child: Text("￥ ${model.originalPrice.toString()} ",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.black26,
                  fontSize: 15
                ),
              ),
          ),
          Text("已售 ${model.numberSells.toString()}",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 13
            )
          )
        ],
      ),
    );
  }


}
