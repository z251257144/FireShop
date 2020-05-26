import 'package:fire_shop/server/base_server.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/device_util.dart';

class UserServer extends BaseServer {
  /*用户登录*/
  Future fetchLogin(phone, password) async {
    var param = Map<String, dynamic>();
    param["deviceId"] = await DeviceUtil.deviceID();
    param["deviceName"] = await DeviceUtil.deviceName();
    param["mobile"] = phone;
    param["pwd"] = password;
    debugPrint(param.toString());

    return super.requestPostData("user/m/login", param: param);
  }

  // 查看用户详情
  Future fetchUserProfile(token) async {
    var param = {"token": token};
    return super.requestPostData("user/detail", param: param);
  }

  // 获取短信验证码
  Future fetchSmsCode(phone) async {
    var param = {"mobile": phone};
    return super.requestGetData("verification/sms/get", param: param);
  }

  // 用户注册[手机号]
  Future fetchRegisterUser(phone, code, password, nick) async {
    var param = {"mobile": phone, "code": code, "pwd": password, "nick":nick};
    return super.requestPostData("user/m/register", param: param);
  }

  // 重设密码[手机找回密码]
  Future fetchResetPassword(phone, code, password) async {
    var param = {"mobile": phone, "code": code, "pwd": password};
    return super.requestPostData("user/m/reset-pwd", param: param);
  }



  // 获取所有的收货地址
  Future fetchShippingAddressList(token) async {
    var param = {"token": token};
    return super.requestPostData("user/shipping-address/list", param: param);
  }

  // 获取省份列表
  Future fetchProvinceList() async {
    return super.requestGetData("https://api.it120.cc/common/region/v2/province");
  }

  // 获取下级省市区数据
  Future fetchChildRegionList(pid) async {
    var param = {"pid": pid};
    return super.requestGetData("https://api.it120.cc/common/region/v2/child", param: param);
  }

  // 添加地址
  Future fetchAddArrress(token, linkMan, mobile, provinceId, cityId, districtId, address, code) async {
    var param = {"token": token,
      "linkMan":linkMan,
      "mobile": mobile,
      "provinceId": provinceId,
      "cityId": cityId,
      "districtId": districtId,
      "address": address,
      "code": code,
      "isDefault": "true"
    };
    return super.requestGetData("user/shipping-address/add", param: param);
  }








}