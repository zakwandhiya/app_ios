import '../model/delete_milestone_detail_model.dart';
import '../model/get_milestone_detail_model.dart';

abstract class GetMilestoneDetailState {}

class GetMilestoneDetailEmpty extends GetMilestoneDetailState {}

class GetMilestoneDetailLoading extends GetMilestoneDetailState {}

class GetMilestoneDetailSuccess extends GetMilestoneDetailState {
  final GetMilestoneDetailResponseModel getMilestoneDetailResponseModel;
  GetMilestoneDetailSuccess({required this.getMilestoneDetailResponseModel});
}

class GetMilestoneDetailClientError extends GetMilestoneDetailState {
  final String message;
  GetMilestoneDetailClientError({required this.message});
}

class GetMilestoneDetailServerError extends GetMilestoneDetailState {
  final String message;
  GetMilestoneDetailServerError({required this.message});
}

class GetMilestoneDetailJWTError extends GetMilestoneDetailState {
  final String message;
  GetMilestoneDetailJWTError({required this.message});
}

class GetMilestoneDetailInternetError extends GetMilestoneDetailState {
  final String message;
  GetMilestoneDetailInternetError({required this.message});
}

abstract class DeleteMilestoneDetailState {}

class DeleteMilestoneDetailEmpty extends DeleteMilestoneDetailState {}

class DeleteMilestoneDetailLoading extends DeleteMilestoneDetailState {}

class DeleteMilestoneDetailSuccess extends DeleteMilestoneDetailState {
  final DeleteMilestoneDetailResponseModel deleteMilestoneDetailResponseModel;
  DeleteMilestoneDetailSuccess({required this.deleteMilestoneDetailResponseModel});
}

class DeleteMilestoneDetailClientError extends DeleteMilestoneDetailState {
  final String message;
  DeleteMilestoneDetailClientError({required this.message});
}

class DeleteMilestoneDetailServerError extends DeleteMilestoneDetailState {
  final String message;
  DeleteMilestoneDetailServerError({required this.message});
}

class DeleteMilestoneDetailJWTError extends DeleteMilestoneDetailState {
  final String message;
  DeleteMilestoneDetailJWTError({required this.message});
}

class DeleteMilestoneDetailInternetError extends DeleteMilestoneDetailState {
  final String message;
  DeleteMilestoneDetailInternetError({required this.message});
}

abstract class SubmitMilestoneDetailState {
  final String message;

  SubmitMilestoneDetailState({required this.message});
}

class SubmitMilestoneDetailEmpty extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailEmpty({required String message}) : super(message: message);
}

class SubmitMilestoneDetailLoading extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailLoading({required String message}) : super(message: message);
}

class SubmitMilestoneDetailSuccess extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailSuccess({required String message}) : super(message: message);
}

class SubmitMilestoneDetailClientError extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailClientError({required String message}) : super(message: message);
}

class SubmitMilestoneDetailServerError extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailServerError({required String message}) : super(message: message);
}

class SubmitMilestoneDetailJWTError extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailJWTError({required String message}) : super(message: message);
}

class SubmitMilestoneDetailInternetError extends SubmitMilestoneDetailState {
  SubmitMilestoneDetailInternetError({required String message}) : super(message: message);
}

