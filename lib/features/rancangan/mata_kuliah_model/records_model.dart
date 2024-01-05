class MataKuliahModel {
  String namaMataKuliah;
  int sks;
  String? namaMataKuliahPrasyarat;
  int? idMataKuliahPrasyarat;
  int id;
  String dateCreated;
  String dateModified;

  MataKuliahModel({
    required this.namaMataKuliah,
    required this.sks,
    this.namaMataKuliahPrasyarat,
    this.idMataKuliahPrasyarat,
    required this.id,
    required this.dateCreated,
    required this.dateModified,
  });

  Map<String, dynamic> toJson() {
    return {
      "nama_mata_kuliah": this.namaMataKuliah,
      "sks": this.sks,
      "nama_mata_kuliah_prasyarat": this.namaMataKuliahPrasyarat,
      "id_mata_kuliah_prasyarat": this.idMataKuliahPrasyarat,
      "id": this.id,
      "date_created": this.dateCreated,
      "date_modified": this.dateModified,
    };
  }

  factory MataKuliahModel.fromJson(Map<String, dynamic> data) {
    MataKuliahModel recordsModel = MataKuliahModel(
      namaMataKuliah: data['nama_mata_kuliah'],
      sks: data['sks'],
      namaMataKuliahPrasyarat: data['id_mata_kuliah_prasyarat']['nama_mata_kuliah'],
      idMataKuliahPrasyarat: data['id_mata_kuliah_prasyarat']['id'],
      id: data['id'],
      dateCreated: data['date_created'],
      dateModified: data['date_modified'],
    );
    return recordsModel;
  }
}
