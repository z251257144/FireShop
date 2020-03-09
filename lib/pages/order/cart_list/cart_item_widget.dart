import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/pages/order/cart_list/cart_number_button.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CartItemSelectCallback = void Function(CartGoodsModel model);

class CartItemWidget extends StatelessWidget {

  const CartItemWidget({Key key, this.model, this.selectCallback}) : super(key: key);

  final CartGoodsModel model;
  final CartItemSelectCallback selectCallback;

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
          selectButton(),
          imageWidget(),
          goodsInfoWidget(),
        ],
      ),
    );
  }

  selectButton() {
    return InkWell(
      onTap: (){
        if (selectCallback != null && model != null) {
          selectCallback(model);
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
        width: 25,
        child: model.selected ? Icon(Icons.check_circle, color: appCommonColor, size: 25,)
            : Icon(Icons.radio_button_unchecked, color: appCommonColor, size: 25,),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            this.goodsSKUWidget(),
            priceWidget(),
          ],
        ),
      );
  }

  goodsSKUWidget() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 3),
        child: Text(model.skuString(),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.black38,
              fontSize: 12
          ),
        ),
      )
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
          CartNumberButton(
            defaultValue: model.number,
            maxValue: 100,
            callBack: (count) {
              this.changeGoodsCount(count);
            },
          )
        ],
      ),
    );
  }

  //调整商品数量
  changeGoodsCount(count) {

  }
}






