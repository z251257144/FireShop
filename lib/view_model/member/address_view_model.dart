import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/model/member/address_model.dart';
import 'package:fire_shop/server/user_server.dart';
class AddressViewModel {
  UserServer server = UserServer();

  List<AddressModel> addressList;

  // 获取用户详细信息
  Future fetchShippingAddressList() async {
//    var token = UserinfoManager.shared.user.token;
    var token = "b950b416-dc25-4a82-b76b-70e747c25d12";
    var data = await server.fetchShippingAddressList(token);
    addressList = (data as List).map((item){
      return AddressModel.fromJson(item);
    }).toList();
    print(addressList);
    return 1;
  }
}