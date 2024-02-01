import '../model/delete_gedung_list_model.dart';
import '../model/get_gedung_list_model.dart';

abstract class GetGedungListState {}

class GetGedungListEmpty extends GetGedungListState {}

class GetGedungListLoading extends GetGedungListState {}

class GetGedungListSuccess extends GetGedungListState {
  final GetGedungListResponseModel getGedungListResponseModel;
  GetGedungListSuccess({required this.getGedungListResponseModel});
}

class GetGedungListClientError extends GetGedungListState {
  final String message;
  GetGedungListClientError({required this.message});
}

class GetGedungListServerError extends GetGedungListState {
  final String message;
  GetGedungListServerError({required this.message});
}

class GetGedungListJWTError extends GetGedungListState {
  final String message;
  GetGedungListJWTError({required this.message});
}

class GetGedungListInternetError extends GetGedungListState {
  final String message;
  GetGedungListInternetError({required this.message});
}

abstract class DeleteGedungListState {}

class DeleteGedungListEmpty extends DeleteGedungListState {}

class DeleteGedungListLoading extends DeleteGedungListState {}

class DeleteGedungListSuccess extends DeleteGedungListState {
  final DeleteGedungListResponseModel deleteGedungListResponseModel;
  DeleteGedungListSuccess({required this.deleteGedungListResponseModel});
}

class DeleteGedungListClientError extends DeleteGedungListState {
  final String message;
  DeleteGedungListClientError({required this.message});
}

class DeleteGedungListServerError extends DeleteGedungListState {
  final String message;
  DeleteGedungListServerError({required this.message});
}

class DeleteGedungListJWTError extends DeleteGedungListState {
  final String message;
  DeleteGedungListJWTError({required this.message});
}

class DeleteGedungListInternetError extends DeleteGedungListState {
  final String message;
  DeleteGedungListInternetError({required this.message});
}

abstract class SubmitGedungListState {
  final String message;

  SubmitGedungListState({required this.message});
}

class SubmitGedungListEmpty extends SubmitGedungListState {
  SubmitGedungListEmpty({required String message}) : super(message: message);
}

class SubmitGedungListLoading extends SubmitGedungListState {
  SubmitGedungListLoading({required String message}) : super(message: message);
}

class SubmitGedungListSuccess extends SubmitGedungListState {
  SubmitGedungListSuccess({required String message}) : super(message: message);
}

class SubmitGedungListClientError extends SubmitGedungListState {
  SubmitGedungListClientError({required String message}) : super(message: message);
}

class SubmitGedungListServerError extends SubmitGedungListState {
  SubmitGedungListServerError({required String message}) : super(message: message);
}

class SubmitGedungListJWTError extends SubmitGedungListState {
  SubmitGedungListJWTError({required String message}) : super(message: message);
}

class SubmitGedungListInternetError extends SubmitGedungListState {
  SubmitGedungListInternetError({required String message}) : super(message: message);
}
