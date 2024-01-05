class ChatUserModel {
  int semesterLeft;
  String status;
  double ipk;
  int userId;
  String name;
  int semester;
  int id;
  String profilePicUrl;
  int sks;

  ChatUserModel({
    required this.semesterLeft,
    required this.status,
    required this.ipk,
    required this.userId,
    required this.name,
    required this.semester,
    required this.id,
    required this.profilePicUrl,
    required this.sks,
  });

  Map<String, dynamic> toJson() {
    return {
      "semester_left": semesterLeft,
      "status": status,
      "ipk": ipk,
      "user_id": userId,
      "name": name,
      "semester": semester,
      "id": id,
      "profile_pic_url": profilePicUrl,
      "sks": sks,
    };
  }

  factory ChatUserModel.fromJson(Map<String, dynamic> data) {
    ChatUserModel recordsModel = ChatUserModel(
      semesterLeft: data['semester_left'],
      status: data['status'],
      ipk: data['ipk'],
      userId: data['user_id'],
      name: data['name'],
      semester: data['semester'],
      id: data['id'],
      profilePicUrl: data['profile_pic_url'],
      sks: data['sks'],
    );
    return recordsModel;
  }
}
