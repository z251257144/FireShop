import 'package:fire_shop/model/member/address_model.dart';
import 'package:flutter/material.dart';

class OrderConformShipWidget extends StatelessWidget {

  final AddressModel model;

  const OrderConformShipWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("配送方式"),
          Text("快递")
        ],
      ),
    );
  }

  addressWidget() {
    if (this.model == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          this.userWidget(),
          this.detailWidget(),
        ],
      ),
    );
  }
  
  userWidget() {
    return Text("${model.linkMan} ${model.mobile}");
  }

  detailWidget() {
    return Text(model.fullAddress());
  }
}
