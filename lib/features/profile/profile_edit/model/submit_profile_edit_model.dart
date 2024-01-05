class SubmitProfileEditResponseModel {
  String code;
  String message;

  SubmitProfileEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitProfileEditResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitProfileEditResponseModel dataModel = SubmitProfileEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

