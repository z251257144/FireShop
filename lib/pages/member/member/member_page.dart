
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';
import 'member_header_widget.dart';
//import 'member_order_widget.dart';
//import 'member_function_widget.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appCommonBackgroudColor,
      body: ListView(
        padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            MemberHeaderWidget(),
//            MemberOrderWidget(),
//            MemberFunctionView()
//            MemberFunctionView(),
          ],
      ),
    );
  }
}