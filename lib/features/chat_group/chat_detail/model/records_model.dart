class ChatItem {
  int id;
  int senderId;
  int receiverId;
  String konten;
  String dateCreated;

  ChatItem({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.konten,
    required this.dateCreated,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "sender_id": senderId,
      "receiver_id": receiverId,
      "konten": konten,
      "date_created": dateCreated,
    };
  }

  factory ChatItem.fromJson(Map<String, dynamic> data) {
    ChatItem recordsModel = ChatItem(
      id: data['id'],
      senderId: data['sender_id'],
      receiverId: data['receiver_id'],
      konten: data['konten'],
      dateCreated: data['date_created'],
    );
    return recordsModel;
  }
}
