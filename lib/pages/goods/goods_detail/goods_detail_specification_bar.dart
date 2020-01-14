import 'package:fire_shop/model/goods_detail_model.dart';
import 'package:flutter/material.dart';

class GoodsDetailSpecificationBar extends StatelessWidget {

  final GoodsDetailModel model;

  const GoodsDetailSpecificationBar({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
      color: Color(0xffF5F5F5),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        height: 48,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text("选择规格：颜色")
            ),
            
          ],
        ),
      ),
    );
  }
}
