import 'package:fire_shop/pages/member/member/member_header_widget.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[
        MemberHeaderWidget()
      ],
    );
  }
}