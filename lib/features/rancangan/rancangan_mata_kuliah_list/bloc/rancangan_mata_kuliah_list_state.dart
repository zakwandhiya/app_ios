import '../model/delete_mata_kuliah_list_model.dart';
import '../model/get_mata_kuliah_list_model.dart';

abstract class GetMataKuliahListState {}

class GetMataKuliahListEmpty extends GetMataKuliahListState {}

class GetMataKuliahListLoading extends GetMataKuliahListState {}

class GetMataKuliahListSuccess extends GetMataKuliahListState {
  final GetMataKuliahListResponseModel getMataKuliahListResponseModel;
  GetMataKuliahListSuccess({required this.getMataKuliahListResponseModel});
}

class GetMataKuliahListClientError extends GetMataKuliahListState {
  final String message;
  GetMataKuliahListClientError({required this.message});
}

class GetMataKuliahListServerError extends GetMataKuliahListState {
  final String message;
  GetMataKuliahListServerError({required this.message});
}

class GetMataKuliahListJWTError extends GetMataKuliahListState {
  final String message;
  GetMataKuliahListJWTError({required this.message});
}

class GetMataKuliahListInternetError extends GetMataKuliahListState {
  final String message;
  GetMataKuliahListInternetError({required this.message});
}

abstract class DeleteMataKuliahListState {}

class DeleteMataKuliahListEmpty extends DeleteMataKuliahListState {}

class DeleteMataKuliahListLoading extends DeleteMataKuliahListState {}

class DeleteMataKuliahListSuccess extends DeleteMataKuliahListState {
  final DeleteMataKuliahListResponseModel deleteMataKuliahListResponseModel;
  DeleteMataKuliahListSuccess({required this.deleteMataKuliahListResponseModel});
}

class DeleteMataKuliahListClientError extends DeleteMataKuliahListState {
  final String message;
  DeleteMataKuliahListClientError({required this.message});
}

class DeleteMataKuliahListServerError extends DeleteMataKuliahListState {
  final String message;
  DeleteMataKuliahListServerError({required this.message});
}

class DeleteMataKuliahListJWTError extends DeleteMataKuliahListState {
  final String message;
  DeleteMataKuliahListJWTError({required this.message});
}

class DeleteMataKuliahListInternetError extends DeleteMataKuliahListState {
  final String message;
  DeleteMataKuliahListInternetError({required this.message});
}

abstract class SubmitMataKuliahListState {
  final String message;

  SubmitMataKuliahListState({required this.message});
}

class SubmitMataKuliahListEmpty extends SubmitMataKuliahListState {
  SubmitMataKuliahListEmpty({required String message}) : super(message: message);
}

class SubmitMataKuliahListLoading extends SubmitMataKuliahListState {
  SubmitMataKuliahListLoading({required String message}) : super(message: message);
}

class SubmitMataKuliahListSuccess extends SubmitMataKuliahListState {
  SubmitMataKuliahListSuccess({required String message}) : super(message: message);
}

class SubmitMataKuliahListClientError extends SubmitMataKuliahListState {
  SubmitMataKuliahListClientError({required String message}) : super(message: message);
}

class SubmitMataKuliahListServerError extends SubmitMataKuliahListState {
  SubmitMataKuliahListServerError({required String message}) : super(message: message);
}

class SubmitMataKuliahListJWTError extends SubmitMataKuliahListState {
  SubmitMataKuliahListJWTError({required String message}) : super(message: message);
}

class SubmitMataKuliahListInternetError extends SubmitMataKuliahListState {
  SubmitMataKuliahListInternetError({required String message}) : super(message: message);
}

