class DeleteMilestoneEditResponseModel {
  String code;
  String message;

  DeleteMilestoneEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory DeleteMilestoneEditResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteMilestoneEditResponseModel dataModel = DeleteMilestoneEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

