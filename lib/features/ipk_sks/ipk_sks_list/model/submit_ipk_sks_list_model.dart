class SubmitIpkSksListResponseModel {
  String code;
  String message;

  SubmitIpkSksListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitIpkSksListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitIpkSksListResponseModel dataModel = SubmitIpkSksListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
