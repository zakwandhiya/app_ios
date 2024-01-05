class SubmitChatListResponseModel {
  String code;
  String message;

  SubmitChatListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitChatListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitChatListResponseModel dataModel = SubmitChatListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}
