import '../model/delete_chat_detail_model.dart';
import '../model/get_chat_detail_model.dart';

abstract class GetChatDetailState {}

class GetChatDetailEmpty extends GetChatDetailState {}

class GetChatDetailLoading extends GetChatDetailState {}

class GetChatDetailSuccess extends GetChatDetailState {
  final GetChatDetailResponseModel getChatDetailResponseModel;
  GetChatDetailSuccess({required this.getChatDetailResponseModel});
}

class GetChatDetailClientError extends GetChatDetailState {
  final String message;
  GetChatDetailClientError({required this.message});
}

class GetChatDetailServerError extends GetChatDetailState {
  final String message;
  GetChatDetailServerError({required this.message});
}

class GetChatDetailJWTError extends GetChatDetailState {
  final String message;
  GetChatDetailJWTError({required this.message});
}

class GetChatDetailInternetError extends GetChatDetailState {
  final String message;
  GetChatDetailInternetError({required this.message});
}

abstract class DeleteChatDetailState {}

class DeleteChatDetailEmpty extends DeleteChatDetailState {}

class DeleteChatDetailLoading extends DeleteChatDetailState {}

class DeleteChatDetailSuccess extends DeleteChatDetailState {
  final DeleteChatDetailResponseModel deleteChatDetailResponseModel;
  DeleteChatDetailSuccess({required this.deleteChatDetailResponseModel});
}

class DeleteChatDetailClientError extends DeleteChatDetailState {
  final String message;
  DeleteChatDetailClientError({required this.message});
}

class DeleteChatDetailServerError extends DeleteChatDetailState {
  final String message;
  DeleteChatDetailServerError({required this.message});
}

class DeleteChatDetailJWTError extends DeleteChatDetailState {
  final String message;
  DeleteChatDetailJWTError({required this.message});
}

class DeleteChatDetailInternetError extends DeleteChatDetailState {
  final String message;
  DeleteChatDetailInternetError({required this.message});
}

abstract class SubmitChatDetailState {
  final String message;

  SubmitChatDetailState({required this.message});
}

class SubmitChatDetailEmpty extends SubmitChatDetailState {
  SubmitChatDetailEmpty({required String message}) : super(message: message);
}

class SubmitChatDetailLoading extends SubmitChatDetailState {
  SubmitChatDetailLoading({required String message}) : super(message: message);
}

class SubmitChatDetailSuccess extends SubmitChatDetailState {
  SubmitChatDetailSuccess({required String message}) : super(message: message);
}

class SubmitChatDetailClientError extends SubmitChatDetailState {
  SubmitChatDetailClientError({required String message}) : super(message: message);
}

class SubmitChatDetailServerError extends SubmitChatDetailState {
  SubmitChatDetailServerError({required String message}) : super(message: message);
}

class SubmitChatDetailJWTError extends SubmitChatDetailState {
  SubmitChatDetailJWTError({required String message}) : super(message: message);
}

class SubmitChatDetailInternetError extends SubmitChatDetailState {
  SubmitChatDetailInternetError({required String message}) : super(message: message);
}

