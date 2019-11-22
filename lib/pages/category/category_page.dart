import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  ScrollController _controller;//ListView 控制器
  
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.network("http://a.hiphotos.baidu.com/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",fit:BoxFit.cover),// 设置悬浮头图背景
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid( //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建子widget      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  //创建列表项      
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },
                childCount: 30 //50个列表项
            ),
          ),
        ],
      ),
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