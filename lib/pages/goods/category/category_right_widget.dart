import 'package:fire_shop/model/goods/category_model.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

class CategoryRightWidget extends StatelessWidget {

  final List<CategoryModel> data;

  const CategoryRightWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data == null || data.length == 0) {
      return Container();
    }

    return gridView();
  }

  gridView() {

    print(ScreenUtil().setWidth(appScreenWidth).toString());
    double width = (ScreenUtil().setWidth(appScreenWidth) - 110) / 3.0;
    double height = ScreenUtil().setWidth(200)+50;

    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: width/height,
        mainAxisSpacing: 10,
          crossAxisSpacing: 10
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
              child: Image.network(model.icon,
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(200)
              ),
            ),
            Text(model.name,
                maxLines: 1,
                style: TextStyle(

                )
            )
          ],
        ),
      ),
    );
  }
}
