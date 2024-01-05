import 'dart:async';

import '../model/submit_logbook_list_model.dart';
import '../repository/logbook_list_repository.dart';
import 'logbook_list_state.dart';

class LogbookListBloc {
  final LogbookListRepository mataKuliahListRepository;

  LogbookListBloc({required this.mataKuliahListRepository});

  final StreamController<GetLogbookListState> _getLogbookListController = StreamController<GetLogbookListState>.broadcast();
  Stream<GetLogbookListState> get getLogbookListState => _getLogbookListController.stream.asBroadcastStream();

  GetLogbookListState get getInitialLogbookListState => GetLogbookListLoading();

  final StreamController<SubmitLogbookListState> _submitLogbookListController = StreamController<SubmitLogbookListState>.broadcast();
  Stream<SubmitLogbookListState> get submitLogbookListState => _submitLogbookListController.stream.asBroadcastStream();

  SubmitLogbookListState get submitInitialLogbookListState => SubmitLogbookListLoading(message: "");

  final StreamController<DeleteLogbookListState> _deleteLogbookListController = StreamController<DeleteLogbookListState>.broadcast();
  Stream<DeleteLogbookListState> get deleteLogbookListState => _deleteLogbookListController.stream.asBroadcastStream();

  DeleteLogbookListState get deleteInitialLogbookListState => DeleteLogbookListLoading();

  void dispose() {
    _getLogbookListController.close();
    _submitLogbookListController.close();
    _deleteLogbookListController.close();
  }

  Future<GetLogbookListState> getLogbookList() {
    _getLogbookListController.add(GetLogbookListLoading());
    return mataKuliahListRepository.requestGetLogbookList().then((value) {
      _getLogbookListController.add(value);
      return value;
    });
  }

  Future<SubmitLogbookListState> submitLogbookList(
    SubmitLogbookListResponseModel submitLogbookListTmp,
  ) {
    _submitLogbookListController.add(SubmitLogbookListLoading(message: ""));
    return mataKuliahListRepository
        .requestSubmitLogbookList(
      submitLogbookListTmp,
    )
        .then((value) {
      _submitLogbookListController.add(value);
      return value;
    });
  }

  Future<DeleteLogbookListState> deleteLogbookList({
    required String id,
  }) {
    _deleteLogbookListController.add(DeleteLogbookListLoading());
    return mataKuliahListRepository.requestDeleteLogbookList(id: id).then((value) {
      _deleteLogbookListController.add(value);
      return value;
    });
  }
}
