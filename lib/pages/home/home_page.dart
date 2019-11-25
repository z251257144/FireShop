import 'package:fire_shop/pages/home/home_hot_widget.dart';
import 'package:fire_shop/pages/home/home_sales_widget.dart';
import 'package:fire_shop/pages/home/home_top_bannar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  List salesData() {
    List list = new List();

    var map1 = {'fisrt': 'dart', 'second': 'java'};
    list.add(map1);

    var map2 = {'fisrt': 'dart', 'second': 'java'};
    list.add(map1);
    
    var map3 = {'fisrt': 'dart', 'second': 'java'};
    list.add(map1);
    
    var map4 = {'fisrt': 'dart', 'second': 'java'};
    list.add(map1);
    
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 241, 241),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("主页"),
      ),
      body: ListView(
        children: <Widget>[
          HomeTopBannarWidget(imageUrl: "https://image.crov.com/pd5-bsVgDvqyNovW/diercon-tactical-water-micro-filter-tw01--reusable-personal-hand-pump-water-purifier-camping-emergency-survival-gear-3-stage-process-removes-999999-of-waterborne-bacteria.jpg",),
          HomeSalesWidget(salesList: this.salesData(),),
          HomeHotWidget()
        ],
      ),
    );
  }
}

TextStyle blueStyle = TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.normal);
TextStyle blackStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black); // 黑色样式
