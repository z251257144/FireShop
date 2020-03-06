import 'package:fire_shop/model/order/order_list_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

typedef OrderListItemCallBack = void Function(OrderListModel);

class OrderListItemWidget extends StatelessWidget {
  final OrderListModel model;
  final OrderListItemCallBack callBack;

  const OrderListItemWidget({Key key, this.model, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.callBack != null) {
          this.callBack(this.model);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            this.headView(),
            this.goodsView(),
            this.bottomView()
          ],
        ),
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
    double width = (ScreenUtil().setWidth(appScreenWidth) - 50)/3.0;
    print(width);
    
    int count = this.model.goodsList.length;
    count = count>3 ? 3 : count;

    List<Widget> listView = [];
    for (int i=0; i<count; i++) {
      Map item = this.model.goodsList[i];
      Widget image = ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(item["pic"],
          width: width,
          height: width,
        )
      );
      listView.add(image);
    }

    return Container(
      height: width+30,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        crossAxisCount: 3,
        children: listView,
      ),
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
