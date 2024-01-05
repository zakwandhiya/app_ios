import '../model/delete_profile_detail_model.dart';
import '../model/get_profile_detail_model.dart';
import '../model/submit_profile_detail_model.dart';

abstract class GetProfileDetailState {}

class GetProfileDetailEmpty extends GetProfileDetailState {}

class GetProfileDetailLoading extends GetProfileDetailState {}

class GetProfileDetailSuccess extends GetProfileDetailState {
  final GetProfileDetailResponseModel getProfileDetailResponseModel;
  GetProfileDetailSuccess({required this.getProfileDetailResponseModel});
}

class GetProfileDetailClientError extends GetProfileDetailState {
  final String message;
  GetProfileDetailClientError({required this.message});
}

class GetProfileDetailServerError extends GetProfileDetailState {
  final String message;
  GetProfileDetailServerError({required this.message});
}

class GetProfileDetailJWTError extends GetProfileDetailState {
  final String message;
  GetProfileDetailJWTError({required this.message});
}

class GetProfileDetailInternetError extends GetProfileDetailState {
  final String message;
  GetProfileDetailInternetError({required this.message});
}

abstract class DeleteProfileDetailState {}

class DeleteProfileDetailEmpty extends DeleteProfileDetailState {}

class DeleteProfileDetailLoading extends DeleteProfileDetailState {}

class DeleteProfileDetailSuccess extends DeleteProfileDetailState {
  final DeleteProfileDetailResponseModel deleteProfileDetailResponseModel;
  DeleteProfileDetailSuccess({required this.deleteProfileDetailResponseModel});
}

class DeleteProfileDetailClientError extends DeleteProfileDetailState {
  final String message;
  DeleteProfileDetailClientError({required this.message});
}

class DeleteProfileDetailServerError extends DeleteProfileDetailState {
  final String message;
  DeleteProfileDetailServerError({required this.message});
}

class DeleteProfileDetailJWTError extends DeleteProfileDetailState {
  final String message;
  DeleteProfileDetailJWTError({required this.message});
}

class DeleteProfileDetailInternetError extends DeleteProfileDetailState {
  final String message;
  DeleteProfileDetailInternetError({required this.message});
}

abstract class SubmitProfileDetailState {}

class SubmitProfileDetailEmpty extends SubmitProfileDetailState {}

class SubmitProfileDetailLoading extends SubmitProfileDetailState {}

class SubmitProfileDetailSuccess extends SubmitProfileDetailState {
  final SubmitProfileDetailResponseModel submitProfileDetailResponseModel;
  SubmitProfileDetailSuccess({required this.submitProfileDetailResponseModel});
}

class SubmitProfileDetailClientError extends SubmitProfileDetailState {
  final String message;
  SubmitProfileDetailClientError({required this.message});
}

class SubmitProfileDetailServerError extends SubmitProfileDetailState {
  final String message;
  SubmitProfileDetailServerError({required this.message});
}

class SubmitProfileDetailJWTError extends SubmitProfileDetailState {
  final String message;
  SubmitProfileDetailJWTError({required this.message});
}

class SubmitProfileDetailInternetError extends SubmitProfileDetailState {
  final String message;
  SubmitProfileDetailInternetError({required this.message});
}

