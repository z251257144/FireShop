import 'package:fire_shop/model/cart/cart_goods_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {

  final CartGoodsModel model;

  const CartItemWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xfffafafa),
            width: 0.5
          )
        )
      ),
      child: Row(
        children: <Widget>[
          selectButton(),
          imageWidget(),
        ],
      ),
    );
  }

  selectButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 25,
      child: model.selected ? Icon(Icons.check_circle, color: appCommonColor, size: 25,) : null,
    );
  }

  imageWidget() {
    return Image.network(model.pic,
      width: ScreenUtil().setWidth(175)
    );
  }
}
