import 'package:fire_shop/routes/app_routes.dart';
import 'package:fire_shop/view_model/member/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fire_shop/utils/device_util.dart';
import 'address_list_item_widget.dart';
import 'package:fire_shop/utils/const.dart';

class AddressListPage extends StatelessWidget {

  AddressViewModel viewModel = AddressViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("我的地址"),
      ),
      body: Stack(
        children: <Widget>[
          this.addressListWidget(),
          Positioned(
            bottom: 0,
            right: 0,
            width: ScreenUtil().setWidth(appScreenWidth),
            height: ScreenUtil().setWidth(96),
            child: this.addAddressButton(context)
          ),
        ],
      ),
    );
  }

  Widget addressListWidget() {
    return Container(
      padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(96)),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return AddressListItemWidget(address: "${index}");
        }),
    );
  }

  Widget addAddressButton(context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.black12,
            width: 1
          )
        )
      ),
      child: FlatButton.icon(
        onPressed: (){
          Navigator.of(context).pushNamed(RoutePath.addAddress);
        },
        icon: Icon(Icons.add, color: appCommonColor,),
        label: Text("新增地址",
          style: TextStyle(
            color: appCommonColor
          ),
        )
      ),
    );
  }
}
