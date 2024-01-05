import 'dart:async';

import '../repository/chat_detail_repository.dart';
import 'chat_detail_state.dart';

class ChatDetailBloc {
  final ChatDetailRepository chatDetailRepository;

  ChatDetailBloc({required this.chatDetailRepository});

  final StreamController<GetChatDetailState> _getChatDetailController = StreamController<GetChatDetailState>.broadcast();
  Stream<GetChatDetailState> get getChatDetailState => _getChatDetailController.stream.asBroadcastStream();

  GetChatDetailState get getInitialChatDetailState => GetChatDetailLoading();

  final StreamController<SubmitChatDetailState> _submitChatDetailController = StreamController<SubmitChatDetailState>.broadcast();
  Stream<SubmitChatDetailState> get submitChatDetailState => _submitChatDetailController.stream.asBroadcastStream();

  SubmitChatDetailState get submitInitialChatDetailState => SubmitChatDetailLoading(message: "");

  final StreamController<DeleteChatDetailState> _deleteChatDetailController = StreamController<DeleteChatDetailState>.broadcast();
  Stream<DeleteChatDetailState> get deleteChatDetailState => _deleteChatDetailController.stream.asBroadcastStream();

  DeleteChatDetailState get deleteInitialChatDetailState => DeleteChatDetailLoading();

  void dispose() {
    _getChatDetailController.close();
    _submitChatDetailController.close();
    _deleteChatDetailController.close();
  }

  Future<GetChatDetailState> refreshChatDetail({required int receiver_id}) {
    return chatDetailRepository.requestGetChatDetail(receiver_id: receiver_id).then((value) {
      _getChatDetailController.add(value);
      return value;
    });
  }

  Future<SubmitChatDetailState> submitChatDetail({
    required int target_id,
    required String konten,
  }) {
    _submitChatDetailController.add(SubmitChatDetailLoading(message: ""));
    return chatDetailRepository
        .requestSubmitChatDetail(
      receiver_id: target_id,
      konten: konten,
    )
        .then((value) {
      _submitChatDetailController.add(value);
      return value;
    });
  }

  Future<DeleteChatDetailState> deleteChatDetail({
    required String id,
  }) {
    _deleteChatDetailController.add(DeleteChatDetailLoading());
    return chatDetailRepository.requestDeleteChatDetail(id: id).then((value) {
      _deleteChatDetailController.add(value);
      return value;
    });
  }
}
