class CategoryModel {
  final List<Data>? data;

  CategoryModel({
    this.data,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? name;
  final String? image;
  final String? icon;
  final int? v;

  Data({
    this.id,
    this.name,
    this.image,
    this.icon,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        icon = json['icon'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'image' : image,
    'icon' : icon,
    '__v' : v
  };
}