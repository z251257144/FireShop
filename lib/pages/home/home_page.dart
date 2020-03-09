import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/pages/goods/goods_recommend/goods_recommend_widget.dart';
import 'package:fire_shop/pages/home/home_hot_widget.dart';
import 'package:fire_shop/pages/home/home_sales_widget.dart';
import 'package:fire_shop/pages/home/home_top_bannar_widget.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/view_model/home/home_banner_view_model.dart';
import 'package:fire_shop/view_model/member/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key});

  HomeBannerViewModel viewModel = HomeBannerViewModel();

  AsyncMemoizer memoizer = AsyncMemoizer();

  @override
  Widget build(BuildContext context) {

    memoizer.runOnce(() async {
      this.autoLogin();
      viewModel.getBannerData();
      viewModel.getRecommendGoods();
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("主页"),
      ),
      body: EasyRefresh(
        header: BallPulseHeader(color: appCommonColor),
        onRefresh: () async{
          await viewModel.getBannerData();
        },
        child: ListView(
          children: <Widget>[
            this.topWidget(),
            this.salesWidget(),
            this.hotWidget(),
            this.goodsRecommendWidget()
          ],
        )
      ),
    );
  }

  Widget topWidget() {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer(builder: (BuildContext context, HomeBannerViewModel value, Widget child){
        return HomeTopBannarWidget(data: value.topData);
      }),
    );
  }

  Widget salesWidget() {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer(builder: (BuildContext context, HomeBannerViewModel value, Widget child){
        return HomeSalesWidget(salesList: value.salesData);
      }),
    );
  }

  Widget hotWidget() {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer(builder: (BuildContext context, HomeBannerViewModel value, Widget child){
        return HomeHotWidget(data: value.hotData);
      }),
    );
  }

  goodsRecommendWidget() {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer(builder: (BuildContext context, HomeBannerViewModel value, Widget child){
        return GoodsRecommendWidget(goodsData: value.goodsData);
      }),
    );
  }

  autoLogin() {
    LoginViewModel().autoLogin();
  }
}
