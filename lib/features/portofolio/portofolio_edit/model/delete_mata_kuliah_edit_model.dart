class DeletePortofolioEditResponseModel {
  String code;
  String message;

  DeletePortofolioEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory DeletePortofolioEditResponseModel.fromJson(Map<String, dynamic> data) {
    DeletePortofolioEditResponseModel dataModel = DeletePortofolioEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
