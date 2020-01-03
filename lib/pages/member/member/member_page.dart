
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';
import 'member_header_widget.dart';
import 'member_order_widget.dart';
import 'member_function_widget.dart';
import 'package:fire_shop/view_model/member/member_view_model.dart';

class MemberPage extends StatelessWidget {

  MemeberViewModel viewModel = MemeberViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCommonBackgroudColor,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            MemberHeaderWidget(),
            MemberOrderWidget(orderData: viewModel.orderData,),
            MemberFunctionView(functionData: viewModel.functionData,)
          ],
      ),
    );
  }
}