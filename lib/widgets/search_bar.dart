import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

typedef searchCallBack = void Function();

class SearchBar extends StatelessWidget {

  final double height;

  final Color backgroundColor;

  final searchCallBack onTap;

  final ValueChanged<String> onSubmitted;

  final ValueChanged<String> onChanged;

  const SearchBar({Key key,
    this.height = 36,
    this.backgroundColor = Colors.black12,
    this.onTap,
    this.onSubmitted,
    this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
//        expands: true,
        readOnly: this.onTap != null,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          prefixIcon: Icon(Icons.search),
          enabledBorder: border,
          focusedBorder: border,
          disabledBorder: border,
          hintStyle: TextStyle(color:
            Colors.grey[800],
            fontSize: 16
          ),
          hintText: "搜索商品名称",
        ),
        onTap: (){
          print("onTap");
          if (this.onTap != null) {
            this.onTap();
          }
        },
        onSubmitted: (text) {
          if(text == null || text.length == 0) {
            return;
          }

          if (this.onSubmitted != null) {
            this.onSubmitted(text);
          }
        },
        onChanged: (text){
          if (this.onChanged != null) {
            this.onChanged(text);
          }
        },
      ),
    );
  }
}
