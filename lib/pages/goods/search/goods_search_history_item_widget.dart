import 'package:flutter/material.dart';

class GoodsSearchItemWidget extends StatelessWidget {

  final String title;

  const GoodsSearchItemWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Color(0xff6C6C6C)
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(this.title,
        style: TextStyle(
          color: Color(0xff6C6C6C)
        ),
      ),
    );
  }
}
