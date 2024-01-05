class DeleteHomepageResponseModel {
  String imgJson;
  String id;
  String createdBy;
  String sN;
  String createdAt;
  String img;
  String tanggal;
  String qty;
  String lokasiPengirim;
  String typeSub;
  String kode;
  String updatedAt;
  String idParent;
  String lokasi;
  String supplier;
  String lokasiPenerima;
  String status;
  String produk;
  String type;

  DeleteHomepageResponseModel({
    required this.imgJson,
    required this.id,
    required this.createdBy,
    required this.sN,
    required this.createdAt,
    required this.img,
    required this.tanggal,
    required this.qty,
    required this.lokasiPengirim,
    required this.typeSub,
    required this.kode,
    required this.updatedAt,
    required this.idParent,
    required this.lokasi,
    required this.supplier,
    required this.lokasiPenerima,
    required this.status,
    required this.produk,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "img_json": imgJson,
      "id": id,
      "created_by": createdBy,
      "s_n": sN,
      "created_at": createdAt,
      "img": img,
      "tanggal": tanggal,
      "qty": qty,
      "lokasi_pengirim": lokasiPengirim,
      "type_sub": typeSub,
      "kode": kode,
      "updated_at": updatedAt,
      "id_parent": idParent,
      "lokasi": lokasi,
      "supplier": supplier,
      "lokasi_penerima": lokasiPenerima,
      "status": status,
      "produk": produk,
      "type": type,
    };
  }

  factory DeleteHomepageResponseModel.fromJson(Map<String, dynamic> data) {
    DeleteHomepageResponseModel dataModel = DeleteHomepageResponseModel(
      imgJson: data['img_json'],
      id: data['id'],
      createdBy: data['created_by'],
      sN: data['s_n'],
      createdAt: data['created_at'],
      img: data['img'],
      tanggal: data['tanggal'],
      qty: data['qty'],
      lokasiPengirim: data['lokasi_pengirim'],
      typeSub: data['type_sub'],
      kode: data['kode'],
      updatedAt: data['updated_at'],
      idParent: data['id_parent'],
      lokasi: data['lokasi'],
      supplier: data['supplier'],
      lokasiPenerima: data['lokasi_penerima'],
      status: data['status'],
      produk: data['produk'],
      type: data['type'],
    );
    return dataModel;
  }
}

