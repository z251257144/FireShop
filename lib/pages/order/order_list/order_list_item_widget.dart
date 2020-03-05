import 'package:fire_shop/model/order/order_list_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

class OrderListItemWidget extends StatelessWidget {
  final OrderListModel model;

  const OrderListItemWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          this.headView(),
          this.goodsView(),
          this.bottomView()
        ],
      ),
    );
  }

  headView() {
    return Container(
      height: 44,
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(model.id.toString()),
          Text(model.statusStr,
            style: TextStyle(
              color: appCommonColor
            ),
          )
        ],
      ),
    );
  }

  goodsView() {

    return Container(
      height: 110,
    );
  }

  bottomView() {
    return Container(
      height: 50,
      margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Colors.black12,
                  width: 0.5
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(model.dateAdd,
            style: TextStyle(
                fontSize: 13
            )
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("共${model.goodsNumber}件商品，合计:￥",
                style: TextStyle(
                    fontSize: 13
                ),
              ),
              Text(model.amount.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: appCommonColor
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
