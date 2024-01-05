class DeleteChatDetailResponseModel {
  String code;
  String message;

  DeleteChatDetailResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteChatDetailResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteChatDetailResponseModel dataModel = DeleteChatDetailResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

