import 'ipk_sks_item_model.dart';

class GetIpkSksListResponseModel {
  List<IpkSksItemModel> records;

  GetIpkSksListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetIpkSksListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<IpkSksItemModel> recordsTmp = recordsList.map((i) => IpkSksItemModel.fromJson(i)).toList();

    GetIpkSksListResponseModel ipkSksListModel = GetIpkSksListResponseModel(
      records: recordsTmp,
    );
    return ipkSksListModel;
  }
}
