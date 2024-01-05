import '../model/delete_portofolio_list_model.dart';
import '../model/get_portofolio_list_model.dart';

abstract class GetPortofolioListState {}

class GetPortofolioListEmpty extends GetPortofolioListState {}

class GetPortofolioListLoading extends GetPortofolioListState {}

class GetPortofolioListSuccess extends GetPortofolioListState {
  final GetPortofolioListResponseModel getPortofolioListResponseModel;
  GetPortofolioListSuccess({required this.getPortofolioListResponseModel});
}

class GetPortofolioListClientError extends GetPortofolioListState {
  final String message;
  GetPortofolioListClientError({required this.message});
}

class GetPortofolioListServerError extends GetPortofolioListState {
  final String message;
  GetPortofolioListServerError({required this.message});
}

class GetPortofolioListJWTError extends GetPortofolioListState {
  final String message;
  GetPortofolioListJWTError({required this.message});
}

class GetPortofolioListInternetError extends GetPortofolioListState {
  final String message;
  GetPortofolioListInternetError({required this.message});
}

abstract class DeletePortofolioListState {}

class DeletePortofolioListEmpty extends DeletePortofolioListState {}

class DeletePortofolioListLoading extends DeletePortofolioListState {}

class DeletePortofolioListSuccess extends DeletePortofolioListState {
  final DeletePortofolioListResponseModel deletePortofolioListResponseModel;
  DeletePortofolioListSuccess({required this.deletePortofolioListResponseModel});
}

class DeletePortofolioListClientError extends DeletePortofolioListState {
  final String message;
  DeletePortofolioListClientError({required this.message});
}

class DeletePortofolioListServerError extends DeletePortofolioListState {
  final String message;
  DeletePortofolioListServerError({required this.message});
}

class DeletePortofolioListJWTError extends DeletePortofolioListState {
  final String message;
  DeletePortofolioListJWTError({required this.message});
}

class DeletePortofolioListInternetError extends DeletePortofolioListState {
  final String message;
  DeletePortofolioListInternetError({required this.message});
}

abstract class SubmitPortofolioListState {
  final String message;

  SubmitPortofolioListState({required this.message});
}

class SubmitPortofolioListEmpty extends SubmitPortofolioListState {
  SubmitPortofolioListEmpty({required String message}) : super(message: message);
}

class SubmitPortofolioListLoading extends SubmitPortofolioListState {
  SubmitPortofolioListLoading({required String message}) : super(message: message);
}

class SubmitPortofolioListSuccess extends SubmitPortofolioListState {
  SubmitPortofolioListSuccess({required String message}) : super(message: message);
}

class SubmitPortofolioListClientError extends SubmitPortofolioListState {
  SubmitPortofolioListClientError({required String message}) : super(message: message);
}

class SubmitPortofolioListServerError extends SubmitPortofolioListState {
  SubmitPortofolioListServerError({required String message}) : super(message: message);
}

class SubmitPortofolioListJWTError extends SubmitPortofolioListState {
  SubmitPortofolioListJWTError({required String message}) : super(message: message);
}

class SubmitPortofolioListInternetError extends SubmitPortofolioListState {
  SubmitPortofolioListInternetError({required String message}) : super(message: message);
}
