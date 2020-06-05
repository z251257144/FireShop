import 'package:dio/dio.dart';
import 'package:fire_shop/widgets/zm_error.dart';
import 'package:flutter/cupertino.dart';

class BaseServer {
  static String baseUrl = "";

  // 获取网络库Client
  Dio client() {
    Dio dio = new Dio(); // with default Options

    dio.options.baseUrl = BaseServer.baseUrl;
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 5000;

    return dio;
  }

  /*
  * 发送post请求
  * */
  Future requestPostData(url, {param}) async {
    print("requestPostDataUrl 开始请求 ");

    debugPrint("请求地址：${BaseServer.baseUrl}${url}");
    debugPrint("请求参数： ${param}");

    Dio dio = this.client();

    try {
      Response response = await dio.post(url, queryParameters: param);
      var exception = this.checkException(response);
      if (exception == null) {
        print(response.data);
        return response.data["data"];
      }
      else {
        print(exception.toString());
        throw exception;
      }
    }
    on DioError catch(err) {
      throw this.convertDioError(err);
    }
  }

  /*
  * 发送get请求
  * */
  Future requestGetData(url, {param}) async {
    debugPrint("请求地址：${BaseServer.baseUrl}${url}");
    debugPrint("请求参数： ${param}");

    Dio dio = this.client();

    try {
      Response response = await dio.get(url, queryParameters: param);
      var exception = this.checkException(response);
      if (exception == null) {
        return response.data["data"];
      }
      else {
        print(exception.toString());
        throw exception;
      }
    }
    on DioError catch(err) {
      throw this.convertDioError(err);
    }
  }

  /*DioError转换为FormatException*/
  ZMError convertDioError(DioError err) {
    print("请求失败 ===== DioError： " + err.message);
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if(err.response != null) {
      print(err.response.data);
      print(err.response.headers);
      print(err.response.request);
    } else{
      // Something happened in setting up or sending the request that triggered an Error
      print(err.request);
      print(err.message);
    }

    if (err.type == DioErrorType.CONNECT_TIMEOUT || err.type == DioErrorType.RECEIVE_TIMEOUT) {
      return ZMError.builder(ZMErrorType.NO_CONNECT);
    }
    else if (err.type == DioErrorType.SEND_TIMEOUT || err.type == DioErrorType.RECEIVE_TIMEOUT) {
      return ZMError.builder(ZMErrorType.TIMEOUT);
    }
    else if (err.type == DioErrorType.RESPONSE) {
      return ZMError.builder(ZMErrorType.RESPONSE);
    }

    return null;
  }

  /*Response转换为FormatException*/
  ZMError checkException(Response response) {
    if (response.statusCode != 200) {
      print("请求失败 ===== Response Error：${response.statusCode} " + response.statusMessage);
      return ZMError(type: ZMErrorType.RESPONSE, code: response.statusCode, message: "网络异常，请稍后再试");
    }

    var code = response.data['code'];
    if (code != 0) {
      print("请求失败 ===== Data Error： " + response.data.toString());
      return ZMError(type: ZMErrorType.DEFAULT, code: code, message: response.data["msg"]);
    }

    return null;
  }



}