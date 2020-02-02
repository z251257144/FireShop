import 'package:fire_shop/model/goods/category_model.dart';
import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/view_model/goods/category_view_model.dart';
import 'package:fire_shop/widgets/search_bar.dart';
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
        title: SearchBar(onTap: (){
          this.showSearchView(context);
        }),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: _viewModel.getAllCategoryList(),
        builder: (context, anp){
          return Row(
            children: <Widget>[
              leftWidget(),
              rightWidget()
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

  rightWidget() {
    return ChangeNotifierProvider.value(
        value: _viewModel,
        child: Consumer(builder: (BuildContext context, CategoryViewModel value, Widget child) {
          CategoryModel model = value.selectCategory();
          var list = model == null ? null : model.subCategoryList;
          var pic = model == null ? null : model.icon;
          return Expanded(
              child: CategoryRightWidget(data: list, pic: pic)
          );
        })
    );
  }

  leftChange(index) {
    _viewModel.changeLeftIndex(index);
  }

  showSearchView(context) {
    Navigator.of(context).pushNamed(RoutePath.goodsSearch);
  }
}