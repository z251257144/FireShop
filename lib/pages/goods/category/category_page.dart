import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text("sdaf")
    );
    
    
    // CustomScrollView(
    //     slivers: <Widget>[
    //       SliverAppBar(//SliverAppBar 作为头图控件
    //         title: Text('CustomScrollView Demo'),// 标题
    //         floating: true,// 设置悬浮样式
    //         flexibleSpace: Image.network("http://a.hiphotos.baidu.com/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",fit:BoxFit.cover),// 设置悬浮头图背景
    //         expandedHeight: 200,// 头图控件高度
    //       ),
    //       SliverList(//SliverList 作为列表控件
    //         delegate: SliverChildBuilderDelegate(
    //               (context, index) => ListTile(title: Text('Item #$index')),// 列表项创建方法
    //           childCount: 50,// 列表元素个数
    //         ),
    //       ),
    //     ],
    // );
  }
}