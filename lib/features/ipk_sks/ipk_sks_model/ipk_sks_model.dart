import "records_model.dart";

class IpkSksListModel {
  List<IpkSksItemModel> records;

  IpkSksListModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = this.records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory IpkSksListModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<IpkSksItemModel> recordsTmp = recordsList.map((i) => IpkSksItemModel.fromJson(i)).toList();

    IpkSksListModel ipkSksModel = IpkSksListModel(
      records: recordsTmp,
    );
    return ipkSksModel;
  }
}
