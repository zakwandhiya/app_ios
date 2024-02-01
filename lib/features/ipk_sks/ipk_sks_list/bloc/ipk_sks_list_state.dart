import '../model/delete_ipk_sks_list_model.dart';
import '../model/get_ipk_sks_list_model.dart';

abstract class GetIpkSksListState {}

class GetIpkSksListEmpty extends GetIpkSksListState {}

class GetIpkSksListLoading extends GetIpkSksListState {}

class GetIpkSksListSuccess extends GetIpkSksListState {
  final GetIpkSksListResponseModel getIpkSksListResponseModel;
  GetIpkSksListSuccess({required this.getIpkSksListResponseModel});
}

class GetIpkSksListClientError extends GetIpkSksListState {
  final String message;
  GetIpkSksListClientError({required this.message});
}

class GetIpkSksListServerError extends GetIpkSksListState {
  final String message;
  GetIpkSksListServerError({required this.message});
}

class GetIpkSksListJWTError extends GetIpkSksListState {
  final String message;
  GetIpkSksListJWTError({required this.message});
}

class GetIpkSksListInternetError extends GetIpkSksListState {
  final String message;
  GetIpkSksListInternetError({required this.message});
}

abstract class DeleteIpkSksListState {}

class DeleteIpkSksListEmpty extends DeleteIpkSksListState {}

class DeleteIpkSksListLoading extends DeleteIpkSksListState {}

class DeleteIpkSksListSuccess extends DeleteIpkSksListState {
  final DeleteIpkSksListResponseModel deleteIpkSksListResponseModel;
  DeleteIpkSksListSuccess({required this.deleteIpkSksListResponseModel});
}

class DeleteIpkSksListClientError extends DeleteIpkSksListState {
  final String message;
  DeleteIpkSksListClientError({required this.message});
}

class DeleteIpkSksListServerError extends DeleteIpkSksListState {
  final String message;
  DeleteIpkSksListServerError({required this.message});
}

class DeleteIpkSksListJWTError extends DeleteIpkSksListState {
  final String message;
  DeleteIpkSksListJWTError({required this.message});
}

class DeleteIpkSksListInternetError extends DeleteIpkSksListState {
  final String message;
  DeleteIpkSksListInternetError({required this.message});
}

abstract class SubmitIpkSksListState {
  final String message;

  SubmitIpkSksListState({required this.message});
}

class SubmitIpkSksListEmpty extends SubmitIpkSksListState {
  SubmitIpkSksListEmpty({required String message}) : super(message: message);
}

class SubmitIpkSksListLoading extends SubmitIpkSksListState {
  SubmitIpkSksListLoading({required String message}) : super(message: message);
}

class SubmitIpkSksListSuccess extends SubmitIpkSksListState {
  SubmitIpkSksListSuccess({required String message}) : super(message: message);
}

class SubmitIpkSksListClientError extends SubmitIpkSksListState {
  SubmitIpkSksListClientError({required String message}) : super(message: message);
}

class SubmitIpkSksListServerError extends SubmitIpkSksListState {
  SubmitIpkSksListServerError({required String message}) : super(message: message);
}

class SubmitIpkSksListJWTError extends SubmitIpkSksListState {
  SubmitIpkSksListJWTError({required String message}) : super(message: message);
}

class SubmitIpkSksListInternetError extends SubmitIpkSksListState {
  SubmitIpkSksListInternetError({required String message}) : super(message: message);
}
