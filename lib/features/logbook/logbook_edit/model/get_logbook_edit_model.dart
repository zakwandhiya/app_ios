class GetLogbookEditResponseModel {
  String code;
  String message;

  GetLogbookEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory GetLogbookEditResponseModel.fromJson(Map<String, dynamic> data) {
    GetLogbookEditResponseModel dataModel = GetLogbookEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
