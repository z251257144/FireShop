import 'package:flutter/material.dart';

typedef GoodsSearchHistoryItemOnTap = void Function(String);

class GoodsSearchHistoryItemWidget extends StatelessWidget {

  final String title;

  final GoodsSearchHistoryItemOnTap onTap;

  const GoodsSearchHistoryItemWidget({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
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
      ),
      onTap: (){
        this.onTap(title);
      },
    );
  }
}
