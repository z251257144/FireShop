

class DataUtil {

}

// 打印Map的key、type，value
printMapType(mapData) {
  try {
    for (var key in mapData.keys) {
      print("$key  ==  ${mapData[key].runtimeType}  ==  ${mapData[key]} ");
    }
  }
  catch (e) {
    print(e);
  }

  print("Map 打印完成 =======================================================");
  print("");
}
