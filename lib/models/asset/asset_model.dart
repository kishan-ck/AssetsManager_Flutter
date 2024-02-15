class AssetModel {
  final List<Data>? data;

  AssetModel({
    this.data,
  });

  AssetModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? name;
  final String? description;
  final String? assetId;
  final int? numberOfMeasurement;
  final int? measurementType;
  final bool? isAssetSolelyOwned;
  final int? percentOwned;
  final String? userId;
  final String? subCategoryId;
  final List<dynamic>? partner;
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
        measurementType = json['measurementType'] as int?,
        isAssetSolelyOwned = json['isAssetSolelyOwned'] as bool?,
        percentOwned = json['percentOwned'] as int?,
        userId = json['userId'] as String?,
        subCategoryId = json['subCategoryId'] as String?,
        partner = json['partner'] as List?,
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
    'partner' : partner,
    'images' : images,
    '__v' : v
  };
}