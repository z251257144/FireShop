import 'package:fire_shop/manager/cart_manager.dart';
import 'package:fire_shop/pages/cart/cart_list/cart_list_page.dart';
import 'package:fire_shop/pages/goods/category/category_page.dart';
import 'package:fire_shop/pages/home/home_page.dart';
import 'package:fire_shop/pages/member/member/member_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/utils/device_util.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

final double width = 25;

final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Image.asset("images/button_icons/home-off.png", width: width, height: width,),
      activeIcon: Image.asset("images/button_icons/home-on.png", width: width, height: width,),
      title: Text("首页")
    ),
    BottomNavigationBarItem(
      icon: Image.asset("images/button_icons/menu-off.png", width: width, height: width,),
      activeIcon: Image.asset("images/button_icons/menu-on.png", width: width, height: width,),
      title: Text("搜索")
    ),
    BottomNavigationBarItem(
      icon: Image.asset("images/button_icons/cart-off.png", width: width, height: width,),
      activeIcon: Image.asset("images/button_icons/cart-on.png", width: width, height: width,),
      title: Text("购物车")
    ),
    BottomNavigationBarItem(
      icon: Image.asset("images/button_icons/my-off.png", width: width, height: width,),
      activeIcon: Image.asset("images/button_icons/my-on.png", width: width, height: width,),
      title: Text("我的")
    )
  ];

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    CartListPage(),
    MemberPage()
  ];

class _IndexPageState extends State<IndexPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    DeviceUtil.setScreenSize(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 171, 43, 43),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: items,
        currentIndex: _index,
        onTap: (index) {
          if (index == 2) {
            this.refreshCart();
          }
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

  refreshCart() {
    CartManager.shared.refreshCartData();
  }
}

