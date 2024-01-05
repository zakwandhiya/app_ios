import '../model/delete_logbook_list_model.dart';
import '../model/get_logbook_list_model.dart';

abstract class GetLogbookListState {}

class GetLogbookListEmpty extends GetLogbookListState {}

class GetLogbookListLoading extends GetLogbookListState {}

class GetLogbookListSuccess extends GetLogbookListState {
  final GetLogbookListResponseModel getLogbookListResponseModel;
  GetLogbookListSuccess({required this.getLogbookListResponseModel});
}

class GetLogbookListClientError extends GetLogbookListState {
  final String message;
  GetLogbookListClientError({required this.message});
}

class GetLogbookListServerError extends GetLogbookListState {
  final String message;
  GetLogbookListServerError({required this.message});
}

class GetLogbookListJWTError extends GetLogbookListState {
  final String message;
  GetLogbookListJWTError({required this.message});
}

class GetLogbookListInternetError extends GetLogbookListState {
  final String message;
  GetLogbookListInternetError({required this.message});
}

abstract class DeleteLogbookListState {}

class DeleteLogbookListEmpty extends DeleteLogbookListState {}

class DeleteLogbookListLoading extends DeleteLogbookListState {}

class DeleteLogbookListSuccess extends DeleteLogbookListState {
  final DeleteLogbookListResponseModel deleteLogbookListResponseModel;
  DeleteLogbookListSuccess({required this.deleteLogbookListResponseModel});
}

class DeleteLogbookListClientError extends DeleteLogbookListState {
  final String message;
  DeleteLogbookListClientError({required this.message});
}

class DeleteLogbookListServerError extends DeleteLogbookListState {
  final String message;
  DeleteLogbookListServerError({required this.message});
}

class DeleteLogbookListJWTError extends DeleteLogbookListState {
  final String message;
  DeleteLogbookListJWTError({required this.message});
}

class DeleteLogbookListInternetError extends DeleteLogbookListState {
  final String message;
  DeleteLogbookListInternetError({required this.message});
}

abstract class SubmitLogbookListState {
  final String message;

  SubmitLogbookListState({required this.message});
}

class SubmitLogbookListEmpty extends SubmitLogbookListState {
  SubmitLogbookListEmpty({required String message}) : super(message: message);
}

class SubmitLogbookListLoading extends SubmitLogbookListState {
  SubmitLogbookListLoading({required String message}) : super(message: message);
}

class SubmitLogbookListSuccess extends SubmitLogbookListState {
  SubmitLogbookListSuccess({required String message}) : super(message: message);
}

class SubmitLogbookListClientError extends SubmitLogbookListState {
  SubmitLogbookListClientError({required String message}) : super(message: message);
}

class SubmitLogbookListServerError extends SubmitLogbookListState {
  SubmitLogbookListServerError({required String message}) : super(message: message);
}

class SubmitLogbookListJWTError extends SubmitLogbookListState {
  SubmitLogbookListJWTError({required String message}) : super(message: message);
}

class SubmitLogbookListInternetError extends SubmitLogbookListState {
  SubmitLogbookListInternetError({required String message}) : super(message: message);
}
