import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GoodsDetailImageWidget extends StatelessWidget {

  final List pics;

  const GoodsDetailImageWidget({Key key, this.pics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: pics.length,
        itemBuilder: (context, index) {
          return this.itemWidget(pics[index]);
        },
      ),
    );
  }

  Widget itemWidget(url) {
    return Container(
      child: Image.network(url,
        fit: BoxFit.fill,
      ),
    );
  }
}
