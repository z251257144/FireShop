
import 'package:fire_shop/model/member/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fire_shop/server/user_server.dart';

class AddAddressViewModel with ChangeNotifier {

  UserServer server = UserServer();

  List<AddressModel> provinceList;
  int provinceIndex = -1;
  int cityIndex = -1;
  int districtIndex = -1;

  // 获取省份列表
  fetchProvinceList() async {
    var data = await server.fetchProvinceList();

    provinceList = (data as List).map((item){
      return AddressModel.fromJson(item);
    }).toList();

    print(provinceList);
    return 1;
  }

}