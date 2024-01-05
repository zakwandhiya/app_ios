import 'package:bimo_app/features/logbook/model/logbook_item_model.dart';

class GetLogbookListResponseModel {
  List<LogbookItemModel> records;

  GetLogbookListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetLogbookListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<LogbookItemModel> recordsTmp = recordsList.map((i) => LogbookItemModel.fromJson(i)).toList();

    GetLogbookListResponseModel mataKuliahListModel = GetLogbookListResponseModel(
      records: recordsTmp,
    );
    return mataKuliahListModel;
  }
}
