import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

typedef GoodsDetailTabBarCallBack = void Function(int index);

class GoodsDetailTabBar extends StatelessWidget {

  final int index;

  final GoodsDetailTabBarCallBack onChange;

  final double height;

  const GoodsDetailTabBar({Key key, this.index = 0, this.onChange, this.height = 48}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          itemButton("商品介绍", 0),
          itemButton("商品评价", 1),
        ],
      ),
    );
  }

  itemButton(title, itemIndex) {
    var border = Border(
        bottom: BorderSide(
            color: appCommonColor,
            width: 1
        )
    );

    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {
          if (onChange != null) {
            onChange(itemIndex);
          }
        },
        child: Container(
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: itemIndex == index ? border : null
          ),
          child: Text(title,
            style: TextStyle(
              fontSize: 16,
              color: itemIndex == index ? appCommonColor : Colors.black87
            ),
          ),
        ),
      ),
    );
  }
}
