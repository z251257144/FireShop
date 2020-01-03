import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static double screenWidth = 828;
  static double screenHeight = 1792;

  static setScreenSize(context) {
    ScreenUtil.instance = ScreenUtil(width: DeviceUtil.screenWidth, height: DeviceUtil.screenHeight)..init(context);
  }
  

}