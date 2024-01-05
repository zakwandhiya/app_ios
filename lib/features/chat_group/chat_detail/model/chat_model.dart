import "records_model.dart";

class GetChatDetailResponseModel {
  List<ChatItem> records;

  GetChatDetailResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetChatDetailResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<ChatItem> recordsTmp = recordsList.map((i) => ChatItem.fromJson(i)).toList();

    GetChatDetailResponseModel chatModel = GetChatDetailResponseModel(
      records: recordsTmp,
    );
    return chatModel;
  }
}
