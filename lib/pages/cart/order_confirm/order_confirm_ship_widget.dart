import 'package:flutter/material.dart';

class OrderConformShipWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return shipWidget();



    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          shipWidget(),
          addressWidget()
        ],
      ),
    );
  }

  shipWidget() {
    return Container(
      height: 44,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text("配送方式"),
    );
  }

  addressWidget() {
    return Container(
      child: Text("配送方式"),
    );
  }
}
