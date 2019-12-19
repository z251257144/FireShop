import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';

class DeviceUtil {
//  获取当前设备名称
  static Future<String> deviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    }
    else if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.model;
    }
    return "Unknown";
  }

  //  获取当前设备ID
  static Future<String> deviceID() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    else if (Platform.isAndroid) {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId;
    }
    return "Unknown ID";
  }
}