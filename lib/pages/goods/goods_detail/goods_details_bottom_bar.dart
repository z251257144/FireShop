import 'package:fire_shop/pages/goods/goods_detail/goods_detail_page.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fire_shop/model/goods/goods_detail_model.dart';

typedef GoodsDetailBottomBarCallback = void Function(GoodsDetailOperateType);

class GoodsDetailBottomBar extends StatelessWidget {

  const GoodsDetailBottomBar({
    Key key,
    this.model,
    this.onTap,
    this.cartCount = 0,
    this.isFavorite = false,
  }) : super(key: key);

  final GoodsDetailModel model;
  final int cartCount;
  final bool isFavorite;
  final GoodsDetailBottomBarCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (model == null) {
      return Container(
          height: 48,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      color: Colors.black38,
                      width: 1
                  )
              )
          )
      );
    }

    return Container(
      height: (48+MediaQuery.of(context).padding.bottom),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black38,
            width: 1
          )
        )
      ),
      child: Row(
        children: <Widget>[
          cartButton(),
          favButton(),
          buyButton(),
          addToCartButton()
        ],
      ),
    );
  }

  // 显示购物车按钮
  cartButton() {
    return InkWell(
      onTap: (){
        onTap(GoodsDetailOperateType.showCart);
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      color: Colors.black26,
                      width: 0.5
                  )
              )
            ),
            child: Image.asset("images/goods/shopping_cart.png",
              width: 20,
            )
          ),
          Positioned(
            top: 5,
            right: 10,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(8)
                ),
                color: appCommonColor
              ),
              alignment: Alignment.center,
              child: Text(cartCount.toString(),
                style: TextStyle(
                  color: Colors.white
                ),
              ),
            )
          )
        ],
      )
    );
  }

  // 收藏按钮
  favButton() {
    var image = isFavorite ? "images/goods/goods_collect_checked.png" : "images/goods/goods_collect.png";
    return InkWell(
      onTap: (){
        onTap(GoodsDetailOperateType.favorite);
      },
      child: Container(
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                    color: Colors.black26,
                    width: 0.5
                )
            )
        ),
        child: Image.asset(image,
          width: 20,
        )
      )
    );
  }

  // 立即购买按钮
  buyButton() {
    return InkWell(
        onTap: (){
          onTap(GoodsDetailOperateType.buyNow);
        },
        child: Container(
          width: (ScreenUtil().setWidth(appScreenWidth)-120)/2.0,
          alignment: Alignment.center,
          child: Text("立即购买",
            style: TextStyle(
              fontSize: 16
            ),
          )
        )
    );
  }

  // 加入购物车按钮
  addToCartButton() {
    return InkWell(
        onTap: (){
          onTap(GoodsDetailOperateType.addToCart);
        },
        child: Container(
          width: (ScreenUtil().setWidth(appScreenWidth)-120)/2.0,
          alignment: Alignment.center,
          color: appCommonColor,
          child: Text("加入购物车",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          )
        )
    );
  }
}
