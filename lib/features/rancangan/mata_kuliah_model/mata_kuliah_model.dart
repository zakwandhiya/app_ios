import "records_model.dart";

class MataKuliahListModel {
  List<MataKuliahModel> records;

  MataKuliahListModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = this.records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory MataKuliahListModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<MataKuliahModel> recordsTmp = recordsList.map((i) => MataKuliahModel.fromJson(i)).toList();

    MataKuliahListModel mataKuliahModel = MataKuliahListModel(
      records: recordsTmp,
    );
    return mataKuliahModel;
  }
}
