class DeleteMilestoneDetailResponseModel {
  String code;
  String message;

  DeleteMilestoneDetailResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteMilestoneDetailResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteMilestoneDetailResponseModel dataModel = DeleteMilestoneDetailResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

