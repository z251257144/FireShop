import 'package:fire_shop/model/home/home_bannar_model.dart';
import 'package:flutter/material.dart';

class HomeSalesWidget extends StatelessWidget {
  final List<HomeBannarModel> salesList;

  const HomeSalesWidget({this.salesList});

  @override
  Widget build(BuildContext context) {
    if (salesList == null) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        color: Colors.white,
        height: 100
      );
    }

    return Container(
      color: Colors.white,
      height: 100,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: GridView.count(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        crossAxisCount: salesList.length,
        physics: new NeverScrollableScrollPhysics(),
        children: salesList.map((model) {
          return this._homeSalesItemWidget(model);
        }).toList(),
      ),
    );
  }

  Widget _homeSalesItemWidget(HomeBannarModel info) {
    // print(info);
    return Container(
      width: 50,
      child: Column(
        children: <Widget>[
          Image.network(info.picUrl,
            width: 46,
            height: 46,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(info.title),
          )
        ],
      ),
    );
  }
}