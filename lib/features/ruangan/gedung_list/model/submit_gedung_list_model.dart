class SubmitGedungListResponseModel {
  String code;
  String message;

  SubmitGedungListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitGedungListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitGedungListResponseModel dataModel = SubmitGedungListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
