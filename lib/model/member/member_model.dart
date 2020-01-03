

class MemberType {
  final int _value;
  const MemberType(this._value);
  toString() => 'Enum.$_value';



  static const orderPay = const MemberType(1);
  static const orderDelivering = const MemberType(2);
  static const orderShip = const MemberType(3);
  static const orderComment = const MemberType(4);

  @override
  bool operator ==(other) {
    // TODO: implement ==
    return _value == other._value;
  }
}

class MemberModel {
  String title;
  String icon;
  String value;
  MemberType memberType;

  MemberModel.fromData(Map<String, dynamic> map) {
    title = map['title'];
    icon = map['icon'];
    value = map['value'];
    memberType = MemberType(map['type']);
  }
}