

class OrderStatus {
  final int value;
  const OrderStatus(this.value);

  // 已关闭
  static const close = const OrderStatus(-1);
  // 待付款
  static const unpay = const OrderStatus(0);
  // 代发货
  static const undelivering = const OrderStatus(1);
  // 待收货
  static const unship = const OrderStatus(2);
  // 待评价
  static const uncomment = const OrderStatus(3);
  // 已评价
  static const complete = const OrderStatus(3);

  @override
  bool operator ==(other) {
    return value == other.value;
  }
}

class OrderDetailModel {
  double amount;
  double amountLogistics;
  double amountReal;
  int autoDeliverStatus;
  String dateAdd;
  String dateClose;
  String dateUpdate;
  int differHours;
  int goodsNumber;
  bool hasRefund;
  int id;
  bool isCanHx;
  bool isDelUser;
  bool isHasBenefit;
  bool isNeedLogistics;
  bool isPay;
  bool isSuccessPingtuan;
  String orderNumber;
  String qudanhao;
  int score;
  int scoreDeduction;
  int shopId;
  OrderStatus status;
  String statusStr;
  int type;
  int uid;
  int userId;

  OrderDetailModel(
      {this.amount,
        this.amountLogistics,
        this.amountReal,
        this.autoDeliverStatus,
        this.dateAdd,
        this.dateClose,
        this.dateUpdate,
        this.differHours,
        this.goodsNumber,
        this.hasRefund,
        this.id,
        this.isCanHx,
        this.isDelUser,
        this.isHasBenefit,
        this.isNeedLogistics,
        this.isPay,
        this.isSuccessPingtuan,
        this.orderNumber,
        this.qudanhao,
        this.score,
        this.scoreDeduction,
        this.shopId,
        this.status,
        this.statusStr,
        this.type,
        this.uid,
        this.userId});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    amountLogistics = json['amountLogistics'];
    amountReal = json['amountReal'];
    autoDeliverStatus = json['autoDeliverStatus'];
    dateAdd = json['dateAdd'];
    dateClose = json['dateClose'];
    dateUpdate = json['dateUpdate'];
    differHours = json['differHours'];
    goodsNumber = json['goodsNumber'];
    hasRefund = json['hasRefund'];
    id = json['id'];
    isCanHx = json['isCanHx'];
    isDelUser = json['isDelUser'];
    isHasBenefit = json['isHasBenefit'];
    isNeedLogistics = json['isNeedLogistics'];
    isPay = json['isPay'];
    isSuccessPingtuan = json['isSuccessPingtuan'];
    orderNumber = json['orderNumber'];
    qudanhao = json['qudanhao'];
    score = json['score'];
    scoreDeduction = json['scoreDeduction'];
    shopId = json['shopId'];
    status = OrderStatus(json['status']);
    statusStr = json['statusStr'];
    type = json['type'];
    uid = json['uid'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['amountLogistics'] = this.amountLogistics;
    data['amountReal'] = this.amountReal;
    data['autoDeliverStatus'] = this.autoDeliverStatus;
    data['dateAdd'] = this.dateAdd;
    data['dateClose'] = this.dateClose;
    data['dateUpdate'] = this.dateUpdate;
    data['differHours'] = this.differHours;
    data['goodsNumber'] = this.goodsNumber;
    data['hasRefund'] = this.hasRefund;
    data['id'] = this.id;
    data['isCanHx'] = this.isCanHx;
    data['isDelUser'] = this.isDelUser;
    data['isHasBenefit'] = this.isHasBenefit;
    data['isNeedLogistics'] = this.isNeedLogistics;
    data['isPay'] = this.isPay;
    data['isSuccessPingtuan'] = this.isSuccessPingtuan;
    data['orderNumber'] = this.orderNumber;
    data['qudanhao'] = this.qudanhao;
    data['score'] = this.score;
    data['scoreDeduction'] = this.scoreDeduction;
    data['shopId'] = this.shopId;
    data['status'] = this.status.value;
    data['statusStr'] = this.statusStr;
    data['type'] = this.type;
    data['uid'] = this.uid;
    data['userId'] = this.userId;
    return data;
  }
}