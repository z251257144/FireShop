import 'package:fire_shop/model/home/home_bannar_model.dart';
import 'package:flutter/material.dart';

class HomeHotWidget extends StatelessWidget {
  final List<HomeBannarModel> data;

  const HomeHotWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null || data.length == 0) {
      return Container();
    }

    return Container(
      // color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 300,
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
            crossAxisCount: 2,
            //纵轴间距
            mainAxisSpacing: 0,
            //横轴间距
            crossAxisSpacing: 0.0,
            childAspectRatio: 338.0/260.0
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _hotItemWidget(data[index]);
        },
      ),
    );
  }

  Widget _hotItemWidget(HomeBannarModel model) {
    return InkWell(
      onTap: (){
        print(model);
      },
      child: Container(
        child: Image.network(model.picUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}