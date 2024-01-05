import '../model/delete_mata_kuliah_edit_model.dart';
import '../model/get_mata_kuliah_edit_model.dart';
import '../model/submit_mata_kuliah_edit_model.dart';

abstract class AddPortofolioEditState {
  final String message;

  AddPortofolioEditState({required this.message});
}

class AddPortofolioEditEmpty extends AddPortofolioEditState {
  AddPortofolioEditEmpty({required String message}) : super(message: message);
}

class AddPortofolioEditLoading extends AddPortofolioEditState {
  AddPortofolioEditLoading({required String message}) : super(message: message);
}

class AddPortofolioEditSuccess extends AddPortofolioEditState {
  AddPortofolioEditSuccess({required String message}) : super(message: message);
}

class AddPortofolioEditClientError extends AddPortofolioEditState {
  AddPortofolioEditClientError({required String message}) : super(message: message);
}

class AddPortofolioEditServerError extends AddPortofolioEditState {
  AddPortofolioEditServerError({required String message}) : super(message: message);
}

class AddPortofolioEditJWTError extends AddPortofolioEditState {
  AddPortofolioEditJWTError({required String message}) : super(message: message);
}

class AddPortofolioEditInternetError extends AddPortofolioEditState {
  AddPortofolioEditInternetError({required String message}) : super(message: message);
}

abstract class DeletePortofolioEditState {}

class DeletePortofolioEditEmpty extends DeletePortofolioEditState {}

class DeletePortofolioEditLoading extends DeletePortofolioEditState {}

class DeletePortofolioEditSuccess extends DeletePortofolioEditState {
  final DeletePortofolioEditResponseModel deletePortofolioEditResponseModel;
  DeletePortofolioEditSuccess({required this.deletePortofolioEditResponseModel});
}

class DeletePortofolioEditClientError extends DeletePortofolioEditState {
  final String message;
  DeletePortofolioEditClientError({required this.message});
}

class DeletePortofolioEditServerError extends DeletePortofolioEditState {
  final String message;
  DeletePortofolioEditServerError({required this.message});
}

class DeletePortofolioEditJWTError extends DeletePortofolioEditState {
  final String message;
  DeletePortofolioEditJWTError({required this.message});
}

class DeletePortofolioEditInternetError extends DeletePortofolioEditState {
  final String message;
  DeletePortofolioEditInternetError({required this.message});
}

abstract class UpdatePortofolioEditState {
  final String message;

  UpdatePortofolioEditState({required this.message});
}

class UpdatePortofolioEditEmpty extends UpdatePortofolioEditState {
  UpdatePortofolioEditEmpty({required String message}) : super(message: message);
}

class UpdatePortofolioEditLoading extends UpdatePortofolioEditState {
  UpdatePortofolioEditLoading({required String message}) : super(message: message);
}

class UpdatePortofolioEditSuccess extends UpdatePortofolioEditState {
  UpdatePortofolioEditSuccess({required String message}) : super(message: message);
}

class UpdatePortofolioEditClientError extends UpdatePortofolioEditState {
  UpdatePortofolioEditClientError({required String message}) : super(message: message);
}

class UpdatePortofolioEditServerError extends UpdatePortofolioEditState {
  UpdatePortofolioEditServerError({required String message}) : super(message: message);
}

class UpdatePortofolioEditJWTError extends UpdatePortofolioEditState {
  UpdatePortofolioEditJWTError({required String message}) : super(message: message);
}

class UpdatePortofolioEditInternetError extends UpdatePortofolioEditState {
  UpdatePortofolioEditInternetError({required String message}) : super(message: message);
}
