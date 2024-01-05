import "package:bimo_app/features/logbook/model/logbook_item_model.dart";

class Logbook_listModel {
  List<LogbookItemModel> records;

  Logbook_listModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = this.records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory Logbook_listModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<LogbookItemModel> recordsTmp = recordsList.map((i) => LogbookItemModel.fromJson(i)).toList();

    Logbook_listModel logbookListModel = Logbook_listModel(
      records: recordsTmp,
    );
    return logbookListModel;
  }
}
