import '../model/delete_rancangan_grafik_list_model.dart';
import '../model/get_rancangan_grafik_list_model.dart';

abstract class GetRancanganGrafikListState {}

class GetRancanganGrafikListEmpty extends GetRancanganGrafikListState {}

class GetRancanganGrafikListLoading extends GetRancanganGrafikListState {}

class GetRancanganGrafikListSuccess extends GetRancanganGrafikListState {
  final GetRancanganGrafikListResponseModel getRancanganGrafikListResponseModel;
  GetRancanganGrafikListSuccess({required this.getRancanganGrafikListResponseModel});
}

class GetRancanganGrafikListClientError extends GetRancanganGrafikListState {
  final String message;
  GetRancanganGrafikListClientError({required this.message});
}

class GetRancanganGrafikListServerError extends GetRancanganGrafikListState {
  final String message;
  GetRancanganGrafikListServerError({required this.message});
}

class GetRancanganGrafikListJWTError extends GetRancanganGrafikListState {
  final String message;
  GetRancanganGrafikListJWTError({required this.message});
}

class GetRancanganGrafikListInternetError extends GetRancanganGrafikListState {
  final String message;
  GetRancanganGrafikListInternetError({required this.message});
}

abstract class DeleteRancanganGrafikListState {}

class DeleteRancanganGrafikListEmpty extends DeleteRancanganGrafikListState {}

class DeleteRancanganGrafikListLoading extends DeleteRancanganGrafikListState {}

class DeleteRancanganGrafikListSuccess extends DeleteRancanganGrafikListState {
  final DeleteRancanganGrafikListResponseModel deleteRancanganGrafikListResponseModel;
  DeleteRancanganGrafikListSuccess({required this.deleteRancanganGrafikListResponseModel});
}

class DeleteRancanganGrafikListClientError extends DeleteRancanganGrafikListState {
  final String message;
  DeleteRancanganGrafikListClientError({required this.message});
}

class DeleteRancanganGrafikListServerError extends DeleteRancanganGrafikListState {
  final String message;
  DeleteRancanganGrafikListServerError({required this.message});
}

class DeleteRancanganGrafikListJWTError extends DeleteRancanganGrafikListState {
  final String message;
  DeleteRancanganGrafikListJWTError({required this.message});
}

class DeleteRancanganGrafikListInternetError extends DeleteRancanganGrafikListState {
  final String message;
  DeleteRancanganGrafikListInternetError({required this.message});
}

abstract class SubmitRancanganGrafikListState {
  final String message;

  SubmitRancanganGrafikListState({required this.message});
}

class SubmitRancanganGrafikListEmpty extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListEmpty({required String message}) : super(message: message);
}

class SubmitRancanganGrafikListLoading extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListLoading({required String message}) : super(message: message);
}

class SubmitRancanganGrafikListSuccess extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListSuccess({required String message}) : super(message: message);
}

class SubmitRancanganGrafikListClientError extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListClientError({required String message}) : super(message: message);
}

class SubmitRancanganGrafikListServerError extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListServerError({required String message}) : super(message: message);
}

class SubmitRancanganGrafikListJWTError extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListJWTError({required String message}) : super(message: message);
}

class SubmitRancanganGrafikListInternetError extends SubmitRancanganGrafikListState {
  SubmitRancanganGrafikListInternetError({required String message}) : super(message: message);
}
