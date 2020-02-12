import 'package:fire_shop/model/goods/goods_list_model.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

typedef GoodsSearchResultGridCallBack = void Function();

class GoodsSearchResultGridItemWidget extends StatelessWidget {

  final GoodsListModel model;

  final GoodsSearchResultGridCallBack onTap;

  const GoodsSearchResultGridItemWidget({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if (this.onTap != null) {
          this.onTap();
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            imageView(),
            nameLabel(),
            infoView()
          ],
        ),

      ),
    );
  }

  imageView(){
    return Image.network(model.pic,
      width: itemWith(),
      height: itemWith(),
    );
  }

  nameLabel(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
      alignment: Alignment.centerLeft,
      child: Text(model.name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
        ),
      ),
    );
  }

  infoView(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("￥${model.minPrice}",
          style: TextStyle(
            color: Colors.red
          ),
        ),
        Text("已售${model.numberOrders}"),
      ],
    );
  }

  static double itemWith(){
    return (ScreenUtil().setWidth(appScreenWidth) - 40) / 2;
  }

  static double aspectRatio(){
    double width = itemWith();
    return width / (width+50);
  }
}
