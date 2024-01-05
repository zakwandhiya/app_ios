class SubmitHomepageResponseModel {
  String name;
  int semesterLeft;
  int sks;
  String profilePicUrl;
  String status;
  double ipk;
  int id;
  int userId;
  int semester;

  SubmitHomepageResponseModel({
    required this.name,
    required this.semesterLeft,
    required this.sks,
    required this.profilePicUrl,
    required this.status,
    required this.ipk,
    required this.id,
    required this.userId,
    required this.semester,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "semester_left": semesterLeft,
      "sks": sks,
      "profile_pic_url": profilePicUrl,
      "status": status,
      "ipk": ipk,
      "id": id,
      "user_id": userId,
      "semester": semester,
    };
  }

  factory SubmitHomepageResponseModel.fromJson(Map<String, dynamic> data) {
    SubmitHomepageResponseModel homepageModel = SubmitHomepageResponseModel(
      name: data['name'],
      semesterLeft: data['semester_left'],
      sks: data['sks'],
      profilePicUrl: data['profile_pic_url'],
      status: data['status'],
      ipk: data['ipk'],
      id: data['id'],
      userId: data['user_id'],
      semester: data['semester'],
    );
    return homepageModel;
  }
}
