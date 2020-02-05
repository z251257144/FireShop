
import 'package:fire_shop/utils/storage_util.dart';
import 'package:flutter/foundation.dart';

const String GoodsSearchHistoryKey = "GoodsSearchHistoryKey";

class GoodsSearchHistoryViewModel with ChangeNotifier{

  List<String> words;

  GoodsSearchHistoryViewModel(){
    this.initWords();
  }

  // 初始化搜索词
  initWords() async {
    words = await StorageUtil.getValue(GoodsSearchHistoryKey);
    notifyListeners();
  }

  // 添加搜索词
  addWord(String word) {
    if (words == null) {
      words = [];
    }

    if (words.contains(word)) {
      words.remove(word);
    }

    words.insert(0, word);

    this.save();

    notifyListeners();
  }

  // 清空搜索历史
  clearWords() {
    words = null;
    this.save();

    notifyListeners();
  }

  // 保存搜索词
  save(){
    if (words == null || words.length == 0) {
      StorageUtil.remove(GoodsSearchHistoryKey);
    }

    StorageUtil.save(GoodsSearchHistoryKey, words);
  }

}