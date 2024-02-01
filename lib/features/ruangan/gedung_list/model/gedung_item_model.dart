class GedungItemModel {
  String dateCreated;
  String sksStatus;
  double ipk;
  int semester;
  String dateModified;
  String catatan;
  int id;
  int userId;
  String ipkStatus;
  int sks;

  GedungItemModel({
    required this.dateCreated,
    required this.sksStatus,
    required this.ipk,
    required this.semester,
    required this.dateModified,
    required this.catatan,
    required this.id,
    required this.userId,
    required this.ipkStatus,
    required this.sks,
  });

  Map<String, dynamic> toJson() {
    return {
      "date_created": this.dateCreated,
      "sks_status": this.sksStatus,
      "ipk": this.ipk,
      "semester": this.semester,
      "date_modified": this.dateModified,
      "catatan": this.catatan,
      "id": this.id,
      "user_id": this.userId,
      "ipk_status": this.ipkStatus,
      "sks": this.sks,
    };
  }

  factory GedungItemModel.fromJson(Map<String, dynamic> data) {
    GedungItemModel recordsModel = GedungItemModel(
      dateCreated: data['date_created'],
      sksStatus: data['sks_status'],
      ipk: data['ipk'],
      semester: data['semester'],
      dateModified: data['date_modified'],
      catatan: data['catatan'],
      id: data['id'],
      userId: data['user_id'],
      ipkStatus: data['ipk_status'],
      sks: data['sks'],
    );
    return recordsModel;
  }
}
