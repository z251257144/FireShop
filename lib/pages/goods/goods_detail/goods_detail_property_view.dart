import 'package:fire_shop/model/goods/goods_childs_property_model.dart';
import 'package:fire_shop/model/goods/goods_detail_model.dart';
import 'package:fire_shop/model/goods/goods_property_model.dart';
import 'package:fire_shop/pages/goods/goods_detail/goods_detail_page.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:fire_shop/utils/list_util.dart';
import 'package:flutter/material.dart';


typedef GoodsDetailPropertyCallBack = void Function(GoodsDetailOperateType);

//商品规格、购买数量界面
class GoodsDetailPropertyView extends StatefulWidget {
  final GoodsDetailModel model;
  final GoodsDetailOperateType type;
  final GoodsDetailPropertyCallBack callBack;

  const GoodsDetailPropertyView({
    Key key,
    this.model,
    this.type = GoodsDetailOperateType.addToCart,
    this.callBack
  }) : super(key: key);

  @override
  _GoodsDetailPropertyViewState createState() => _GoodsDetailPropertyViewState(
    model,
    type,
    callBack
  );

  // 显示
  show(context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context){
        return this;
      }
    );
  }
}

class _GoodsDetailPropertyViewState extends State<GoodsDetailPropertyView> {

  final GoodsDetailModel model;
  final GoodsDetailOperateType type;
  final GoodsDetailPropertyCallBack callBack;

  _GoodsDetailPropertyViewState(this.model, this.type, this.callBack);

  @override
  Widget build(BuildContext context) {

    print(model.properties);
    return SafeArea(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
//            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            headView(),
            contentView(),
            sureButton()
          ],
        ),
      )
    );
  }

  headView(){
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
            width: 0.5
          )
        )
      ),
      child: Row(
        children: <Widget>[
          Image.network(model.pic,
            width: 70,
            height: 70,
          ),
          goodsInfoView()
        ],
      ),
    );
  }

  contentView(){
    if (ListUtil.isEmpty(model.properties)) {
      return Container();
    }

    return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: model.properties.length,
          itemBuilder: (context, index){
            return singlePropertyView(model.properties[index]);
          }
        ),
      )
    );
  }

  sureButton(){
    var title = "加入购物车";
    if (type == GoodsDetailOperateType.buyNow) {
      title = "立即购买";
    }

    return InkWell(
      onTap: (){
        if (callBack != null) {
          callBack(type);
        }
      },
      child: Container(
        height: 48,
        width: ScreenUtil().setWidth(appScreenWidth),
        color: appCommonColor,
        alignment: Alignment.center,
        child: Text("加入购物车",
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }

  goodsInfoView(){
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(model.name,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16
            ),
          ),
          Text("￥${model.minPrice.toString()}",
            style: TextStyle(
              color: appCommonColor
            ),
          )
        ],
      ),
    );
  }

  // 单个规格界面
  singlePropertyView(GoodsPropertyModel propertyModel){
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(propertyModel.name),
          propertyGridView(propertyModel),
        ],
      )
    );
  }

  propertyGridView(GoodsPropertyModel propertyModel){
    List list = List<Widget>();
    for (int i=0; i<propertyModel.childsProperties.length; i++) {
      list.add(propertyGridItemView(propertyModel, i));
    }

    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Wrap(
        spacing: 8,
        runSpacing: 6,
        children: list,
      ),
    );
  }

  Widget propertyGridItemView(GoodsPropertyModel propertyModel, index){
    var goodsChildsPropertyModel = propertyModel.childsProperties[index];
    bool selected = propertyModel.selectedIndex == index;
    return InkWell(
      onTap: (){
        onTap(propertyModel, index);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
        decoration: BoxDecoration(
            border: Border.all(
                color: selected ? appCommonColor : Colors.black38,
                width: 0.5
            ),
            borderRadius: BorderRadius.all(Radius.circular(3))
        ),
        child: Text(goodsChildsPropertyModel.name,
          style: TextStyle(
            color: selected ? appCommonColor : Colors.black,
          ),
        ),
      ),
    );
  }

  onTap(GoodsPropertyModel propertyModel, index){
    if (propertyModel.selectedIndex == index) {
      propertyModel.selectedIndex = -1;
    }
    else {
      propertyModel.selectedIndex = index;
    }

    setState(() {
    });

    print(index.toString());
  }

}
