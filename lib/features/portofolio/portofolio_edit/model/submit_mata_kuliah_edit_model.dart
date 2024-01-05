class SubmitPortofolioEditResponseModel {
  String code;
  String message;

  SubmitPortofolioEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory SubmitPortofolioEditResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitPortofolioEditResponseModel dataModel = SubmitPortofolioEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
