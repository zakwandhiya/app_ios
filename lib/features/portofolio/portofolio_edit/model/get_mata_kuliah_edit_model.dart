class GetPortofolioEditResponseModel {
  String code;
  String message;

  GetPortofolioEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory GetPortofolioEditResponseModel.fromJson(Map<String, dynamic> data) {
    GetPortofolioEditResponseModel dataModel = GetPortofolioEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
