import 'package:fire_shop/model/goods/category_model.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'package:flutter/material.dart';

typedef CategoryLeftCallBack = void Function(int index);

class CategoryLeftWidget extends StatelessWidget {

  final List<CategoryModel> data;
  final int selectIndex;
  final CategoryLeftCallBack onChanged;

  const CategoryLeftWidget({Key key, this.data, this.selectIndex = 0, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: ScreenUtil().setWidth(appScreenWidth/3),
      child: data == null ? null : listView(),
    );
  }

  listView() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index){
        return itemWidget(index);
      }
    );
  }

  itemWidget(int index) {
    CategoryModel model = data[index];
    bool isSelect = selectIndex == index;

    var border = Border(
      left: BorderSide(
        color: appCommonColor,
        width: 3
      )
    );

    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged(index);
        }
      },
      child: Container(
        height: 36,
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        decoration: BoxDecoration(
          border: isSelect ? border : null
        ),
        alignment: Alignment.centerLeft,
        child: Text(model.name,
          style: TextStyle(
            color: isSelect ? appCommonColor : Colors.black87
          ),
        ),
      ),
    );
  }


}
