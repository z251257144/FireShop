class CategoryModel {
  String dateAdd;
  String dateUpdate;
  String icon;
  int id;
  bool isUse;
  int level;
  String name;
  int paixu;
  int pid;
  int userId;

  List<CategoryModel> subCategoryList;

  CategoryModel(
      {this.dateAdd,
        this.dateUpdate,
        this.icon,
        this.id,
        this.isUse,
        this.level,
        this.name,
        this.paixu,
        this.pid,
        this.userId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    dateAdd = json['dateAdd'];
    dateUpdate = json['dateUpdate'];
    icon = json['icon'];
    id = json['id'];
    isUse = json['isUse'];
    level = json['level'];
    name = json['name'];
    paixu = json['paixu'];
    pid = json['pid'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['isUse'] = this.isUse;
    data['level'] = this.level;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['pid'] = this.pid;
    data['userId'] = this.userId;
    return data;
  }
}