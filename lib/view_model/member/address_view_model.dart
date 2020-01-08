import 'package:fire_shop/manager/userinfo_manager.dart';
import 'package:fire_shop/server/user_server.dart';
class AddressViewModel {
  UserServer server = UserServer();

  // 获取用户详细信息
  Future fetchShippingAddressList() async {
    print("请求地址");
//    var token = UserinfoManager.shared.user.token;
    var token = "b950b416-dc25-4a82-b76b-70e747c25d12";
    var data = await server.fetchShippingAddressList(token);
    print("地址返回数据");
    print(data.toString());
    return "data";
  }
}