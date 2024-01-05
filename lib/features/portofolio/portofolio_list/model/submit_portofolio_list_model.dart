class SubmitPortofolioListResponseModel {
  String code;
  String message;

  SubmitPortofolioListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitPortofolioListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitPortofolioListResponseModel dataModel = SubmitPortofolioListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
