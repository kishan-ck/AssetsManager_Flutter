class AssetModel {
  final int? status;
  final List<Data>? data;
  final String? message;

  AssetModel({
    this.status,
    this.data,
    this.message,
  });

  AssetModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList(),
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'data' : data?.map((e) => e.toJson()).toList(),
    'message' : message
  };
}

class Data {
  final String? id;
  final String? name;
  final String? description;
  final String? assetId;
  final int? numberOfMeasurement;
  final String? measurementType;
  final bool? isAssetSolelyOwned;
  final int? percentOwned;
  final String? userId;
  final SubCategoryId? subCategoryId;
  final String? priceperunit;
  final String? location;
  final List<dynamic>? partner;
  final List<String>? images;
  final int? v;

  Data({
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
    this.partner,
    this.images,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        assetId = json['assetId'] as String?,
        numberOfMeasurement = json['numberOfMeasurement'] as int?,
        measurementType = json['measurementType'] as String?,
        isAssetSolelyOwned = json['isAssetSolelyOwned'] as bool?,
        percentOwned = json['percentOwned'] as int?,
        userId = json['userId'] as String?,
        subCategoryId = (json['subCategoryId'] as Map<String,dynamic>?) != null ? SubCategoryId.fromJson(json['subCategoryId'] as Map<String,dynamic>) : null,
        priceperunit = json['priceperunit'] as String?,
        location = json['location'] as String?,
        partner = json['partner'] as List?,
        images = (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
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
    'subCategoryId' : subCategoryId?.toJson(),
    'priceperunit' : priceperunit,
    'location' : location,
    'partner' : partner,
    'images' : images,
    '__v' : v
  };
}

class SubCategoryId {
  final String? id;
  final String? name;
  final CatId? catId;
  final int? v;

  SubCategoryId({
    this.id,
    this.name,
    this.catId,
    this.v,
  });

  SubCategoryId.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        catId = (json['cat_id'] as Map<String,dynamic>?) != null ? CatId.fromJson(json['cat_id'] as Map<String,dynamic>) : null,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'cat_id' : catId?.toJson(),
    '__v' : v
  };
}

class CatId {
  final String? id;
  final String? name;
  final String? image;
  final String? icon;
  final List<Measurement>? measurement;
  final int? v;

  CatId({
    this.id,
    this.name,
    this.image,
    this.icon,
    this.measurement,
    this.v,
  });

  CatId.fromJson(Map<String, dynamic> json)
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
  final String? catId;
  final String? id;

  Measurement({
    this.name,
    this.key,
    this.catId,
    this.id,
  });

  Measurement.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        key = json['key'] as int?,
        catId = json['cat_id'] as String?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() => {
    'name' : name,
    'key' : key,
    'cat_id' : catId,
    '_id' : id
  };
}