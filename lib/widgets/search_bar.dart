import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

typedef searchCallBack = void Function();

class SearchBar extends StatelessWidget {

  final double height;

  final Color backgroundColor;

  final searchCallBack onTap;

  const SearchBar({Key key, this.height = 36, this.backgroundColor = Colors.black12, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(child: searchInputWidget())
        ],
      ),
    );
  }

  searchInputWidget() {
    var border = OutlineInputBorder(
      borderSide: BorderSide(width: 0.01, color: this.backgroundColor),
      borderRadius: BorderRadius.circular(height / 2)
    );

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: this.backgroundColor,
        borderRadius: BorderRadius.circular(height / 2)
      ),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          prefixIcon: Icon(Icons.search),
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "搜索商品名称",
        ),
        onTap: (){
          print("onTap");
          if (this.onTap != null) {
            this.onTap();
          }
        },
      ),
    );
  }
}
