
class UserModel {
  String avatarUrl;
  String dateAdd;
  String dateLogin;
  int id;
  String ipAdd;
  String ipLogin;
  bool isIdcardCheck;
  bool isSeller;
  bool levelRenew;
  String mobile;
  int source;
  String sourceStr;
  int status;
  String statusStr;
  String token;

  UserModel(
      {this.avatarUrl,
        this.dateAdd,
        this.dateLogin,
        this.id,
        this.ipAdd,
        this.ipLogin,
        this.isIdcardCheck,
        this.isSeller,
        this.levelRenew,
        this.mobile,
        this.source,
        this.sourceStr,
        this.status,
        this.statusStr});

  UserModel.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
    dateAdd = json['dateAdd'];
    dateLogin = json['dateLogin'];
    id = json['id'];
    ipAdd = json['ipAdd'];
    ipLogin = json['ipLogin'];
    isIdcardCheck = json['isIdcardCheck'];
    isSeller = json['isSeller'];
    levelRenew = json['levelRenew'];
    mobile = json['mobile'];
    source = json['source'];
    sourceStr = json['sourceStr'];
    status = json['status'];
    statusStr = json['statusStr'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatarUrl'] = this.avatarUrl;
    data['dateAdd'] = this.dateAdd;
    data['dateLogin'] = this.dateLogin;
    data['id'] = this.id;
    data['ipAdd'] = this.ipAdd;
    data['ipLogin'] = this.ipLogin;
    data['isIdcardCheck'] = this.isIdcardCheck;
    data['isSeller'] = this.isSeller;
    data['levelRenew'] = this.levelRenew;
    data['mobile'] = this.mobile;
    data['source'] = this.source;
    data['sourceStr'] = this.sourceStr;
    data['status'] = this.status;
    data['statusStr'] = this.statusStr;
    return data;
  }
}