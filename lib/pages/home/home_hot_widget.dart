import 'package:flutter/material.dart';

class HomeHotWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 300,
      child: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _hotItemWidget(),
          _hotItemWidget(),
          _hotItemWidget(),
        ],
      ),
    );
  }

  Widget _hotItemWidget() {
    return Container(
      width: 150,
      height: 120,
      child: Image.network("https://cdn.it120.cc/apifactory/2019/07/11/e8315cf4-d24d-42e3-9523-6fc63f01a4a8.jpg"),
    );
  }
}