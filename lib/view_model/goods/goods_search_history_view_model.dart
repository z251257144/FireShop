
import 'package:flutter/foundation.dart';

class GoodsSearchHistoryViewModel with ChangeNotifier{
//  List<String> words;

  List<String> words = [
    '面试',
    'Studio3',
    '动画dfsfds',
    '自定义View',
    '性能优化',
    'gradle',
    'Camera',
    '代码混淆 安全',
    '逆向加固'
  ];

  // 添加搜索词
  addWord(String word) {
    if (words.contains(word)) {
      words.remove(word);
    }

    words.insert(0, word);
  }

}