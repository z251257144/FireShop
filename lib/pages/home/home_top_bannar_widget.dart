import 'package:fire_shop/model/home/home_bannar_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeTopBannarWidget extends StatelessWidget {
  final List<HomeBannarModel> data;

  final double height;

  const HomeTopBannarWidget({this.data, this.height = 200});

  @override
  Widget build(BuildContext context) {
    if (data == null || data.length == 0) {
      return Container(
          height: this.height,
          color: Colors.white
      );
    }
    
    return CarouselSlider.builder(
      height: this.height,
      autoPlay: true,
      viewportFraction: 1.0,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        return Container(
          child: Image.network(data[itemIndex].picUrl,
            fit: BoxFit.fill,
          ),
        );
      }
    );
  }
}