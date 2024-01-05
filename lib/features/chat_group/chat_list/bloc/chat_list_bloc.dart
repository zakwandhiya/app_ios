import 'dart:async';

import '../model/submit_chat_list_model.dart';
import '../repository/chat_list_repository.dart';
import 'chat_list_state.dart';

class ChatListBloc {
  final ChatListRepository chatListRepository;

  ChatListBloc({required this.chatListRepository});

  final StreamController<GetChatListState> _getChatListController = StreamController<GetChatListState>.broadcast();
  Stream<GetChatListState> get getChatListState => _getChatListController.stream.asBroadcastStream();

  GetChatListState get getInitialChatListState => GetChatListLoading();

  final StreamController<SubmitChatListState> _submitChatListController = StreamController<SubmitChatListState>.broadcast();
  Stream<SubmitChatListState> get submitChatListState => _submitChatListController.stream.asBroadcastStream();

  SubmitChatListState get submitInitialChatListState => SubmitChatListLoading(message: "");

  final StreamController<DeleteChatListState> _deleteChatListController = StreamController<DeleteChatListState>.broadcast();
  Stream<DeleteChatListState> get deleteChatListState => _deleteChatListController.stream.asBroadcastStream();

  DeleteChatListState get deleteInitialChatListState => DeleteChatListLoading();

  void dispose() {
    _getChatListController.close();
    _submitChatListController.close();
    _deleteChatListController.close();
  }

  Future<GetChatListState> getChatList() {
    _getChatListController.add(GetChatListLoading());
    return chatListRepository.requestGetChatList().then((value) {
      _getChatListController.add(value);
      return value;
    });
  }

  Future<SubmitChatListState> submitChatList(
    SubmitChatListResponseModel submitChatListTmp,
  ) {
    _submitChatListController.add(SubmitChatListLoading(message: ""));
    return chatListRepository
        .requestSubmitChatList(
      submitChatListTmp,
    )
        .then((value) {
      _submitChatListController.add(value);
      return value;
    });
  }

  Future<DeleteChatListState> deleteChatList({
    required String id,
  }) {
    _deleteChatListController.add(DeleteChatListLoading());
    return chatListRepository.requestDeleteChatList(id: id).then((value) {
      _deleteChatListController.add(value);
      return value;
    });
  }
}
