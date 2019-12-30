import 'package:fire_shop/pages/index_page.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/server/base_server.dart';

void main() {
  BaseServer.baseUrl = "https://api.it120.cc/aca1c7ec5f68a84eed653a654ef4639e/";
  runApp(MyApp());
}

const Color appMainColor = Color.fromARGB(255, 184, 39, 48);

class MyApp extends StatelessWidget {

  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: IndexPage(),
    );
  }
}