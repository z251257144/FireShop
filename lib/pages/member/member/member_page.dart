
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/member_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';
import 'member_header_widget.dart';
import 'member_order_widget.dart';
import 'member_function_widget.dart';
import 'package:fire_shop/view_model/member/member_view_model.dart';
import 'package:fire_shop/pages/member/login/login_page.dart';
import 'package:fire_shop/routes/route_path.dart';
import 'package:flutter/cupertino.dart';


class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {

  MemeberViewModel viewModel = MemeberViewModel();

  @override
  void initState() {
    // TODO: implement initState

    print("initState");
    super.initState();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate");
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(MemberPage oldWidget) {
    print("didUpdateWidget");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.fetchOrderStatistics();
    return Scaffold(
      backgroundColor: appCommonBackgroudColor,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
        children: <Widget>[
          this.headerView(),
          this.orderView(),
          this.functionView(),
        ],
      ),
    );
  }

  headerView() {
    return MemberHeaderWidget(callBack: (type){
      if (type == 0) {
        this.showLoginPage();
      }
      else if (type == 1) {
        this.showLogoutAlert();
      }
    },);
  }

  orderView() {
    return MemberOrderWidget(orderData: viewModel.orderData, callBack: (index){
      this.showOrderListView(index);
    },);
  }

  functionView() {
    return MemberFunctionView(functionData: viewModel.functionData, callBack: (index){
      this.showFunctionView(index);
    },);
  }

  // 显示退出登录弹框
  void showLogoutAlert() {
    var alert = CupertinoAlertDialog(
      title: Text("是否退出登录?"),
      actions: <Widget>[
        CupertinoButton(child: Text("取消"), onPressed: (){
          Navigator.pop(context);
        }),
        CupertinoButton(child: Text("确定"), onPressed: (){
          UserinfoManager.shared.setLoginInfo(null);
          Navigator.pop(context);
        }),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }

  /* 显示登录界面 */
  void showLoginPage() {
    Navigator.of(context).pushNamed(RoutePath.login);
  }

  showOrderListView(index) {
    this.showNextPage(RoutePath.orderList);
  }

  // 功能菜单点击
  showFunctionView(index) {
    MemberModel data = this.viewModel.functionData[index];
    if (data.memberType == MemberType.address) {
      if (UserinfoManager.shared.isShowLogin(context)) {
        this.showNextPage(RoutePath.addressList);
      }
    }
  }


  showNextPage(path, {arguments}) async {
    await Navigator.of(context).pushNamed(path, arguments: arguments);
    this.viewModel.fetchOrderStatistics();
  }
}