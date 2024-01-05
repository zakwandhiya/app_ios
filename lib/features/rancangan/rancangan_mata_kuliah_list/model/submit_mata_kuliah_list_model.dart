class SubmitMataKuliahListResponseModel {
  String code;
  String message;

  SubmitMataKuliahListResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitMataKuliahListResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitMataKuliahListResponseModel dataModel = SubmitMataKuliahListResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

