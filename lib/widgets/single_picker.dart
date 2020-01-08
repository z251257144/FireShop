import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class PickerModel {
  String title();
}

class SinglePicker extends StatelessWidget {
  final List<PickerModel> data;

  final double itemHeight;

  final double height;

  SinglePicker({
    this.data,
    this.height = 220.0,
    this.itemHeight = 44,
  }) : assert(data != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          this.headerWidget(),
          this.picker()
        ],
      ),
    );
  }

  Widget headerWidget() {
    return Container(
      height: 50,
      child: Text("ss"),
    );
  }

  Widget picker() {
    return CupertinoPicker.builder(
      itemExtent: this.itemHeight,
      childCount: this.data.length,
      backgroundColor: Colors.white,
      onSelectedItemChanged: (index) {

      },
      itemBuilder: (context, index) {
        return this.itemWidget(this.data[index]);
      },
    );
  }

  Widget itemWidget(PickerModel item) {
    print(item.title());
    return Center(
      child: Text(item.title()),
    );
  }
}
