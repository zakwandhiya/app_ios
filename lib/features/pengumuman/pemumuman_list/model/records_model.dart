class RecordsModel {
  String imgIcon;
  String konten;
  String dateModified;
  String imgBackgroud;
  String dateCreated;
  String penulis;
  String judul;
  int id;
  String tgl;
  String jam;

  RecordsModel({
    required this.imgIcon,
    required this.konten,
    required this.dateModified,
    required this.imgBackgroud,
    required this.dateCreated,
    required this.penulis,
    required this.judul,
    required this.id,
    required this.tgl,
    required this.jam,
  });

  Map<String, dynamic> toJson() {
    return {
      "img_icon": imgIcon,
      "konten": konten,
      "date_modified": dateModified,
      "img_backgroud": imgBackgroud,
      "date_created": dateCreated,
      "penulis": penulis,
      "judul": judul,
      "id": id,
      "tgl": tgl,
      "jam": jam,
    };
  }

  factory RecordsModel.fromJson(Map<String, dynamic> data) {
    RecordsModel recordsModel = RecordsModel(
      imgIcon: data['img_icon'],
      konten: data['konten'],
      dateModified: data['date_modified'],
      imgBackgroud: data['img_backgroud'],
      dateCreated: data['date_created'],
      penulis: data['penulis'],
      judul: data['judul'],
      id: data['id'],
      tgl: data['tgl'],
      jam: data['jam'],
    );
    return recordsModel;
  }
}
