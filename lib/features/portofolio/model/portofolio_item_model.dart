class PortofolioItemModel {
  String penyelenggara;
  int userId;
  String namaKegiatan;
  String dateCreated;
  String kategori;
  String jabatan;
  String tanggalSelesai;
  String tanggalMulai;
  int id;
  String dateModified;

  PortofolioItemModel({
    required this.penyelenggara,
    required this.userId,
    required this.namaKegiatan,
    required this.dateCreated,
    required this.kategori,
    required this.jabatan,
    required this.tanggalSelesai,
    required this.tanggalMulai,
    required this.id,
    required this.dateModified,
  });

  Map<String, dynamic> toJson() {
    return {
      "penyelenggara": this.penyelenggara,
      "user_id": this.userId,
      "nama_kegiatan": this.namaKegiatan,
      // "date_created": this.dateCreated,
      "kategori": this.kategori,
      "jabatan": this.jabatan,
      "tanggal_selesai": this.tanggalSelesai,
      "tanggal_mulai": this.tanggalMulai,
      // "id": this.id,
      // "date_modified": this.dateModified,
    };
  }

  factory PortofolioItemModel.fromJson(Map<String, dynamic> data) {
    PortofolioItemModel recordsModel = PortofolioItemModel(
      penyelenggara: data['penyelenggara'],
      userId: data['user_id'],
      namaKegiatan: data['nama_kegiatan'],
      dateCreated: data['date_created'],
      kategori: data['kategori'],
      jabatan: data['jabatan'],
      tanggalSelesai: data['tanggal_selesai'],
      tanggalMulai: data['tanggal_mulai'],
      id: data['id'],
      dateModified: data['date_modified'],
    );
    return recordsModel;
  }
}
