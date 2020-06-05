
enum ZMErrorType {
  /// 无网络
  NO_CONNECT,

  /// 请求超时
  TIMEOUT,

  /// 服务器异常，例如：404, 500，数据格式不对
  RESPONSE,

  /// 业务异常，例如：数据返回code不为0
  DEFAULT,

  /// 无数据
  NO_DATA
}


class ZMError implements Exception {
  const ZMError({
    this.type = ZMErrorType.DEFAULT,
    this.code = -1,
    this.message
  });

  static ZMError builder( ZMErrorType type) {
    if (type == ZMErrorType.NO_CONNECT) {
      return ZMError(type: type, message: "设备无法访问网络，请检查网络环境及配置");
    }
    else if (type == ZMErrorType.TIMEOUT) {
      return ZMError(type: type, message: "请求超时，请重试");
    }
    else if (type == ZMErrorType.RESPONSE) {
      return ZMError(type: type, message: "服务异常，请重试");
    }
    else if (type == ZMErrorType.NO_DATA) {
      return ZMError(type: type, message: "暂无数据");
    }

    return null;
  }

  /// 错误类型
  final ZMErrorType type;

  /// 错误代码
  final int code;

  // 错误消息
  final String message;

  @override
  String toString() {
    var msg = 'ZMError [$type]: [$code]: $message';
    return msg;
  }


}
