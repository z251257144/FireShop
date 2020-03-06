import 'package:fire_shop/model/order/order_list_model.dart';
import 'package:fire_shop/pages/order/order_list/order_list_item_widget.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/list_util.dart';
import 'package:fire_shop/view_model/order/order_list_view_model.dart';
import 'package:fire_shop/widgets/LoadingWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListPage extends StatefulWidget {
  final int orderIndex;

  const OrderListPage({Key key, this.orderIndex}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState(this.orderIndex);
}

class _OrderListPageState extends State<OrderListPage> with SingleTickerProviderStateMixin  {

  int orderIndex = 0;

  OrderListViewModle _viewModle = OrderListViewModle();
  TabController _tabController;

  _OrderListPageState(this.orderIndex); //需要定义一个Controller

  @override
  void initState() {
    super.initState();
    print("_viewModle.fetchOrderList();");
    // 创建Controller
    _tabController = TabController(length: 5, vsync: this, initialIndex: this.orderIndex);
    _viewModle.typeIndex = this.orderIndex;
    _viewModle.fetchOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("订单列表"),
        bottom: TabBar(   //生成Tab菜单
          controller: _tabController,
          indicatorColor: appCommonColor,
          onTap: (index) {
            this.tabbarChanged(index);
          },
          tabs: _viewModle.orderTypeConfig.map((e) => Tab(text: e["title"])).toList()
        ),
      ),
      body: this.bodyView(),
    );
  }

  bodyView() {
    return ChangeNotifierProvider.value(
      value: _viewModle,
      child: Consumer(builder: (context, OrderListViewModle value, child) {
        if (ListUtil.isEmpty(_viewModle.orderList)) {
          return Center(
            child: Text("暂无订单"),
          );
        }
        return this.listView();
      }),
    );
  }

  // 订单列表
  listView() {
    return ListView.builder(
      itemCount: _viewModle.orderList.length,
      itemBuilder: (context, index) {
        var model = _viewModle.orderList[index];
        return OrderListItemWidget(model: model, callBack: (item){
          this.showOrderDetail(item);
        });
      },
    );
  }

  // 订单类型切换
  tabbarChanged(index) {
    _viewModle.typeIndex = index;

    LoadingDialog().showLoadingView(context);
    _viewModle.fetchOrderList().whenComplete((){
      Navigator.of(context).pop();
    });
  }

  // 显示订单详情
  showOrderDetail(OrderListModel item) {
    Navigator.of(context).pushNamed(RoutePath.orderDetail, arguments: {"orderId": item.id});
  }
}
