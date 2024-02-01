class SubmitIpkSksGrafikListResponseModel {
  String code;
  String message;

  SubmitIpkSksGrafikListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitIpkSksGrafikListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitIpkSksGrafikListResponseModel dataModel = SubmitIpkSksGrafikListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
