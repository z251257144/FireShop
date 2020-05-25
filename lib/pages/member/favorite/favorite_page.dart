import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏夹"),
        backgroundColor: Colors.white,
      ),
      body: this.listView(context);
    );
  }
  
  Widget listView(context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Text("asd");
      }
    );
  }
}


