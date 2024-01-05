class DeleteLogbookEditResponseModel {
  String code;
  String message;

  DeleteLogbookEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory DeleteLogbookEditResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteLogbookEditResponseModel dataModel = DeleteLogbookEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
