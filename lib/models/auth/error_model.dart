class ErrorModel {
  final int? status;
  final String? statusState;
  final String? message;

  ErrorModel({
    this.status,
    this.statusState,
    this.message,
  });

  ErrorModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        statusState = json['statusState'] as String?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {
    'status' : status,
    'statusState' : statusState,
    'message' : message
  };
}