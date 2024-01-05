class DeleteProfileEditResponseModel {
  String code;
  String message;

  DeleteProfileEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteProfileEditResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteProfileEditResponseModel dataModel = DeleteProfileEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

