import 'mata_kuliah_item_model.dart';

class GetMataKuliahListResponseModel {
  List<MataKuliahItemModel> records;

  GetMataKuliahListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetMataKuliahListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<MataKuliahItemModel> recordsTmp = recordsList.map((i) => MataKuliahItemModel.fromJson(i)).toList();

    GetMataKuliahListResponseModel mataKuliahListModel = GetMataKuliahListResponseModel(
      records: recordsTmp,
    );
    return mataKuliahListModel;
  }
}
