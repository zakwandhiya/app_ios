import 'chat_user_model.dart';

class GetChatListResponseModel {
  List<ChatUserModel> records;

  GetChatListResponseModel({
    required this.records,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordsList = records.map((i) => i.toJson()).toList();

    return {
      "records": recordsList,
    };
  }

  factory GetChatListResponseModel.fromJson(Map<String, dynamic> data) {
    var recordsList = data["records"] as List;
    List<ChatUserModel> recordsTmp = recordsList.map((i) => ChatUserModel.fromJson(i)).toList();

    GetChatListResponseModel chatUserModel = GetChatListResponseModel(
      records: recordsTmp,
    );
    return chatUserModel;
  }
}
