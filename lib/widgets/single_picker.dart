import 'package:fire_shop/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PickerModel {
  String title();
}

typedef SinglePickerConfirmCallback = void Function(int index);

class SinglePicker extends StatelessWidget {

  final List<PickerModel> data;

  final String title;

  final int selectIndex;

  final double itemHeight;

  final double height;

  final SinglePickerConfirmCallback confirmCallback;

  FixedExtentScrollController scrollController;

  SinglePicker({
    this.data,
    this.height = 200.0,
    this.itemHeight = 44,
    this.selectIndex = 0,
    this.title = "",
    this.confirmCallback,
  }) {
    if (data.length > 0 || selectIndex >= 0) {
      scrollController = FixedExtentScrollController(initialItem: selectIndex);
    }
    else {
      scrollController = FixedExtentScrollController();
    }
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          this.headerWidget(context),
          this.picker()
        ],
      ),
    );
  }

  Widget headerWidget(context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 0.5
            )
        )
      ),
      child: Row(
        children: <Widget>[
          this.cancelButton(context),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(this.title,
                style: TextStyle(
                    fontSize: 20
                ),
              ),
            )
          ),
          this.sureButton(context)
        ],
      ),
    );
  }

  Widget cancelButton(context) {
    return FlatButton(
        onPressed: (){
          Navigator.of(context).pop();
        },
        child: Text("取消",
          style: TextStyle(
              fontSize: 16
          )
        ),
    );
  }

  Widget sureButton(context) {
    return FlatButton(
      textColor: appCommonColor,
      onPressed: (){
        Navigator.of(context).pop();
        if (confirmCallback != null) confirmCallback(this.scrollController.selectedItem);
      },
      child: Text("确定",
        style: TextStyle(
          fontSize: 16
        ),
      )
    );
  }

  Widget picker() {
    return Container(
      height: this.height,
      child: CupertinoPicker.builder(
        itemExtent: this.itemHeight,
        childCount: this.data.length,
        backgroundColor: Colors.white,
        scrollController: this.scrollController,
        onSelectedItemChanged: (index) {

        },
        itemBuilder: (context, index) {
          return this.itemWidget(this.data[index]);
        },
      ),
    );
  }

  Widget itemWidget(PickerModel item) {
    return Center(
      child: Text(item.title()),
    );
  }

  show(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return this;
      },
    );
  }
}
