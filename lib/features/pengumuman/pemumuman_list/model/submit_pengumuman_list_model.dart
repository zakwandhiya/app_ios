class SubmitPengumumanListResponseModel {
  String code;
  String message;

  SubmitPengumumanListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitPengumumanListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitPengumumanListResponseModel dataModel = SubmitPengumumanListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

