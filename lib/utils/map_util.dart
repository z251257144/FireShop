

class MapUtil {
  // 打印Map的key、type，value
  static printMap(Map map) {
    try {
      for (var key in map.keys) {
        print("$key  ==  ${map[key].runtimeType}  ==  ${map[key]} ");
      }
    }
    catch (e) {
      print(e);
    }

    print("Map 打印完成 =======================================================");
    print("");
  }
}