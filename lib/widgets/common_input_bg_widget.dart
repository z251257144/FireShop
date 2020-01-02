import 'package:flutter/material.dart';
import '../utils/const.dart';

class CommonInputBgWidget extends StatelessWidget {

  final Widget subWidget;
  final bool fullLine;

  CommonInputBgWidget({Key key, this.subWidget, this.fullLine = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var border = Border(
        bottom: BorderSide(
            color: Colors.grey,
            width: 0.5
        )
    );

    return Container(
      height: appCommonTextFieldHeight,
      padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: fullLine ? border : null
      ),
      child: Container(
        decoration: BoxDecoration(
            border: fullLine ?  null : border
        ),
        child: subWidget,
      ),
    );
    return Container();
  }
}
