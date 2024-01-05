class DeleteLogbookListResponseModel {
  String code;
  String message;

  DeleteLogbookListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteLogbookListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteLogbookListResponseModel dataModel = DeleteLogbookListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
