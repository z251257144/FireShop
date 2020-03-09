import 'package:fire_shop/model/home/home_bannar_model.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeTopBannarWidget extends StatelessWidget {
  final List<HomeBannarModel> data;

  final double height;

  const HomeTopBannarWidget({this.data, this.height = 200});

  @override
  Widget build(BuildContext context) {
    if (data == null || data.length == 0) {
      return Container(
          height: this.height,
          color: Colors.white
      );
    }
    
    return Container(
      height: this.height,
      color: Colors.white,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return this.itemWidget(data[index], context);
        },
        autoplay: true,
        itemCount: data.length,
        pagination: this.paginationWidget(),
      ),
    );
  }

  Widget itemWidget(HomeBannarModel model, context) {
    return InkWell(
      onTap: (){
        this.onTap(model, context);
      },
      child: Container(
        height: this.height,
        child: Image.network(model.picUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  SwiperPagination paginationWidget() {
    return SwiperPagination(
      builder: DotSwiperPaginationBuilder(
        color: Colors.white,
        activeColor: appCommonColor,
        size: 10
      )
    );
  }

  onTap(HomeBannarModel model, context) {
//    if (model.linkUrl == RoutePath.goodsDetail) {
//      Navigator.of(context).pushNamed(RoutePath.goodsDetail, arguments: {"id": model.remark});
//    }
    Navigator.of(context).pushNamed(RoutePath.orderPay, arguments: {"orderId": 471813});
  }


}