class DeleteIpkSksGrafikListResponseModel {
  String code;
  String message;

  DeleteIpkSksGrafikListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteIpkSksGrafikListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteIpkSksGrafikListResponseModel dataModel = DeleteIpkSksGrafikListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
