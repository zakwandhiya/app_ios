class SubmitRancanganGrafikListResponseModel {
  String code;
  String message;

  SubmitRancanganGrafikListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitRancanganGrafikListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitRancanganGrafikListResponseModel dataModel = SubmitRancanganGrafikListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
