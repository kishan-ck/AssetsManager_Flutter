class SubCategoryModel {
  final List<Data>? data;

  SubCategoryModel({
    this.data,
  });

  SubCategoryModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? name;
  final String? catId;
  final int? v;

  Data({
    this.id,
    this.name,
    this.catId,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        catId = json['cat_id'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'cat_id' : catId,
    '__v' : v
  };
}