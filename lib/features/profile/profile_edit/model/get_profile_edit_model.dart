class GetProfileEditResponseModel {
  String code;
  String message;

  GetProfileEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory GetProfileEditResponseModel.fromJson(Map<String, dynamic> data) {
    GetProfileEditResponseModel dataModel = GetProfileEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

