import "records_model.dart";

class GetPengumumanListResponseModel {
  List<RecordsModel> records;

  GetPengumumanListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetPengumumanListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<RecordsModel> recordsTmp = recordsList.map((i) => RecordsModel.fromJson(i)).toList();

    GetPengumumanListResponseModel pengumumanModel = GetPengumumanListResponseModel(
      records: recordsTmp,
    );
    return pengumumanModel;
  }
}
