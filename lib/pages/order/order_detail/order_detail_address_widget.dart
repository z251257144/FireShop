import 'package:fire_shop/model/member/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailAddressWidget extends StatelessWidget {
  final AddressModel model;

  const OrderDetailAddressWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.model == null) {
      return Container();
    }

    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
              width: 0.5
            )
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Image.asset("images/order/icon-address.png", width: 20, height: 20)
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(6, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    this.userLabel(),
                    this.addressLabel()
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
  
  userLabel() {
    return Text("${this.model.linkMan}  ${this.model.mobile}");
  }

  addressLabel() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(this.model.fullAddress(),
        style: TextStyle(
            color: Colors.black54
        ),
      )
    );
  }
}
