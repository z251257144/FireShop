import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static save<T>(String key, T value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (value is bool) {
      await preferences.setBool(key, value);
    }
    else if (value is int) {
      await preferences.setInt(key, value);
    }
    else if (value is double) {
      await preferences.setDouble(key, value);
    }
    else if (value is String) {
      await preferences.setString(key, value);
    }
    else if (value is List<String>) {
      await preferences.setStringList(key, value);
    }
    else {
      assert(true, 'value data type is not suppot！');
    }
  }

  // 获取value，默认返回string类型的，其他类型请指定泛型
  static Future getValue<T>(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (T is bool) {
      return preferences.getBool(key);
    }
    else if (T is int) {
      return preferences.getInt(key);
    }
    else if (T is double) {
      return preferences.getDouble(key);
    }
    else if (T is List<String>) {
      return preferences.getStringList(key);
    }
    else {
      return preferences.getString(key);
    }
  }
}