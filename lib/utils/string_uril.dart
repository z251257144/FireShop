import 'package:flutter/material.dart';

class StringUtil {

  // 是否为空
  static bool isEmpty(String string){
    return string == null || string.length == 0;
  }

  // 判断字符不为空
  static bool isNotEmpty(String string){
    return !StringUtil.isEmpty(string);
  }
}

