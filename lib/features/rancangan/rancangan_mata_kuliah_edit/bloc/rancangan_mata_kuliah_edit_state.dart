import '../model/delete_mata_kuliah_edit_model.dart';
import '../model/get_mata_kuliah_edit_model.dart';
import '../model/submit_mata_kuliah_edit_model.dart';

abstract class GetMataKuliahEditState {}

class GetMataKuliahEditEmpty extends GetMataKuliahEditState {}

class GetMataKuliahEditLoading extends GetMataKuliahEditState {}

class GetMataKuliahEditSuccess extends GetMataKuliahEditState {
  final GetMataKuliahEditResponseModel getMataKuliahEditResponseModel;
  GetMataKuliahEditSuccess({required this.getMataKuliahEditResponseModel});
}

class GetMataKuliahEditClientError extends GetMataKuliahEditState {
  final String message;
  GetMataKuliahEditClientError({required this.message});
}

class GetMataKuliahEditServerError extends GetMataKuliahEditState {
  final String message;
  GetMataKuliahEditServerError({required this.message});
}

class GetMataKuliahEditJWTError extends GetMataKuliahEditState {
  final String message;
  GetMataKuliahEditJWTError({required this.message});
}

class GetMataKuliahEditInternetError extends GetMataKuliahEditState {
  final String message;
  GetMataKuliahEditInternetError({required this.message});
}

abstract class DeleteMataKuliahEditState {}

class DeleteMataKuliahEditEmpty extends DeleteMataKuliahEditState {}

class DeleteMataKuliahEditLoading extends DeleteMataKuliahEditState {}

class DeleteMataKuliahEditSuccess extends DeleteMataKuliahEditState {
  final DeleteMataKuliahEditResponseModel deleteMataKuliahEditResponseModel;
  DeleteMataKuliahEditSuccess({required this.deleteMataKuliahEditResponseModel});
}

class DeleteMataKuliahEditClientError extends DeleteMataKuliahEditState {
  final String message;
  DeleteMataKuliahEditClientError({required this.message});
}

class DeleteMataKuliahEditServerError extends DeleteMataKuliahEditState {
  final String message;
  DeleteMataKuliahEditServerError({required this.message});
}

class DeleteMataKuliahEditJWTError extends DeleteMataKuliahEditState {
  final String message;
  DeleteMataKuliahEditJWTError({required this.message});
}

class DeleteMataKuliahEditInternetError extends DeleteMataKuliahEditState {
  final String message;
  DeleteMataKuliahEditInternetError({required this.message});
}

abstract class SubmitMataKuliahEditState {
  final String message;

  SubmitMataKuliahEditState({required this.message});
}

class SubmitMataKuliahEditEmpty extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditEmpty({required String message}) : super(message: message);
}

class SubmitMataKuliahEditLoading extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditLoading({required String message}) : super(message: message);
}

class SubmitMataKuliahEditSuccess extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditSuccess({required String message}) : super(message: message);
}

class SubmitMataKuliahEditClientError extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditClientError({required String message}) : super(message: message);
}

class SubmitMataKuliahEditServerError extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditServerError({required String message}) : super(message: message);
}

class SubmitMataKuliahEditJWTError extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditJWTError({required String message}) : super(message: message);
}

class SubmitMataKuliahEditInternetError extends SubmitMataKuliahEditState {
  SubmitMataKuliahEditInternetError({required String message}) : super(message: message);
}

