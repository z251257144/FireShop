import 'package:flutter/material.dart';

class HomeTopBannarWidget extends StatelessWidget {
  final String imageUrl;

  const HomeTopBannarWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Color(0xffEFEFF0),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Image.network(this.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}