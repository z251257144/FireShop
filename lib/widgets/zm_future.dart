import 'package:fire_shop/widgets/empty_view.dart';
import 'package:flutter/material.dart';

class ZMFuture<T> {
  static FutureBuilder builder({
    @required Future future,
    @required Widget view,
    Widget errorView,
    Widget loadingView
  }) {

    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return view;
        }

        // 错误界面
        if (snapshot.hasError) {
          if (errorView != null) {
            return errorView;
          }

          return ZMFuture.errorView(snapshot.error);
        };

        // 默认加载图
        if (loadingView != null) {
          return loadingView;
        }

        return Center(child: CircularProgressIndicator());
      }
    );
  }

  /*
  * 错误界面
  * */
  static Widget errorView(error) {
    return EmptyView(
    );
  }
}