import '../model/delete_login_model.dart';
import '../model/get_login_model.dart';

abstract class GetLoginState {}

class GetLoginEmpty extends GetLoginState {}

class GetLoginLoading extends GetLoginState {}

class GetLoginSuccess extends GetLoginState {
  final GetLoginResponseModel getLoginResponseModel;
  GetLoginSuccess({required this.getLoginResponseModel});
}

class GetLoginClientError extends GetLoginState {
  final String message;
  GetLoginClientError({required this.message});
}

class GetLoginServerError extends GetLoginState {
  final String message;
  GetLoginServerError({required this.message});
}

class GetLoginJWTError extends GetLoginState {
  final String message;
  GetLoginJWTError({required this.message});
}

class GetLoginInternetError extends GetLoginState {
  final String message;
  GetLoginInternetError({required this.message});
}

abstract class DeleteLoginState {}

class DeleteLoginEmpty extends DeleteLoginState {}

class DeleteLoginLoading extends DeleteLoginState {}

class DeleteLoginSuccess extends DeleteLoginState {
  final DeleteLoginResponseModel deleteLoginResponseModel;
  DeleteLoginSuccess({required this.deleteLoginResponseModel});
}

class DeleteLoginClientError extends DeleteLoginState {
  final String message;
  DeleteLoginClientError({required this.message});
}

class DeleteLoginServerError extends DeleteLoginState {
  final String message;
  DeleteLoginServerError({required this.message});
}

class DeleteLoginJWTError extends DeleteLoginState {
  final String message;
  DeleteLoginJWTError({required this.message});
}

class DeleteLoginInternetError extends DeleteLoginState {
  final String message;
  DeleteLoginInternetError({required this.message});
}

abstract class SubmitLoginState {}

class SubmitLoginEmpty extends SubmitLoginState {}

class SubmitLoginLoading extends SubmitLoginState {}

class SubmitLoginSuccess extends SubmitLoginState {
  SubmitLoginSuccess();
}

class SubmitLoginClientError extends SubmitLoginState {
  final String message;
  SubmitLoginClientError({required this.message});
}

class SubmitLoginServerError extends SubmitLoginState {
  final String message;
  SubmitLoginServerError({required this.message});
}

class SubmitLoginJWTError extends SubmitLoginState {
  final String message;
  SubmitLoginJWTError({required this.message});
}

class SubmitLoginInternetError extends SubmitLoginState {
  final String message;
  SubmitLoginInternetError({required this.message});
}
