import 'package:fire_shop/pages/index_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const Color appMainColor = Color.fromARGB(255, 184, 39, 48);

class MyApp extends StatelessWidget {
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