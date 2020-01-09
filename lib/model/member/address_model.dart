
class AddressModel {
  String address;
  String areaStr;
  String cityId;
  String cityStr;
  String code;
  String dateAdd;
  String dateUpdate;
  String districtId;
  int id;
  bool isDefault;
  String linkMan;
  String mobile;
  String provinceId;
  String provinceStr;
  int status;
  String statusStr;
  int uid;
  int userId;

  AddressModel(
      {this.address,
        this.areaStr,
        this.cityId,
        this.cityStr,
        this.code,
        this.dateAdd,
        this.dateUpdate,
        this.districtId,
        this.id,
        this.isDefault,
        this.linkMan,
        this.mobile,
        this.provinceId,
        this.provinceStr,
        this.status,
        this.statusStr,
        this.uid,
        this.userId});

  AddressModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    areaStr = json['areaStr'];
    cityId = json['cityId'];
    cityStr = json['cityStr'];
    code = json['code'];
    dateAdd = json['dateAdd'];
    dateUpdate = json['dateUpdate'];
    districtId = json['districtId'];
    id = json['id'];
    isDefault = json['isDefault'];
    linkMan = json['linkMan'];
    mobile = json['mobile'];
    provinceId = json['provinceId'];
    provinceStr = json['provinceStr'];
    status = json['status'];
    statusStr = json['statusStr'];
    uid = json['uid'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['areaStr'] = this.areaStr;
    data['cityId'] = this.cityId;
    data['cityStr'] = this.cityStr;
    data['code'] = this.code;
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['districtId'] = this.districtId;
    data['id'] = this.id;
    data['isDefault'] = this.isDefault;
    data['linkMan'] = this.linkMan;
    data['mobile'] = this.mobile;
    data['provinceId'] = this.provinceId;
    data['provinceStr'] = this.provinceStr;
    data['status'] = this.status;
    data['statusStr'] = this.statusStr;
    data['uid'] = this.uid;
    data['userId'] = this.userId;
    return data;
  }

  String concactText() {
    return linkMan + " " + mobile;
  }

  String fullAddress() {
    var str = provinceStr + cityStr;
    if (areaStr != null) {
      str += areaStr;
    }
    str += address;
    return str;
  }
}