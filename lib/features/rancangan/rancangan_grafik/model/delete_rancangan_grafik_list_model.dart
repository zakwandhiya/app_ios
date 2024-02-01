class DeleteRancanganGrafikListResponseModel {
  String code;
  String message;

  DeleteRancanganGrafikListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteRancanganGrafikListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteRancanganGrafikListResponseModel dataModel = DeleteRancanganGrafikListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
