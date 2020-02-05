import 'package:flutter/material.dart';

class GoodsSearchResultPage extends StatefulWidget {
  final String searchWord;

  const GoodsSearchResultPage(this.searchWord);

  @override
  _GoodsSearchResultPageState createState() => _GoodsSearchResultPageState(searchWord);
}

class _GoodsSearchResultPageState extends State<GoodsSearchResultPage> {

  final String searchWord;

  _GoodsSearchResultPageState(this.searchWord);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("search"),
      ),
      body: Center(
        child: Text(searchWord),
      ),
    );
  }
}

