import 'rancangan_grafik_model.dart';

class GetRancanganGrafikListResponseModel {
  List<RancanganGrafikItemModel> records;

  GetRancanganGrafikListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetRancanganGrafikListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<RancanganGrafikItemModel> recordsTmp = recordsList.map((i) => RancanganGrafikItemModel.fromJson(i)).toList();

    GetRancanganGrafikListResponseModel rancanganGrafikListModel = GetRancanganGrafikListResponseModel(
      records: recordsTmp,
    );
    return rancanganGrafikListModel;
  }
}
