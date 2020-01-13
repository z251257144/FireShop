import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GoodsDetailImageWidget extends StatelessWidget {

  final List pics;

  const GoodsDetailImageWidget({Key key, this.pics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (pics == null || pics.length == 0) {
      return Container(height: ScreenUtil().setWidth(appScreenWidth),);
    }
    return Container(
      height: ScreenUtil().setWidth(appScreenWidth),
      child: Swiper(
        loop: pics.length > 0,
        itemCount: pics.length,
        itemBuilder: (context, index) {
          return this.itemWidget(pics[index]);
        },
        pagination: this.pagination(),
      ),
    );
  }

  pagination() {
    return SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        activeColor: appCommonColor,
        color: Colors.grey,
        size: 10
      )
    );
  }

  Widget itemWidget(url) {
    return Container(
      height: ScreenUtil().setWidth(appScreenWidth),
      child: Image.network(url,
        fit: BoxFit.fill,
      ),
    );
  }
}
