import 'package:fire_shop/model/member/address_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:flutter/material.dart';

class AddressListItemWidget extends StatelessWidget {

  final AddressModel address;

  const AddressListItemWidget({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child: Row(
        children: <Widget>[
          this.icon(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                this.concactLabel(),
                this.addressLabel()
              ],
            ),
          ),
          this.editButton()
        ],
      ),
    );
  }

  Widget icon() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      width: 25,
      child: address.isDefault ? Icon(Icons.check_circle, color: appCommonColor, size: 25,) : null,
    );
  }
  
  Widget editButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        child: Image.asset("images/member/addr-edit.png"),
    )
    );
  }

  Widget concactLabel() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(address.concactText(),
        style: TextStyle(
          fontSize: 18
        ),
      ),
    );
  }

  Widget addressLabel() {
    return Container(
      child: Text(this.address.fullAddress()),
    );
  }
}
