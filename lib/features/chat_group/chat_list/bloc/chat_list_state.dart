import '../model/delete_chat_list_model.dart';
import '../model/get_chat_list_model.dart';

abstract class GetChatListState {}

class GetChatListEmpty extends GetChatListState {}

class GetChatListLoading extends GetChatListState {}

class GetChatListSuccess extends GetChatListState {
  final GetChatListResponseModel getChatListResponseModel;
  GetChatListSuccess({required this.getChatListResponseModel});
}

class GetChatListClientError extends GetChatListState {
  final String message;
  GetChatListClientError({required this.message});
}

class GetChatListServerError extends GetChatListState {
  final String message;
  GetChatListServerError({required this.message});
}

class GetChatListJWTError extends GetChatListState {
  final String message;
  GetChatListJWTError({required this.message});
}

class GetChatListInternetError extends GetChatListState {
  final String message;
  GetChatListInternetError({required this.message});
}

abstract class DeleteChatListState {}

class DeleteChatListEmpty extends DeleteChatListState {}

class DeleteChatListLoading extends DeleteChatListState {}

class DeleteChatListSuccess extends DeleteChatListState {
  final DeleteChatListResponseModel deleteChatListResponseModel;
  DeleteChatListSuccess({required this.deleteChatListResponseModel});
}

class DeleteChatListClientError extends DeleteChatListState {
  final String message;
  DeleteChatListClientError({required this.message});
}

class DeleteChatListServerError extends DeleteChatListState {
  final String message;
  DeleteChatListServerError({required this.message});
}

class DeleteChatListJWTError extends DeleteChatListState {
  final String message;
  DeleteChatListJWTError({required this.message});
}

class DeleteChatListInternetError extends DeleteChatListState {
  final String message;
  DeleteChatListInternetError({required this.message});
}

abstract class SubmitChatListState {
  final String message;

  SubmitChatListState({required this.message});
}

class SubmitChatListEmpty extends SubmitChatListState {
  SubmitChatListEmpty({required String message}) : super(message: message);
}

class SubmitChatListLoading extends SubmitChatListState {
  SubmitChatListLoading({required String message}) : super(message: message);
}

class SubmitChatListSuccess extends SubmitChatListState {
  SubmitChatListSuccess({required String message}) : super(message: message);
}

class SubmitChatListClientError extends SubmitChatListState {
  SubmitChatListClientError({required String message}) : super(message: message);
}

class SubmitChatListServerError extends SubmitChatListState {
  SubmitChatListServerError({required String message}) : super(message: message);
}

class SubmitChatListJWTError extends SubmitChatListState {
  SubmitChatListJWTError({required String message}) : super(message: message);
}

class SubmitChatListInternetError extends SubmitChatListState {
  SubmitChatListInternetError({required String message}) : super(message: message);
}
