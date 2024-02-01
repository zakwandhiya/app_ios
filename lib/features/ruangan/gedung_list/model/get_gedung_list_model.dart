import 'dosen_item_model.dart';

class GetGedungListResponseModel {
  List<DosenItemModel> records;

  GetGedungListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetGedungListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<DosenItemModel> recordsTmp = recordsList.map((i) => DosenItemModel.fromJson(i)).toList();

    GetGedungListResponseModel gedungListModel = GetGedungListResponseModel(
      records: recordsTmp,
    );
    return gedungListModel;
  }
}
