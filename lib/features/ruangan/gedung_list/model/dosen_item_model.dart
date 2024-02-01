class DosenItemModel {
  String nama;
  String ruangan;
  String nik;
  String hp;
  int id;
  String dateCreated;
  String dateModified;

  DosenItemModel({
    required this.nama,
    required this.ruangan,
    required this.nik,
    required this.hp,
    required this.id,
    required this.dateCreated,
    required this.dateModified,
  });

  Map<String, dynamic> toJson() {
    return {
      "nama": this.nama,
      "ruangan": this.ruangan,
      "nik": this.nik,
      "hp": this.hp,
      "id": this.id,
      "date_created": this.dateCreated,
      "date_modified": this.dateModified,
    };
  }

  factory DosenItemModel.fromJson(Map<String, dynamic> data) {
    DosenItemModel recordsModel = DosenItemModel(
      nama: data['nama'],
      ruangan: data['ruangan'],
      nik: data['nik'],
      hp: data['hp'],
      id: data['id'],
      dateCreated: data['date_created'],
      dateModified: data['date_modified'],
    );
    return recordsModel;
  }
}
