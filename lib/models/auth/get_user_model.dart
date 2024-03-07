class GetUserModel {
  final int? status;
  final Data? data;
  final String? message;

  GetUserModel({
    this.status,
    this.data,
    this.message,
  });

  GetUserModel.fromJson(Map<String, dynamic> json)
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
  final String? id;
  final String? fullname;
  final String? phoneNo;
  final String? email;
  final String? password;
  final String? socialId;
  final String? socialType;
  final String? authToken;
  final String? image;
  final int? v;
  final int? assets;
  final int? subCat;

  Data({
    this.id,
    this.fullname,
    this.phoneNo,
    this.email,
    this.password,
    this.socialId,
    this.socialType,
    this.authToken,
    this.image,
    this.v,
    this.assets,
    this.subCat,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        fullname = json['fullname'] as String?,
        phoneNo = json['phone_no'] as String?,
        email = json['email'] as String?,
        password = json['password'] as String?,
        socialId = json['social_id'] as String?,
        socialType = json['social_type'] as String?,
        authToken = json['authToken'] as String?,
        image = json['image'] as String?,
        v = json['__v'] as int?,
        assets = json['assets'] as int?,
        subCat = json['sub_cat'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'fullname' : fullname,
    'phone_no' : phoneNo,
    'email' : email,
    'password' : password,
    'social_id' : socialId,
    'social_type' : socialType,
    'authToken' : authToken,
    'image' : image,
    '__v' : v,
    'assets' : assets,
    'sub_cat' : subCat
  };
}