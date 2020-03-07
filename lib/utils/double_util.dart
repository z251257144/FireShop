class DoubleUtil {

  // 转换成double
  static double parse(value){
    if (value == null) {
      return 0.0;
    }
    if (value is double) {
      return value;
    }
    if (value is String) {
      return double.parse(value);
    }
//    if (value is int) {
//      return double.parse(value.toDouble());
//    }


    return 0.0;
  }

}