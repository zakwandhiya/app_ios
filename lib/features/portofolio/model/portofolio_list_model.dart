import 'portofolio_item_model.dart';

class Portofolio_listModel {
  List<PortofolioItemModel> records;

  Portofolio_listModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = this.records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory Portofolio_listModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<PortofolioItemModel> recordsTmp = recordsList.map((i) => PortofolioItemModel.fromJson(i)).toList();

    Portofolio_listModel portofolioListModel = Portofolio_listModel(
      records: recordsTmp,
    );
    return portofolioListModel;
  }
}
