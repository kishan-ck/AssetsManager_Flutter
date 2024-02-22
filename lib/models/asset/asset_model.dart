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
  final dynamic subCategoryId;
  final List<Partner>? partner;
  final List<dynamic>? images;
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
        subCategoryId = json['subCategoryId'],
        partner = (json['partner'] as List?)?.map((dynamic e) => Partner.fromJson(e as Map<String,dynamic>)).toList(),
        images = json['images'] as List?,
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
    'partner' : partner?.map((e) => e.toJson()).toList(),
    'images' : images,
    '__v' : v
  };
}

class Partner {
  final String? id;
  final String? name;
  final String? contact;
  final int? percentOwned;
  final int? v;

  Partner({
    this.id,
    this.name,
    this.contact,
    this.percentOwned,
    this.v,
  });

  Partner.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        contact = json['contact'] as String?,
        percentOwned = json['percentOwned'] as int?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'name' : name,
    'contact' : contact,
    'percentOwned' : percentOwned,
    '__v' : v
  };
}