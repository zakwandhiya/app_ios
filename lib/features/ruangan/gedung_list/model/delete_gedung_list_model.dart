class DeleteGedungListResponseModel {
  String code;
  String message;

  DeleteGedungListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteGedungListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteGedungListResponseModel dataModel = DeleteGedungListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
