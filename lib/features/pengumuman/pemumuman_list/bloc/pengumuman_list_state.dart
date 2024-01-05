import '../model/delete_pengumuman_list_model.dart';
import '../model/get_pengumuman_list_model.dart';

abstract class GetPengumumanListState {}

class GetPengumumanListEmpty extends GetPengumumanListState {}

class GetPengumumanListLoading extends GetPengumumanListState {}

class GetPengumumanListSuccess extends GetPengumumanListState {
  final GetPengumumanListResponseModel getPengumumanListResponseModel;
  GetPengumumanListSuccess({required this.getPengumumanListResponseModel});
}

class GetPengumumanListClientError extends GetPengumumanListState {
  final String message;
  GetPengumumanListClientError({required this.message});
}

class GetPengumumanListServerError extends GetPengumumanListState {
  final String message;
  GetPengumumanListServerError({required this.message});
}

class GetPengumumanListJWTError extends GetPengumumanListState {
  final String message;
  GetPengumumanListJWTError({required this.message});
}

class GetPengumumanListInternetError extends GetPengumumanListState {
  final String message;
  GetPengumumanListInternetError({required this.message});
}

abstract class DeletePengumumanListState {}

class DeletePengumumanListEmpty extends DeletePengumumanListState {}

class DeletePengumumanListLoading extends DeletePengumumanListState {}

class DeletePengumumanListSuccess extends DeletePengumumanListState {
  final DeletePengumumanListResponseModel deletePengumumanListResponseModel;
  DeletePengumumanListSuccess({required this.deletePengumumanListResponseModel});
}

class DeletePengumumanListClientError extends DeletePengumumanListState {
  final String message;
  DeletePengumumanListClientError({required this.message});
}

class DeletePengumumanListServerError extends DeletePengumumanListState {
  final String message;
  DeletePengumumanListServerError({required this.message});
}

class DeletePengumumanListJWTError extends DeletePengumumanListState {
  final String message;
  DeletePengumumanListJWTError({required this.message});
}

class DeletePengumumanListInternetError extends DeletePengumumanListState {
  final String message;
  DeletePengumumanListInternetError({required this.message});
}

abstract class SubmitPengumumanListState {
  final String message;

  SubmitPengumumanListState({required this.message});
}

class SubmitPengumumanListEmpty extends SubmitPengumumanListState {
  SubmitPengumumanListEmpty({required String message}) : super(message: message);
}

class SubmitPengumumanListLoading extends SubmitPengumumanListState {
  SubmitPengumumanListLoading({required String message}) : super(message: message);
}

class SubmitPengumumanListSuccess extends SubmitPengumumanListState {
  SubmitPengumumanListSuccess({required String message}) : super(message: message);
}

class SubmitPengumumanListClientError extends SubmitPengumumanListState {
  SubmitPengumumanListClientError({required String message}) : super(message: message);
}

class SubmitPengumumanListServerError extends SubmitPengumumanListState {
  SubmitPengumumanListServerError({required String message}) : super(message: message);
}

class SubmitPengumumanListJWTError extends SubmitPengumumanListState {
  SubmitPengumumanListJWTError({required String message}) : super(message: message);
}

class SubmitPengumumanListInternetError extends SubmitPengumumanListState {
  SubmitPengumumanListInternetError({required String message}) : super(message: message);
}

