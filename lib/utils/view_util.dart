import 'package:flutter/material.dart';
import '../widgets/LoadingWidget.dart';

// 显示等待界面
showLoadingView(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return LoadingDialog(
          outsideDismiss: false,
        );
      });
}