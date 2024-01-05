class LogbookItemModel {
  String dateModified;
  String dosenPembimbing;
  String tanggalKonsultasi;
  String keperluan;
  String semester;
  int id;
  String dateCreated;
  String status;
  int userId;
  String keterangan;

  LogbookItemModel({
    required this.dateModified,
    required this.dosenPembimbing,
    required this.tanggalKonsultasi,
    required this.keperluan,
    required this.semester,
    required this.id,
    required this.dateCreated,
    required this.status,
    required this.userId,
    required this.keterangan,
  });

  Map<String, dynamic> toJson() {
    return {
      "dosen_pembimbing": this.dosenPembimbing,
      "tanggal_konsultasi": this.tanggalKonsultasi,
      "keperluan": this.keperluan,
      "semester": this.semester,
      "status": this.status,
      "user_id": this.userId,
      "keterangan": this.keterangan,
    };
  }

  factory LogbookItemModel.fromJson(Map<String, dynamic> data) {
    LogbookItemModel recordsModel = LogbookItemModel(
      dateModified: data['date_modified'],
      dosenPembimbing: data['dosen_pembimbing'],
      tanggalKonsultasi: data['tanggal_konsultasi'],
      keperluan: data['keperluan'],
      semester: data['semester'],
      id: data['id'],
      dateCreated: data['date_created'],
      status: data['status'],
      userId: data['user_id'],
      keterangan: data['keterangan'],
    );
    return recordsModel;
  }
}
