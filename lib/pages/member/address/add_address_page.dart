import 'package:fire_shop/routes/route_path.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/view_model/member/add_address_view_model.dart';
import 'package:fire_shop/widgets/single_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_picker/flutter_picker.dart';

// ignore: must_be_immutable
class AddAddressPage extends StatelessWidget {

  AddAddressViewModel viewModel = AddAddressViewModel();

  @override
  Widget build(BuildContext context) {
    print("AddAddressPage build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("新增地址"),
      ),
      body: listView(context),
      backgroundColor: Colors.white,
    );
  }

  Widget listView(context) {
    return Container(
      child: ListView(
        children: <Widget>[
          concactView(),
          phoneWidget(),
          areaWidget(),
          cityWidget(),
          districtWidget(),
          addressWidget(),
          zipCodeWidget(),
          submitWidget(),
        ],
      ),
    );
  }

  Widget commonBgWidget(title, subWidget) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
          )
        )
      ),
      child:Row(
        children: <Widget>[
          Container(
            width: 80,
            height: 44,
            alignment: Alignment.centerLeft,
            child: Text(title),
          ),
          Expanded(child: subWidget)
        ],
      )
    );
  }

  Widget concactView() {
    var concactTextField = TextField(
      decoration: InputDecoration(
        hintText: "姓名",
        border: InputBorder.none
      ),
    );
    return commonBgWidget("联系人", concactTextField);
  }

  Widget phoneWidget() {
    var concactTextField = TextField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "11位手机号码",
          border: InputBorder.none
      ),
    );
    return commonBgWidget("手机号码", concactTextField);
  }

  Widget areaWidget() {
    var label = ChangeNotifierProvider(
        create: (context){
          return this.viewModel;
        },
        child: Consumer(builder: (context, AddAddressViewModel provider, child) {
          return InkWell(
            onTap: () {
              this.showAreaPickerView(context);
            },
            child: Text("请选择"),
          );
        }),
    );
    return commonBgWidget("选择省", label);
  }

  Widget cityWidget() {
    if (this.viewModel.provinceIndex < 0) {
      return Container();
    }

    var label = ChangeNotifierProvider(
      create: (context){
        return this.viewModel;
      },
      child: Consumer(builder: (context, AddAddressViewModel provider, child) {
        return InkWell(
          onTap: () {
            this.showAreaPickerView(context);
          },
          child: Text("请选择"),
        );
      }),
    );
    return commonBgWidget("选择市", label);
  }

  Widget districtWidget() {
    if (this.viewModel.provinceIndex < 0 || this.viewModel.cityIndex < 0) {
      return Container();
    }

    var label = ChangeNotifierProvider(
      create: (context){
        return this.viewModel;
      },
      child: Consumer(builder: (context, AddAddressViewModel provider, child) {
        return InkWell(
          onTap: () {
            this.showAreaPickerView(context);
          },
          child: Text("请选择"),
        );
      }),
    );
    return commonBgWidget("选择区", label);
  }

  Widget addressWidget() {
    var concactTextField = TextField(
      decoration: InputDecoration(
          hintText: "街道门牌信息",
          border: InputBorder.none
      ),
    );
    return commonBgWidget("详细地址", concactTextField);
  }

  Widget zipCodeWidget() {
    var concactTextField = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: InputBorder.none
      ),
    );
    return commonBgWidget("邮政编号", concactTextField);
  }

  Widget submitWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      height: 44,
      child: FlatButton(
        color: appCommonColor,
        textColor: Colors.white,
        onPressed: (){

        }, 
        child: Text("保存")
      ),
    );
  }

  Widget nextWidget(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      height: 44,
      child: FlatButton(
          color: appCommonColor,
          textColor: Colors.white,
          onPressed: (){
            Navigator.of(context).pushNamed(RoutePath.addAddress);
          },
          child: Text("下一页")
      ),
    );
  }

  showAreaPickerView(context) {
    if (viewModel.provinceList == null || viewModel.provinceList.length == 0) {
      viewModel.fetchProvinceList();
      return;
    }
    this.showPicker(context);

  }

  showPicker(BuildContext context) {
    SinglePicker(data: viewModel.provinceList, selectIndex: viewModel.provinceIndex, confirmCallback: (index) {
      viewModel.provinceIndex = index;
      print(viewModel.provinceList[index].title());
    },).show(context);
  }


}
