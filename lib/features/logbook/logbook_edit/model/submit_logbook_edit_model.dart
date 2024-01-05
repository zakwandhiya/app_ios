class SubmitLogbookEditResponseModel {
  String code;
  String message;

  SubmitLogbookEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory SubmitLogbookEditResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitLogbookEditResponseModel dataModel = SubmitLogbookEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
