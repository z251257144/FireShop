import 'package:fire_shop/pages/goods/goods_detail/goods_detail_image_widget.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_info_widget.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_specification_bar.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_details_bottom_bar.dart';
import 'package:fire_shop/view_model/goods/goods_detail_view_model.dart';
import 'package:flutter/material.dart';

class GoodsDetailPage extends StatefulWidget {
  final String id;

  GoodsDetailPage({Key key, this.id});

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState(id);
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  GoodsDetailViewModel _viewModel;

  _GoodsDetailPageState(String id) {
    _viewModel = GoodsDetailViewModel(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("商品详情"),
      ),

      body: Stack(
        children: <Widget>[
          futureBuilder(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GoodsDetailBottomBar()
          )
        ],
      ),
    );
  }

  FutureBuilder futureBuilder() {
    return FutureBuilder(
      future: _viewModel.fetchGoodsDetial(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData) {
          return goodsDetailList();
        }
        if (snapshot.hasError) return errorWidget(snapshot.error);
        return Center(child: CircularProgressIndicator());
    });
  }

  Widget errorWidget(FormatException error) {
    if (error.offset == 700) {
      return Center(child: Text("没有相关商品！"));
    }
    return Center(child: Text(error.message));
  }

  Widget goodsDetailList() {
    return ListView(
      children: <Widget>[
        GoodsDetailImageWidget(pics: _viewModel.model.pics),
        GoodsDetailInfoWidget(model: _viewModel.model),
        GoodsDetailSpecificationBar(),
      ],
    );
  }
}
