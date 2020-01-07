import 'package:flutter/material.dart';

class AddressListItemWidget extends StatelessWidget {

  final address;

  const AddressListItemWidget({Key key, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      child: Text(this.address.toString()),
    );
  }
}
