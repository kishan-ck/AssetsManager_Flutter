class AddAssetsModel {
  final int? status;
  final Data? data;
  final String? message;

  AddAssetsModel({
    this.status,
    this.data,
    this.message,
  });

  AddAssetsModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() =>
      {'status': status, 'data': data?.toJson(), 'message': message};
}

class Data {
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
  final List<String>? images;
  final String? id;
  final int? v;

  Data({
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
    this.id,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        description = json['description'] as String?,
        assetId = json['assetId'] as String?,
        numberOfMeasurement = json['numberOfMeasurement'] as int?,
        measurementType = json['measurementType'] as int?,
        isAssetSolelyOwned = json['isAssetSolelyOwned'] as bool?,
        percentOwned = json['percentOwned'] as int?,
        userId = json['userId'] as String?,
        subCategoryId = json['subCategoryId'] as String?,
        partner = json['partner'] as List?,
        images =
            (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
        id = json['_id'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'assetId': assetId,
        'numberOfMeasurement': numberOfMeasurement,
        'measurementType': measurementType,
        'isAssetSolelyOwned': isAssetSolelyOwned,
        'percentOwned': percentOwned,
        'userId': userId,
        'subCategoryId': subCategoryId,
        'partner': partner,
        'images': images,
        '_id': id,
        '__v': v
      };
}
