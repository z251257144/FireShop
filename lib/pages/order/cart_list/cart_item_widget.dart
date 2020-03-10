import 'package:fire_shop/model/order/cart_goods_model.dart';
import 'package:fire_shop/pages/order/cart_list/cart_number_button.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef CartItemSelectCallback = void Function(CartGoodsModel model, bool isEdit);

class CartItemWidget extends StatelessWidget {

  const CartItemWidget({Key key, this.model, this.selectCallback, this.isEdit}) : super(key: key);

  final bool isEdit;
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
    var icon = Icons.check_circle;
    if (this.isEdit) {
      icon = model.removeSelected ? Icons.check_circle: Icons.radio_button_unchecked;
    }
    else {
      icon = model.selected ? Icons.check_circle: Icons.radio_button_unchecked;
    }
    return InkWell(
      onTap: (){
        if (selectCallback != null && model != null) {
          selectCallback(model, this.isEdit);
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
        width: 25,
        child: Icon(icon, color: appCommonColor, size: 25,)
      ),
    );
  }

  //商品图片
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

  // 商品信息
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

  // 商品SKU信息
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
          this.numberButton()
        ],
      ),
    );
  }

  // 数量调整按钮
  numberButton(){
    if (this.isEdit) {
      return Container();
    }

    return CartNumberButton(
      defaultValue: model.number,
      maxValue: 100,
      callBack: (count) {
        this.changeGoodsCount(count);
      },
    );
  }

  //调整商品数量
  changeGoodsCount(count) {

  }
}






