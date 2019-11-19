import 'package:fire_shop/pages/cart/cart_page.dart';
import 'package:fire_shop/pages/category/category_page.dart';
import 'package:fire_shop/pages/home/home_page.dart';
import 'package:fire_shop/pages/member/member_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text("首页")
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text("搜索")
    ),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("我的"))
  ];

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

class _IndexPageState extends State<IndexPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: _index,
        onTap: (index) {
          this.setState((){
            _index = index;
          });
        },
      ),
      body: IndexedStack(
        index: _index,
        children: pages,
      ),
    );
  }
}

