import '../model/delete_milestone_edit_model.dart';
import '../model/get_milestone_edit_model.dart';

abstract class GetMilestoneEditState {}

class GetMilestoneEditEmpty extends GetMilestoneEditState {}

class GetMilestoneEditLoading extends GetMilestoneEditState {}

class GetMilestoneEditSuccess extends GetMilestoneEditState {
  final GetMilestoneEditResponseModel getMilestoneEditResponseModel;
  GetMilestoneEditSuccess({required this.getMilestoneEditResponseModel});
}

class GetMilestoneEditClientError extends GetMilestoneEditState {
  final String message;
  GetMilestoneEditClientError({required this.message});
}

class GetMilestoneEditServerError extends GetMilestoneEditState {
  final String message;
  GetMilestoneEditServerError({required this.message});
}

class GetMilestoneEditJWTError extends GetMilestoneEditState {
  final String message;
  GetMilestoneEditJWTError({required this.message});
}

class GetMilestoneEditInternetError extends GetMilestoneEditState {
  final String message;
  GetMilestoneEditInternetError({required this.message});
}

abstract class DeleteMilestoneEditState {}

class DeleteMilestoneEditEmpty extends DeleteMilestoneEditState {}

class DeleteMilestoneEditLoading extends DeleteMilestoneEditState {}

class DeleteMilestoneEditSuccess extends DeleteMilestoneEditState {
  final DeleteMilestoneEditResponseModel deleteMilestoneEditResponseModel;
  DeleteMilestoneEditSuccess({required this.deleteMilestoneEditResponseModel});
}

class DeleteMilestoneEditClientError extends DeleteMilestoneEditState {
  final String message;
  DeleteMilestoneEditClientError({required this.message});
}

class DeleteMilestoneEditServerError extends DeleteMilestoneEditState {
  final String message;
  DeleteMilestoneEditServerError({required this.message});
}

class DeleteMilestoneEditJWTError extends DeleteMilestoneEditState {
  final String message;
  DeleteMilestoneEditJWTError({required this.message});
}

class DeleteMilestoneEditInternetError extends DeleteMilestoneEditState {
  final String message;
  DeleteMilestoneEditInternetError({required this.message});
}

abstract class SubmitMilestoneEditState {
  final String message;

  SubmitMilestoneEditState({required this.message});
}

class SubmitMilestoneEditEmpty extends SubmitMilestoneEditState {
  SubmitMilestoneEditEmpty({required String message}) : super(message: message);
}

class SubmitMilestoneEditLoading extends SubmitMilestoneEditState {
  SubmitMilestoneEditLoading({required String message}) : super(message: message);
}

class SubmitMilestoneEditSuccess extends SubmitMilestoneEditState {
  SubmitMilestoneEditSuccess({required String message}) : super(message: message);
}

class SubmitMilestoneEditClientError extends SubmitMilestoneEditState {
  SubmitMilestoneEditClientError({required String message}) : super(message: message);
}

class SubmitMilestoneEditServerError extends SubmitMilestoneEditState {
  SubmitMilestoneEditServerError({required String message}) : super(message: message);
}

class SubmitMilestoneEditJWTError extends SubmitMilestoneEditState {
  SubmitMilestoneEditJWTError({required String message}) : super(message: message);
}

class SubmitMilestoneEditInternetError extends SubmitMilestoneEditState {
  SubmitMilestoneEditInternetError({required String message}) : super(message: message);
}

