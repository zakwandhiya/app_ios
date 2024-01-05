class DeleteMataKuliahEditResponseModel {
  String code;
  String message;

  DeleteMataKuliahEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": this.code,
      "message": this.message,
    };
  }

  factory DeleteMataKuliahEditResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteMataKuliahEditResponseModel dataModel = DeleteMataKuliahEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

