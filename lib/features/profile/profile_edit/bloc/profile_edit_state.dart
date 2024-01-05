import '../model/delete_profile_edit_model.dart';
import '../model/get_profile_edit_model.dart';

abstract class GetProfileEditState {}

class GetProfileEditEmpty extends GetProfileEditState {}

class GetProfileEditLoading extends GetProfileEditState {}

class GetProfileEditSuccess extends GetProfileEditState {
  final GetProfileEditResponseModel getProfileEditResponseModel;
  GetProfileEditSuccess({required this.getProfileEditResponseModel});
}

class GetProfileEditClientError extends GetProfileEditState {
  final String message;
  GetProfileEditClientError({required this.message});
}

class GetProfileEditServerError extends GetProfileEditState {
  final String message;
  GetProfileEditServerError({required this.message});
}

class GetProfileEditJWTError extends GetProfileEditState {
  final String message;
  GetProfileEditJWTError({required this.message});
}

class GetProfileEditInternetError extends GetProfileEditState {
  final String message;
  GetProfileEditInternetError({required this.message});
}

abstract class DeleteProfileEditState {}

class DeleteProfileEditEmpty extends DeleteProfileEditState {}

class DeleteProfileEditLoading extends DeleteProfileEditState {}

class DeleteProfileEditSuccess extends DeleteProfileEditState {
  final DeleteProfileEditResponseModel deleteProfileEditResponseModel;
  DeleteProfileEditSuccess({required this.deleteProfileEditResponseModel});
}

class DeleteProfileEditClientError extends DeleteProfileEditState {
  final String message;
  DeleteProfileEditClientError({required this.message});
}

class DeleteProfileEditServerError extends DeleteProfileEditState {
  final String message;
  DeleteProfileEditServerError({required this.message});
}

class DeleteProfileEditJWTError extends DeleteProfileEditState {
  final String message;
  DeleteProfileEditJWTError({required this.message});
}

class DeleteProfileEditInternetError extends DeleteProfileEditState {
  final String message;
  DeleteProfileEditInternetError({required this.message});
}

abstract class SubmitProfileEditState {
  final String message;

  SubmitProfileEditState({required this.message});
}

class SubmitProfileEditEmpty extends SubmitProfileEditState {
  SubmitProfileEditEmpty({required String message}) : super(message: message);
}

class SubmitProfileEditLoading extends SubmitProfileEditState {
  SubmitProfileEditLoading({required String message}) : super(message: message);
}

class SubmitProfileEditSuccess extends SubmitProfileEditState {
  SubmitProfileEditSuccess({required String message}) : super(message: message);
}

class SubmitProfileEditClientError extends SubmitProfileEditState {
  SubmitProfileEditClientError({required String message}) : super(message: message);
}

class SubmitProfileEditServerError extends SubmitProfileEditState {
  SubmitProfileEditServerError({required String message}) : super(message: message);
}

class SubmitProfileEditJWTError extends SubmitProfileEditState {
  SubmitProfileEditJWTError({required String message}) : super(message: message);
}

class SubmitProfileEditInternetError extends SubmitProfileEditState {
  SubmitProfileEditInternetError({required String message}) : super(message: message);
}
