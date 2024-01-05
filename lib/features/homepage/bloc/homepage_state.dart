import '../model/delete_homepage_model.dart';
import '../model/get_homepage_model.dart';
import '../model/submit_homepage_model.dart';

abstract class GetHomepageState {}

class GetHomepageEmpty extends GetHomepageState {}

class GetHomepageLoading extends GetHomepageState {}

class GetHomepageSuccess extends GetHomepageState {
  final GetHomepageResponseModel getHomepageResponseModel;
  GetHomepageSuccess({required this.getHomepageResponseModel});
}

class GetHomepageClientError extends GetHomepageState {
  final String message;
  GetHomepageClientError({required this.message});
}

class GetHomepageServerError extends GetHomepageState {
  final String message;
  GetHomepageServerError({required this.message});
}

class GetHomepageJWTError extends GetHomepageState {
  final String message;
  GetHomepageJWTError({required this.message});
}

class GetHomepageInternetError extends GetHomepageState {
  final String message;
  GetHomepageInternetError({required this.message});
}

abstract class DeleteHomepageState {}

class DeleteHomepageEmpty extends DeleteHomepageState {}

class DeleteHomepageLoading extends DeleteHomepageState {}

class DeleteHomepageSuccess extends DeleteHomepageState {
  final DeleteHomepageResponseModel deleteHomepageResponseModel;
  DeleteHomepageSuccess({required this.deleteHomepageResponseModel});
}

class DeleteHomepageClientError extends DeleteHomepageState {
  final String message;
  DeleteHomepageClientError({required this.message});
}

class DeleteHomepageServerError extends DeleteHomepageState {
  final String message;
  DeleteHomepageServerError({required this.message});
}

class DeleteHomepageJWTError extends DeleteHomepageState {
  final String message;
  DeleteHomepageJWTError({required this.message});
}

class DeleteHomepageInternetError extends DeleteHomepageState {
  final String message;
  DeleteHomepageInternetError({required this.message});
}

abstract class SubmitHomepageState {}

class SubmitHomepageEmpty extends SubmitHomepageState {}

class SubmitHomepageLoading extends SubmitHomepageState {}

class SubmitHomepageSuccess extends SubmitHomepageState {
  final SubmitHomepageResponseModel submitHomepageResponseModel;
  SubmitHomepageSuccess({required this.submitHomepageResponseModel});
}

class SubmitHomepageClientError extends SubmitHomepageState {
  final String message;
  SubmitHomepageClientError({required this.message});
}

class SubmitHomepageServerError extends SubmitHomepageState {
  final String message;
  SubmitHomepageServerError({required this.message});
}

class SubmitHomepageJWTError extends SubmitHomepageState {
  final String message;
  SubmitHomepageJWTError({required this.message});
}

class SubmitHomepageInternetError extends SubmitHomepageState {
  final String message;
  SubmitHomepageInternetError({required this.message});
}

