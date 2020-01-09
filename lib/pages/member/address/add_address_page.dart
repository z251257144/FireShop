import 'package:fire_shop/routes/route_path.dart';
import 'package:fire_shop/utils/const.dart';
import 'package:fire_shop/utils/view_util.dart';
import 'package:fire_shop/view_model/member/add_address_view_model.dart';
import 'package:fire_shop/widgets/single_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddAddressPage extends StatelessWidget {

  AddAddressViewModel viewModel = AddAddressViewModel();

  TextEditingController concactController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipController = TextEditingController();



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
          submitWidget(context),
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
      controller: this.concactController,
      decoration: InputDecoration(
        hintText: "姓名",
        border: InputBorder.none
      ),
    );
    return commonBgWidget("联系人", concactTextField);
  }

  Widget phoneWidget() {
    var concactTextField = TextField(
      controller: this.phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "11位手机号码",
          border: InputBorder.none
      ),
    );
    return commonBgWidget("手机号码", concactTextField);
  }

  Widget areaWidget() {
    var button = ChangeNotifierProvider.value(
      value: this.viewModel,
        child: Consumer(builder: (context, AddAddressViewModel provider, child) {
          return InkWell(
            onTap: () {
              this.showAreaPickerView(context);
            },
            child: Text(viewModel.getSelectedProvince()),
          );
        }),
    );
    return commonBgWidget("选择省", button);
  }

  Widget cityWidget() {
    Widget button(context) => InkWell(
      onTap: () {
        this.showCityPicker(context);
      },
      child: Text(viewModel.getSelectedCity()),
    );

    return ChangeNotifierProvider.value(
      value: this.viewModel,
      child: Consumer(builder: (context, AddAddressViewModel provider, child) {
        if (provider.provinceIndex < 0) {
          return Container();
        }
        return commonBgWidget("选择市", button(context));
      }),
    );
  }

  Widget districtWidget() {
    Widget button(context) => InkWell(
      onTap: () {
        this.showDistrictPicker(context);
      },
      child: Text(viewModel.getSelectedDistrict()),
    );

    return ChangeNotifierProvider.value(
      value: this.viewModel,
      child: Consumer(builder: (context, AddAddressViewModel provider, child) {
        if (provider.provinceIndex < 0 || provider.cityIndex < 0) {
          return Container();
        }
        return commonBgWidget("选择区", button(context));
      }),
    );
  }

  Widget addressWidget() {
    var concactTextField = TextField(
      controller: this.addressController,
      decoration: InputDecoration(
          hintText: "街道门牌信息",
          border: InputBorder.none
      ),
    );
    return commonBgWidget("详细地址", concactTextField);
  }

  Widget zipCodeWidget() {
    var concactTextField = TextField(
      controller: this.zipController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          border: InputBorder.none
      ),
    );
    return commonBgWidget("邮政编号", concactTextField);
  }

  Widget submitWidget(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
      height: 44,
      child: FlatButton(
        color: appCommonColor,
        textColor: Colors.white,
        onPressed: (){
          this.submit(context);
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
    viewModel.fetchProvinceList().then((_){
      this.showPicker(context);
    });
  }

  showPicker(BuildContext context) {
    SinglePicker(data: viewModel.provinceList, selectIndex: viewModel.provinceIndex, confirmCallback: (index) {
      viewModel.setProvinceIndex(index);
      print(viewModel.provinceList[index].title());
    },).show(context);
  }

  showCityPicker(BuildContext context) {
    viewModel.fetchCityList().then((result){
      SinglePicker(data: result, selectIndex: viewModel.cityIndex, confirmCallback: (index) {
        viewModel.setCityIndex(index);
      },).show(context);
    });
  }

  showDistrictPicker(BuildContext context) {
    viewModel.fetchDistrictList().then((result){
      SinglePicker(data: result, selectIndex: viewModel.districtIndex, confirmCallback: (index) {
        viewModel.setDistrictIndex(index);
      },).show(context);
    });
  }

  submit(context) {
    var concact = concactController.text;
    var phone = phoneController.text;
    var address = addressController.text;
    var zip = zipController.text;

    showLoadingView(context);

    viewModel.submitAddressInfo(concact, phone, address, zip).then((result){
      Fluttertoast.showToast(msg: "地址保存成功");
      Future.delayed(Duration(seconds: 1), (){
        Navigator.of(context).pop();
      });
    }).catchError((err){
      Fluttertoast.showToast(msg: err.message);
    }).whenComplete((){
      Navigator.of(context).pop();
    });
  }

}
