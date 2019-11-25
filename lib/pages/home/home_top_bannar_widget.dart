import 'package:flutter/material.dart';

class HomeTopBannarWidget extends StatelessWidget {
  final String imageUrl;

  const HomeTopBannarWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Image.network(this.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}