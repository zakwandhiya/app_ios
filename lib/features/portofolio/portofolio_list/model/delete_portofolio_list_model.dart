class DeletePortofolioListResponseModel {
  String code;
  String message;

  DeletePortofolioListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeletePortofolioListResponseModel.fromJson(Map<String, dynamic> data) {
    DeletePortofolioListResponseModel dataModel = DeletePortofolioListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
