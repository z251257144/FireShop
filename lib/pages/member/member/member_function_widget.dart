import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

class MemberFunctionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: ScreenUtil().setHeight(DeviceUtil.screenWidth / (3*1.2) *2 ),
      color: Colors.white,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 0,
            //横轴间距
            crossAxisSpacing: 0.0,
            childAspectRatio: 1.2
        ),
        itemBuilder: (context, index) {
          return this.itemWidget(functionData[index]);
        }
      ),
    );
  }

  Widget itemWidget(data) {
    var border = BorderSide(
        color: Colors.black12,
        width: 0.5
    );

    return Container(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(40), 0, 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: border,
          right: border
        )
      ),
      child: Column(
        children: <Widget>[
          Image.asset(data["icon"], width: 30,),
          Container(
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(8)),
            child: Text(data["title"], 
              style: TextStyle(
                fontSize: 15
              ),
            ),
          ),
          Text(data["value"] != null ? data["value"] : "", 
            style: TextStyle(
              color: Color(0xff939393),
              fontSize: 12
            ),
          )
        ],
      ),
    );
  }

    final functionData = [
    {
      "title": "我的余额",
      "value": "0 元",
      "icon": "images/member/profile_tegral.png",
      "type": 1,
    },
    {
      "title": "我的积分",
      "value": "3 积分",
      "icon": "images/member/jifen.png",
      "type": 1,
    },
    {
      "title": "我的礼券",
      "icon": "images/member/profile_ticket.png",
      "type": 1,
    },
    {
      "title": "我的收藏",
      "icon": "images/member/profile_collection.png",
      "type": 1,
    },
    {
      "title": "我的地址",
      "icon": "images/member/profile_address.png",
      "type": 1,
    }
  ];
}
