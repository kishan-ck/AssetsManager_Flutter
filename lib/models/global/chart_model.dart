class ChartModel {
  final int? status;
  final Data? data;
  final String? message;

  ChartModel({
    this.status,
    this.data,
    this.message,
  });

  ChartModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.toJson(),
    'message' : message
  };
}

class Data {
  final List<int>? number;
  final List<Category>? category;
  final List<Subcategory>? subcategory;
  final dynamic asset;
  final List<int>? year;

  Data({
    this.number,
    this.category,
    this.subcategory,
    this.asset,
    this.year,
  });

  Data.fromJson(Map<String, dynamic> json)
      : number = (json['Number'] as List?)?.map((dynamic e) => e as int).toList(),
        category = (json['Category'] as List?)?.map((dynamic e) => Category.fromJson(e as Map<String,dynamic>)).toList(),
        subcategory = (json['Subcategory'] as List?)?.map((dynamic e) => Subcategory.fromJson(e as Map<String,dynamic>)).toList(),
        asset = json['Asset'],
        year = (json['Year'] as List?)?.map((dynamic e) => e as int).toList();

  Map<String, dynamic> toJson() => {
    'Number' : number,
    'Category' : category?.map((e) => e.toJson()).toList(),
    'Subcategory' : subcategory?.map((e) => e.toJson()).toList(),
    'Asset' : asset,
    'Year' : year
  };
}

class Category {
  final String? id;
  final String? name;
  final String? image;
  final String? icon;
  final List<Measurement>? measurement;
  final int? v;

  Category({
    this.id,
    this.name,
    this.image,
    this.icon,
    this.measurement,
    this.v,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        icon = json['icon'] as String?,
        measurement = (json['measurement'] as List?)?.map((dynamic e) => Measurement.fromJson(e as Map<String,dynamic>)).toList(),
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'image' : image,
    'icon' : icon,
    'measurement' : measurement?.map((e) => e.toJson()).toList(),
    '__v' : v
  };
}

class Measurement {
  final String? name;
  final int? key;
  final String? id;

  Measurement({
    this.name,
    this.key,
    this.id,
  });

  Measurement.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        key = json['key'] as int?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'key' : key,
    '_id' : id
  };
}

class Subcategory {
  final String? id;
  final String? name;
  final String? catId;
  final int? v;
  final int? currentval;
  final int? profitval;

  Subcategory({
    this.id,
    this.name,
    this.catId,
    this.v,
    this.currentval,
    this.profitval,
  });

  Subcategory.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        catId = json['cat_id'] as String?,
        v = json['__v'] as int?,
        currentval = json['currentval'] as int?,
        profitval = json['profitval'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'cat_id' : catId,
    '__v' : v,
    'currentval' : currentval,
    'profitval' : profitval
  };
}