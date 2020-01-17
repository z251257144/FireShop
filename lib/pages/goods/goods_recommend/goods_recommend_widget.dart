import 'package:fire_shop/model/goods/goods_list_model.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

class GoodsRecommendWidget extends StatelessWidget {
  final List<GoodsListModel> goodsData;

  const GoodsRecommendWidget({Key key, this.goodsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (goodsData == null || goodsData.length == 0) {
      return Container();
    }



    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          titleWidget(),
          gridView(),
        ],
      ),
    );
  }

  line() {
    return Container(
      height: 1,
      width: 15,
      color: appCommonColor,
    );
  }

  titleWidget() {
    return Container(
      height: 48,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          line(),
          Container(
            margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
            child: Text("人气推荐"),
          ),
          line()
        ],
      ),
    );
  }

  gridView() {
    double itemWidth = (ScreenUtil().setWidth(appScreenWidth) - 45) / 2.0;
    double itemHeight = itemWidth + 100;

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: goodsData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing:15,
        childAspectRatio: itemWidth / itemHeight
      ),
      itemBuilder: (context, index){
        return itemWidget(context, goodsData[index]);
    });
  }

  itemWidget(context, GoodsListModel model) {
    return InkWell(
      onTap: () {
        showGoodsDetail(context, model);
      },
      child: Container(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(model.pic, fit: BoxFit.fill,),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 4),
              child: Text(model.name, maxLines: 1,),
            ),
            Text(model.characteristic,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black26,
                fontSize: 13
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              child: Text("￥ ${model.minPrice}",
                style: TextStyle(
                  color: appCommonColor,
                  fontSize: 15
                )
              ),
            )
          ],
        )
      ),
    );
  }

  showGoodsDetail(context, GoodsListModel model) {
    Navigator.of(context).pushNamed(RoutePath.goodsDetail, arguments: {"id": model.id});
  }


}
