class DeleteIpkSksListResponseModel {
  String code;
  String message;

  DeleteIpkSksListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteIpkSksListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteIpkSksListResponseModel dataModel = DeleteIpkSksListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
