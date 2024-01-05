class DeletePengumumanListResponseModel {
  String code;
  String message;

  DeletePengumumanListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeletePengumumanListResponseModel.fromJson(Map<String, dynamic> data) {
    DeletePengumumanListResponseModel dataModel = DeletePengumumanListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

