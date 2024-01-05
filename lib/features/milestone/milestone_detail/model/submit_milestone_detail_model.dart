class SubmitMilestoneDetailResponseModel {
  String code;
  String message;

  SubmitMilestoneDetailResponseModel({
    required this.code,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "message": message,
    };
  }

  factory SubmitMilestoneDetailResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitMilestoneDetailResponseModel dataModel = SubmitMilestoneDetailResponseModel(
      code: data['code'],
      message: data['message'],
    );
    return dataModel;
  }
}

