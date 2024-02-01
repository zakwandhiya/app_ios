import 'dosen_item_model.dart';

class DosenModel {
  List<DosenItemModel> records;

  DosenModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = this.records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory DosenModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<DosenItemModel> recordsTmp = recordsList.map((i) => DosenItemModel.fromJson(i)).toList();

    DosenModel dosenModel = DosenModel(
      records: recordsTmp,
    );
    return dosenModel;
  }
}
