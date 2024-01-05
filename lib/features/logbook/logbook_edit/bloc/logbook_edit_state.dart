import '../model/delete_logbook_edit_model.dart';
import '../model/get_logbook_edit_model.dart';
import '../model/submit_logbook_edit_model.dart';

abstract class AddLogbookEditState {
  final String message;

  AddLogbookEditState({required this.message});
}

class AddLogbookEditEmpty extends AddLogbookEditState {
  AddLogbookEditEmpty({required String message}) : super(message: message);
}

class AddLogbookEditLoading extends AddLogbookEditState {
  AddLogbookEditLoading({required String message}) : super(message: message);
}

class AddLogbookEditSuccess extends AddLogbookEditState {
  AddLogbookEditSuccess({required String message}) : super(message: message);
}

class AddLogbookEditClientError extends AddLogbookEditState {
  AddLogbookEditClientError({required String message}) : super(message: message);
}

class AddLogbookEditServerError extends AddLogbookEditState {
  AddLogbookEditServerError({required String message}) : super(message: message);
}

class AddLogbookEditJWTError extends AddLogbookEditState {
  AddLogbookEditJWTError({required String message}) : super(message: message);
}

class AddLogbookEditInternetError extends AddLogbookEditState {
  AddLogbookEditInternetError({required String message}) : super(message: message);
}

abstract class DeleteLogbookEditState {}

class DeleteLogbookEditEmpty extends DeleteLogbookEditState {}

class DeleteLogbookEditLoading extends DeleteLogbookEditState {}

class DeleteLogbookEditSuccess extends DeleteLogbookEditState {
  final DeleteLogbookEditResponseModel deleteLogbookEditResponseModel;
  DeleteLogbookEditSuccess({required this.deleteLogbookEditResponseModel});
}

class DeleteLogbookEditClientError extends DeleteLogbookEditState {
  final String message;
  DeleteLogbookEditClientError({required this.message});
}

class DeleteLogbookEditServerError extends DeleteLogbookEditState {
  final String message;
  DeleteLogbookEditServerError({required this.message});
}

class DeleteLogbookEditJWTError extends DeleteLogbookEditState {
  final String message;
  DeleteLogbookEditJWTError({required this.message});
}

class DeleteLogbookEditInternetError extends DeleteLogbookEditState {
  final String message;
  DeleteLogbookEditInternetError({required this.message});
}

abstract class UpdateLogbookEditState {
  final String message;

  UpdateLogbookEditState({required this.message});
}

class UpdateLogbookEditEmpty extends UpdateLogbookEditState {
  UpdateLogbookEditEmpty({required String message}) : super(message: message);
}

class UpdateLogbookEditLoading extends UpdateLogbookEditState {
  UpdateLogbookEditLoading({required String message}) : super(message: message);
}

class UpdateLogbookEditSuccess extends UpdateLogbookEditState {
  UpdateLogbookEditSuccess({required String message}) : super(message: message);
}

class UpdateLogbookEditClientError extends UpdateLogbookEditState {
  UpdateLogbookEditClientError({required String message}) : super(message: message);
}

class UpdateLogbookEditServerError extends UpdateLogbookEditState {
  UpdateLogbookEditServerError({required String message}) : super(message: message);
}

class UpdateLogbookEditJWTError extends UpdateLogbookEditState {
  UpdateLogbookEditJWTError({required String message}) : super(message: message);
}

class UpdateLogbookEditInternetError extends UpdateLogbookEditState {
  UpdateLogbookEditInternetError({required String message}) : super(message: message);
}
