import 'package:fire_shop/view_model/goods/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_left_widget.dart';
import 'category_right_widget.dart';

class CategoryPage extends StatelessWidget {

  final CategoryViewModel _viewModel = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("目录"),
      ),
      body: FutureBuilder(
        future: _viewModel.getAllCategoryList(),
        builder: (context, anp){
          return Row(
            children: <Widget>[
              leftWidget(),
              Expanded(
                  child: CategoryRightWidget()
              )
            ],
          );
      }),
    );
  }

  leftWidget() {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer(builder: (BuildContext context, CategoryViewModel value, Widget child) {
        return CategoryLeftWidget(
            data: _viewModel.categoryData,
            selectIndex: _viewModel.leftIndex,
            onChanged: (index) {
              this.leftChange(index);
            }
        );
      })
    );
  }

  leftChange(index) {
    _viewModel.changeLeftIndex(index);
  }
}