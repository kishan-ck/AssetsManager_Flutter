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
  final Asset? asset;

  Data({
    this.number,
    this.category,
    this.subcategory,
    this.asset,
  });

  Data.fromJson(Map<String, dynamic> json)
      : number = (json['Number'] as List?)?.map((dynamic e) => e as int).toList(),
        category = (json['Category'] as List?)?.map((dynamic e) => Category.fromJson(e as Map<String,dynamic>)).toList(),
        subcategory = (json['Subcategory'] as List?)?.map((dynamic e) => Subcategory.fromJson(e as Map<String,dynamic>)).toList(),
        asset = (json['Asset'] as Map<String,dynamic>?) != null ? Asset.fromJson(json['Asset'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'Number' : number,
    'Category' : category?.map((e) => e.toJson()).toList(),
    'Subcategory' : subcategory?.map((e) => e.toJson()).toList(),
    'Asset' : asset?.toJson()
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

class Asset {
  final String? id;
  final String? name;
  final String? description;
  final String? assetId;
  final int? numberOfMeasurement;
  final String? measurementType;
  final bool? isAssetSolelyOwned;
  final int? percentOwned;
  final String? userId;
  final String? subCategoryId;
  final String? priceperunit;
  final String? location;
  final String? icon;
  final List<String>? partner;
  final List<dynamic>? images;
  final int? currentprice;
  final int? v;

  Asset({
    this.id,
    this.name,
    this.description,
    this.assetId,
    this.numberOfMeasurement,
    this.measurementType,
    this.isAssetSolelyOwned,
    this.percentOwned,
    this.userId,
    this.subCategoryId,
    this.priceperunit,
    this.location,
    this.icon,
    this.partner,
    this.images,
    this.currentprice,
    this.v,
  });

  Asset.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        assetId = json['assetId'] as String?,
        numberOfMeasurement = json['numberOfMeasurement'] as int?,
        measurementType = json['measurementType'] as String?,
        isAssetSolelyOwned = json['isAssetSolelyOwned'] as bool?,
        percentOwned = json['percentOwned'] as int?,
        userId = json['userId'] as String?,
        subCategoryId = json['subCategoryId'] as String?,
        priceperunit = json['priceperunit'] as String?,
        location = json['location'] as String?,
        icon = json['icon'] as String?,
        partner = (json['partner'] as List?)?.map((dynamic e) => e as String).toList(),
        images = json['images'] as List?,
        currentprice = json['currentprice'] as int?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'description' : description,
    'assetId' : assetId,
    'numberOfMeasurement' : numberOfMeasurement,
    'measurementType' : measurementType,
    'isAssetSolelyOwned' : isAssetSolelyOwned,
    'percentOwned' : percentOwned,
    'userId' : userId,
    'subCategoryId' : subCategoryId,
    'priceperunit' : priceperunit,
    'location' : location,
    'icon' : icon,
    'partner' : partner,
    'images' : images,
    'currentprice' : currentprice,
    '__v' : v
  };
}