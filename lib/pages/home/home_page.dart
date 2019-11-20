import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Image.asset("images/profile_tegral.png"),
    );
  }
}

TextStyle blueStyle = TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.normal);
TextStyle blackStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black); // 黑色样式
