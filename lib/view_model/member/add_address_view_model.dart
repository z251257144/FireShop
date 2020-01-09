
import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/region_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/server/user_server.dart';

class AddAddressViewModel with ChangeNotifier {

  UserServer server = UserServer();

  List<RegionModel> provinceList;
  int provinceIndex = -1;
  int cityIndex = -1;
  int districtIndex = -1;

  String getSelectedProvince() {
    if (provinceIndex < 0) return "请选择";

    return provinceList[provinceIndex].name;
  }

  setProvinceIndex(index) {
    this.provinceIndex = index;
    this.cityIndex = -1;
    this.districtIndex = -1;
    notifyListeners();
  }

  String getSelectedCity() {
    if (provinceIndex < 0 || cityIndex < 0) return "请选择";

    var province = provinceList[provinceIndex];
    return province.sublist[cityIndex].name;
  }

  setCityIndex(index) {
    this.cityIndex = index;
    this.districtIndex = -1;
    notifyListeners();
  }

  String getSelectedDistrict() {
    if (provinceIndex < 0 || cityIndex < 0 || districtIndex < 0) return "请选择";

    var province = provinceList[provinceIndex];
    var city = province.sublist[cityIndex];

    return city.sublist[districtIndex].name;
  }

  setDistrictIndex(index) {
    this.districtIndex = index;
    notifyListeners();
  }

  // 获取省份列表
  Future fetchProvinceList() async {
    if (provinceList != null && provinceList.length > 0) {
      return;
    }

    var data = await server.fetchProvinceList();
    provinceList = (data as List).map((item){
      return RegionModel.fromJson(item);
    }).toList();
  }

  // 获取市列表
  Future fetchCityList() async {
    var province = provinceList[provinceIndex];

    if (province.sublist != null && province.sublist.length > 0) {
      return province.sublist;
    }

    var data = await server.fetchChildRegionList(province.id);
    province.sublist = (data as List).map((item){
      return RegionModel.fromJson(item);
    }).toList();

    return province.sublist;
  }

  // 获取区列表
  Future fetchDistrictList() async {
    var province = provinceList[provinceIndex];
    var city = province.sublist[cityIndex];

    if (city.sublist != null && city.sublist.length > 0) {
      return city.sublist;
    }

    var data = await server.fetchChildRegionList(city.id);
    city.sublist = (data as List).map((item){
      return RegionModel.fromJson(item);
    }).toList();

    return city.sublist;
  }

  // 提交地址信息
  Future submitAddressInfo(linkMan, mobile, address, code) async {
    var token = UserinfoManager.shared.user.token;

    var province = provinceList[provinceIndex];
    var city = province.sublist[cityIndex];
    var district = city.sublist[districtIndex];

    return server.fetchAddArrress(token, linkMan, mobile, province.id, city.id, district.id, address, code);
  }

}