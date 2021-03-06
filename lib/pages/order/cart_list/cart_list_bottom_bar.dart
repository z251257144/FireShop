import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

typedef CartListBarCallBack = void Function();

class CartListBottomBar extends StatelessWidget {

  const CartListBottomBar(
      {Key key,
        this.isSelectAll = false,
        this.price = 0,
        this.canOrder = false,
        this.selectCallBack,
        this.orderCallBack,
        this.isEdit,
        this.removeCallBack})
      : super(key: key);

  final bool isSelectAll;
  final double price;
  final bool canOrder;
  final bool isEdit;

  final CartListBarCallBack selectCallBack;
  final CartListBarCallBack orderCallBack;
  final CartListBarCallBack removeCallBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black26,
            width: 1
          )
        )
      ),
      child: Row(
        children: this.contentWidgets(),
      ),
    );
  }

  contentWidgets(){
    if (isEdit) {
      return <Widget>[
        Expanded(child: this.selectButton()),
        this.removeButton()
      ];
    }

    return <Widget>[
      this.selectButton(),
      this.priceLabel(),
      this.orderButton()
    ];
  }

  // 全选按钮
  selectButton() {
    return InkWell(
      onTap: (){
        if (selectCallBack !=null) {
          selectCallBack();
        }
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Row(
          children: <Widget>[
            isSelectAll ? Icon(Icons.check_circle, color: appCommonColor, size: 25,)
                : Icon(Icons.radio_button_unchecked, color: appCommonColor, size: 25,),
            Container(
              padding: EdgeInsets.fromLTRB(7, 0, 0, 0),
              child: Text("全选"),
            )
          ],
        ),
      ),
    );
  }

  // 合计价格
  priceLabel() {
    String p = "";
    if (price != null && price > 0) {
      p = "合计：￥${price.toString()}";
    }
    return Expanded(
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10),
        child: Text(p,
          style: TextStyle(
            color: appCommonColor,
            fontSize: 15
          ),
        ),
      )
    );
  }

  // 下单按钮
  orderButton() {
    return InkWell(
      onTap: canOrder ? (){
        orderCallBack();
      } : null,
      child: Container(
        alignment: Alignment.center,
        height: 48,
        width: 100,
        color: canOrder ? appCommonColor : Colors.black26,
        child: Text("下单",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
      ),
    );
  }

  // 删除按钮
  removeButton(){
    return InkWell(
      onTap: (){
        this.removeCallBack();
      },
      child: Container(
        alignment: Alignment.center,
        height: 32,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: appCommonColor,
                width: 1
            )
        ),
        child: Text("删除",
          style: TextStyle(
              color: appCommonColor,
              fontSize: 13
          ),
        ),
      ),
    );
  }
}
