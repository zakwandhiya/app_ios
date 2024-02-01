import 'ipk_sks_grafik_model.dart';

class GetIpkSksGrafikListResponseModel {
  List<IpkSksGrafikItemModel> records;

  GetIpkSksGrafikListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetIpkSksGrafikListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<IpkSksGrafikItemModel> recordsTmp = recordsList.map((i) => IpkSksGrafikItemModel.fromJson(i)).toList();

    GetIpkSksGrafikListResponseModel ipkSksGrafikListModel = GetIpkSksGrafikListResponseModel(
      records: recordsTmp,
    );
    return ipkSksGrafikListModel;
  }
}
