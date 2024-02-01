import '../model/delete_ipk_sks_grafik_list_model.dart';
import '../model/get_ipk_sks_grafik_list_model.dart';

abstract class GetIpkSksGrafikListState {}

class GetIpkSksGrafikListEmpty extends GetIpkSksGrafikListState {}

class GetIpkSksGrafikListLoading extends GetIpkSksGrafikListState {}

class GetIpkSksGrafikListSuccess extends GetIpkSksGrafikListState {
  final GetIpkSksGrafikListResponseModel getIpkSksGrafikListResponseModel;
  GetIpkSksGrafikListSuccess({required this.getIpkSksGrafikListResponseModel});
}

class GetIpkSksGrafikListClientError extends GetIpkSksGrafikListState {
  final String message;
  GetIpkSksGrafikListClientError({required this.message});
}

class GetIpkSksGrafikListServerError extends GetIpkSksGrafikListState {
  final String message;
  GetIpkSksGrafikListServerError({required this.message});
}

class GetIpkSksGrafikListJWTError extends GetIpkSksGrafikListState {
  final String message;
  GetIpkSksGrafikListJWTError({required this.message});
}

class GetIpkSksGrafikListInternetError extends GetIpkSksGrafikListState {
  final String message;
  GetIpkSksGrafikListInternetError({required this.message});
}

abstract class DeleteIpkSksGrafikListState {}

class DeleteIpkSksGrafikListEmpty extends DeleteIpkSksGrafikListState {}

class DeleteIpkSksGrafikListLoading extends DeleteIpkSksGrafikListState {}

class DeleteIpkSksGrafikListSuccess extends DeleteIpkSksGrafikListState {
  final DeleteIpkSksGrafikListResponseModel deleteIpkSksGrafikListResponseModel;
  DeleteIpkSksGrafikListSuccess({required this.deleteIpkSksGrafikListResponseModel});
}

class DeleteIpkSksGrafikListClientError extends DeleteIpkSksGrafikListState {
  final String message;
  DeleteIpkSksGrafikListClientError({required this.message});
}

class DeleteIpkSksGrafikListServerError extends DeleteIpkSksGrafikListState {
  final String message;
  DeleteIpkSksGrafikListServerError({required this.message});
}

class DeleteIpkSksGrafikListJWTError extends DeleteIpkSksGrafikListState {
  final String message;
  DeleteIpkSksGrafikListJWTError({required this.message});
}

class DeleteIpkSksGrafikListInternetError extends DeleteIpkSksGrafikListState {
  final String message;
  DeleteIpkSksGrafikListInternetError({required this.message});
}

abstract class SubmitIpkSksGrafikListState {
  final String message;

  SubmitIpkSksGrafikListState({required this.message});
}

class SubmitIpkSksGrafikListEmpty extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListEmpty({required String message}) : super(message: message);
}

class SubmitIpkSksGrafikListLoading extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListLoading({required String message}) : super(message: message);
}

class SubmitIpkSksGrafikListSuccess extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListSuccess({required String message}) : super(message: message);
}

class SubmitIpkSksGrafikListClientError extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListClientError({required String message}) : super(message: message);
}

class SubmitIpkSksGrafikListServerError extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListServerError({required String message}) : super(message: message);
}

class SubmitIpkSksGrafikListJWTError extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListJWTError({required String message}) : super(message: message);
}

class SubmitIpkSksGrafikListInternetError extends SubmitIpkSksGrafikListState {
  SubmitIpkSksGrafikListInternetError({required String message}) : super(message: message);
}
