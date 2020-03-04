
class MemberType {
  final int _value;
  const MemberType(this._value);
  toString() => 'Enum.$_value';

  // 待付款
  static const orderPay = const MemberType(1);
  // 代发货
  static const orderDelivering = const MemberType(2);
  // 待收货
  static const orderShip = const MemberType(3);
  // 待评价
  static const orderComment = const MemberType(4);

  static const address = const MemberType(15);

  @override
  bool operator ==(other) {
    return _value == other._value;
  }
}

class MemberModel {
  String title;
  String icon;
  String value;
  String valueKey;
  MemberType memberType;

  MemberModel.fromData(Map<String, dynamic> map) {
    title = map['title'];
    icon = map['icon'];
    value = map['value'];
    valueKey = map['valueKey'];
    memberType = MemberType(map['type']);
  }
}