import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static save(String key, value) async {
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
    assert(T != null, "must set <T>");

    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (T == bool) {
      return preferences.getBool(key);
    }
    else if (T == int) {
      return preferences.getInt(key);
    }
    else if (T == double) {
      return preferences.getDouble(key);
    }
    else if (T == String) {
      print("getString");
      return preferences.getString(key);
    }
    else {
      print("getStringList");
      return preferences.getStringList(key);
    }
  }

  static remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key);
  }
}