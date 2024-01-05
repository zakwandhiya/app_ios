class GetMataKuliahEditResponseModel {
  String code;
  String message;

  GetMataKuliahEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory GetMataKuliahEditResponseModel.fromJson(Map<String, dynamic> data) {
    GetMataKuliahEditResponseModel dataModel = GetMataKuliahEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

