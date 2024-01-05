class SubmitChatDetailResponseModel {
  String code;
  String message;

  SubmitChatDetailResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitChatDetailResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitChatDetailResponseModel dataModel = SubmitChatDetailResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

