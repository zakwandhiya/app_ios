class GetMilestoneEditResponseModel {
  String code;
  String message;

  GetMilestoneEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory GetMilestoneEditResponseModel.fromJson(Map<String, dynamic> data) {
    GetMilestoneEditResponseModel dataModel = GetMilestoneEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

