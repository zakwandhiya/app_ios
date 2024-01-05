import 'package:bimo_app/features/portofolio/model/portofolio_item_model.dart';

class GetPortofolioListResponseModel {
  List<PortofolioItemModel> records;

  GetPortofolioListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetPortofolioListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<PortofolioItemModel> recordsTmp = recordsList.map((i) => PortofolioItemModel.fromJson(i)).toList();

    GetPortofolioListResponseModel portofolioListModel = GetPortofolioListResponseModel(
      records: recordsTmp,
    );
    return portofolioListModel;
  }
}
