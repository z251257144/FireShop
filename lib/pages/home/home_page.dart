import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/pages/goods/goods_recommend/goods_recommend_widget.dart';
import 'package:fire_shop/pages/home/home_hot_widget.dart';
import 'package:fire_shop/pages/home/home_sales_widget.dart';
import 'package:fire_shop/pages/home/home_top_bannar_widget.dart';
import 'package:fire_shop/view_model/home/home_banner_view_model.dart';
import 'package:fire_shop/view_model/member/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {

  HomePage({Key key});

  HomeBannerViewModel viewModel = HomeBannerViewModel();

  AsyncMemoizer memoizer = AsyncMemoizer();

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    // monitor network fetch
    await viewModel.getBannerData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("pull up load");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("Load Failed!Click retry!");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("release to load more");
            }
            else{
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        onRefresh: _onRefresh,
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
