import 'package:flutter/material.dart';

class MemberOrderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        titleWidget(),
        orderGirdWidget()
      ],
    );
  }

  Widget titleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.fromLTRB(15, 15, 0, 15),
      alignment: Alignment.centerLeft,
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
         Image.asset("images/member/profile_dfunding.png", width: 20, height: 20,),
          Container(
            padding: EdgeInsets.only(left: 7),
            child: Text("我的订单",
              style: TextStyle(
                fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget orderGirdWidget() {
    return Container(
      height: 90,
      color: Colors.white,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        itemCount: orderData.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 4,
            //纵轴间距
            mainAxisSpacing: 0,
            //横轴间距
            crossAxisSpacing: 20.0,
        ),
        itemBuilder: (context, index){
          return orderItemWidget(orderData[index]);
        }
      ),
    );
  }

  Widget orderItemWidget(data) {
    return Container(
//      height: 90,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: <Widget>[
         Image.asset(data["icon"], width: 20, height: 20,),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(data["title"],
              style: TextStyle(
                  fontSize: 15
              ),
            ),
          )
        ],
      ),
    );
  }

  final orderData = [
    {
      "title": "待付款",
      "icon": "images/member/orderform_pay.png",
      "type": 1,
    },
    {
      "title": "待发货",
      "icon": "images/member/orderform_ship.png",
      "type": 1,
    },
    {
      "title": "待收货",
      "icon": "images/member/delivering.png",
      "type": 1,
    },
    {
      "title": "待评价",
      "icon": "images/member/orderform.png",
      "type": 1,
    }
  ];
}
