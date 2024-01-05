class DeleteMataKuliahListResponseModel {
  String code;
  String message;

  DeleteMataKuliahListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteMataKuliahListResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteMataKuliahListResponseModel dataModel = DeleteMataKuliahListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

