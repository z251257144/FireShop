class HomeBannarModel {
  int businessId;
  String dateAdd;
  String dateUpdate;
  int id;
  String linkUrl;
  int paixu;
  String picUrl;
  String remark;
  int status;
  String statusStr;
  String title;
  String type;
  int userId;

  HomeBannarModel(
      {this.businessId,
        this.dateAdd,
        this.dateUpdate,
        this.id,
        this.linkUrl,
        this.paixu,
        this.picUrl,
        this.remark,
        this.status,
        this.statusStr,
        this.title,
        this.type,
        this.userId});

  HomeBannarModel.fromJson(Map<String, dynamic> json) {
    businessId = json['businessId'];
    dateAdd = json['dateAdd'];
    dateUpdate = json['dateUpdate'];
    id = json['id'];
    linkUrl = json['linkUrl'];
    paixu = json['paixu'];
    picUrl = json['picUrl'];
    remark = json['remark'];
    status = json['status'];
    statusStr = json['statusStr'];
    title = json['title'];
    type = json['type'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['businessId'] = this.businessId;
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['id'] = this.id;
    data['linkUrl'] = this.linkUrl;
    data['paixu'] = this.paixu;
    data['picUrl'] = this.picUrl;
    data['remark'] = this.remark;
    data['status'] = this.status;
    data['statusStr'] = this.statusStr;
    data['title'] = this.title;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}