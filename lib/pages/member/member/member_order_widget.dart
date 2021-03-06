import 'package:fire_shop/model/member/member_model.dart';
import 'package:fire_shop/routes/route_path.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/view_model/member/member_view_model.dart';
import 'package:flutter/material.dart';

typedef MemberOrderCallBack = void Function(int);

class MemberOrderWidget extends StatelessWidget {
  final List orderData;
  final MemberOrderCallBack callBack;

  const MemberOrderWidget({Key key, this.orderData, this.callBack}) : super(key: key);

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
    return InkWell(
      onTap: () {
        this.callBack(-1);
      },
      child: Container(
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
            Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 7),
                  child: Text("我的订单",
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              child: Image.asset("images/member/arrow-right.png", width: 10, height: 19,),
            )
          ],
        ),
      )
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
          return orderItemWidget(index);
        }
      ),
    );
  }

  Widget orderItemWidget(index) {
    MemberModel data = this.orderData[index];
    return InkWell(
      onTap: (){
        this.callBack(index);
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Image.asset(data.icon, width: 20, height: 20,),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(data.title,
                    style: TextStyle(
                        fontSize: 15
                    ),
                  ),
                )
              ],
            ),
            this.countBadge(data.value)
          ],
        ),
      ),
    );
  }

  countBadge(text) {
    if (text == null || int.parse(text) <=0) {
      return Container();
    }
    return Positioned(
      top: 10,
      right: 30,
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: appCommonColor,
          borderRadius: BorderRadius.circular(8),

        ),
        alignment: Alignment.center,
        child: Text(text,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      )
    );
  }
}
