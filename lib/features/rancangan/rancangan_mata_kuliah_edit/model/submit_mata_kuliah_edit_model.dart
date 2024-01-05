class SubmitMataKuliahEditResponseModel {
  String code;
  String message;

  SubmitMataKuliahEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory SubmitMataKuliahEditResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitMataKuliahEditResponseModel dataModel = SubmitMataKuliahEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

