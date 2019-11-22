import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("购物车"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Text("如果我们只需要将子 Widget 设定间距，则可以使用另一个单子容器控件 Padding 进行内容填充："),
      )
      
      // Container(
      //   margin: EdgeInsets.all(100),
      //   padding: EdgeInsets.all(20),
      //   width: 300,
      //   height: 200,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //     color: Colors.green,
      //     borderRadius: BorderRadius.circular(6),
      //   ),
      //   child: Text("kljfaslkfj"),
      // ),
    );
  }
}