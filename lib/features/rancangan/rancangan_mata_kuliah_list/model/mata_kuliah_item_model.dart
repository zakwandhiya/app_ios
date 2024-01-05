class MataKuliahItemModel {
  int semester;
  String targetNilai;
  int nxk;
  String status;
  String realisasi;
  int id;
  String dateCreated;
  String dateModified;
  int userId;
  String namaMataKuliah;
  int sks;
  String catatanDosen;

  MataKuliahItemModel({
    required this.semester,
    required this.targetNilai,
    required this.nxk,
    required this.status,
    required this.realisasi,
    required this.id,
    required this.dateCreated,
    required this.dateModified,
    required this.userId,
    required this.namaMataKuliah,
    required this.sks,
    required this.catatanDosen,
  });

  Map<String, dynamic> toJson() {
    return {
      "semester": semester,
      "target_nilai": targetNilai,
      "nxk": nxk,
      "status": status,
      "realisasi": realisasi,
      "id": id,
      "date_created": dateCreated,
      "date_modified": dateModified,
      "user_id": userId,
      "nama_mata_kuliah": namaMataKuliah,
      "sks": sks,
      "catatan_dosen": catatanDosen,
    };
  }

  factory MataKuliahItemModel.fromJson(Map<String, dynamic> data) {
    MataKuliahItemModel recordsModel = MataKuliahItemModel(
      semester: data['semester'],
      targetNilai: data['target_nilai'],
      nxk: data['nxk'],
      status: data['status'],
      realisasi: data['realisasi'],
      id: data['id'],
      dateCreated: data['date_created'],
      dateModified: data['date_modified'],
      userId: data['user_id'],
      namaMataKuliah: data['nama_mata_kuliah'],
      sks: data['sks'],
      catatanDosen: data['catatan_dosen'],
    );
    return recordsModel;
  }
}
