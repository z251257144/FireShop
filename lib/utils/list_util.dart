class ListUtil {

  // 是否为空
  static bool isEmpty(List list){
    return list == null || list.length == 0;
  }

  // 判断不为空
  static bool isNotEmpty(List list){
    return !isEmpty(list);
  }

}

extension ListExtension on List {
  forceToList<T>() {
    return this as List<T>;
  }
}