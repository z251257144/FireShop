import 'package:fire_shop/model/goods/category_model.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryRightWidget extends StatelessWidget {

  final List<CategoryModel> data;

  final String pic;

  const CategoryRightWidget({Key key, this.data, this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null || data.length == 0) {
      return Container();
    }

    print(pic);

    return ListView(
      children: <Widget>[
        headerImageView(),
        gridView()
      ],
    );
  }
  
  headerImageView() {
    if (pic == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(5)
        ),
        child: Image.network(pic),
      ),
    );
  }

  gridView() {
    double width = (ScreenUtil().setWidth(appScreenWidth) - 110) / 3.0;
    double height = ScreenUtil().setWidth(100) + 18 + 30;

    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: width/height,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5
      ),
      itemBuilder: (context, index){
        return itemWidget(index);
      }
    );
  }

  itemWidget(index) {
    var model = data[index];
    return InkWell(
      onTap: (){
        print(model.name);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setWidth(100),
              child: Image.network(model.icon),
            ),
            Text(model.name,
                maxLines: 1,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(26)

                )
            )
          ],
        ),
      ),
    );
  }
}
