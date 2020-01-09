
import 'package:fire_shop/widgets/single_picker.dart';

class RegionModel extends PickerModel {
  String name;
  String pinyin;
  String id;
  int level;

  List<RegionModel> sublist;

  RegionModel(
      {this.name,
        this.pinyin,
        this.level,
        this.id,});

  RegionModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pinyin = json['pinyin'];
    level = json['level'];
    id = json['id'];
  }

  @override
  String title() {
    // TODO: implement title
    return this.name;
  }
}