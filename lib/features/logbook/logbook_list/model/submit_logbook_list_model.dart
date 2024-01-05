class SubmitLogbookListResponseModel {
  String code;
  String message;

  SubmitLogbookListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitLogbookListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitLogbookListResponseModel dataModel = SubmitLogbookListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
