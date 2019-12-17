import 'package:flutter/material.dart';

class HomeSalesWidget extends StatelessWidget {
  final List salesList;

  const HomeSalesWidget({this.salesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 100,
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: GridView.count(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        crossAxisCount: 4,
        physics: new NeverScrollableScrollPhysics(),
        children: salesList.map((model) {
          return this._homeSalesItemWidget(model);
        }).toList(),
      ),
    );
  }

  Widget _homeSalesItemWidget(Map info) {
    // print(info);
    return Container(
      width: 50,
      child: Column(
        children: <Widget>[
          Image.network("https://cdn.it120.cc/apifactory/2019/07/11/2cc82048-b950-4a07-a597-e739a70d7f5f.png",
            width: 46,
            height: 46,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("礼券"),
          )
        ],
      ),
    );
  }
}