class SubmitMilestoneEditResponseModel {
  String code;
  String message;

  SubmitMilestoneEditResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitMilestoneEditResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitMilestoneEditResponseModel dataModel = SubmitMilestoneEditResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

