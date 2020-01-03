import 'package:flutter/material.dart';

class MemberFunctionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 200,
      color: Colors.white,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素个数
            crossAxisCount: 3,
            //纵轴间距
            mainAxisSpacing: 0,
            //横轴间距
            crossAxisSpacing: 0.0,
        ),
        itemBuilder: (context, index) {
          return this.itemWidget(null);
        }
      ),
    );
  }

  Widget itemWidget(data) {
    var border = BorderSide(
        color: Colors.black12,
        width: 0.5
    );

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          bottom: border,
          right: border
        )
      ),
    );
  }
}
