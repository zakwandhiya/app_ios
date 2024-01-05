class DeleteChatListResponseModel {
  String code;
  String message;

  DeleteChatListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteChatListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteChatListResponseModel dataModel = DeleteChatListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
