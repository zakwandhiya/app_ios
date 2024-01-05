import 'dart:async';

import 'package:bimo_app/features/logbook/model/logbook_item_model.dart';

import '../model/submit_logbook_edit_model.dart';
import '../repository/logbook_edit_repository.dart';
import 'logbook_edit_state.dart';

class LogbookEditBloc {
  final LogbookEditRepository mataKuliahEditRepository;

  LogbookEditBloc({required LogbookEditRepository this.mataKuliahEditRepository});

  StreamController<AddLogbookEditState> _getLogbookEditController = StreamController<AddLogbookEditState>.broadcast();
  Stream<AddLogbookEditState> get getLogbookEditState => _getLogbookEditController.stream.asBroadcastStream();

  AddLogbookEditState get getInitialLogbookEditState => AddLogbookEditLoading(message: "");

  StreamController<UpdateLogbookEditState> _submitLogbookEditController = StreamController<UpdateLogbookEditState>.broadcast();
  Stream<UpdateLogbookEditState> get submitLogbookEditState => _submitLogbookEditController.stream.asBroadcastStream();

  UpdateLogbookEditState get submitInitialLogbookEditState => UpdateLogbookEditLoading(message: "");

  StreamController<DeleteLogbookEditState> _deleteLogbookEditController = StreamController<DeleteLogbookEditState>.broadcast();
  Stream<DeleteLogbookEditState> get deleteLogbookEditState => _deleteLogbookEditController.stream.asBroadcastStream();

  DeleteLogbookEditState get deleteInitialLogbookEditState => DeleteLogbookEditLoading();

  void dispose() {
    _getLogbookEditController.close();
    _submitLogbookEditController.close();
    _deleteLogbookEditController.close();
  }

  Future<AddLogbookEditState> addLogbookEdit(
    LogbookItemModel logbookItemModel,
  ) {
    _getLogbookEditController.add(AddLogbookEditLoading(message: ""));
    return mataKuliahEditRepository
        .requestAddLogbookEdit(
      logbookItemModel,
    )
        .then((value) {
      _getLogbookEditController.add(value);
      return value;
    });
  }

  Future<UpdateLogbookEditState> updateLogbookEdit(
    LogbookItemModel logbookItemModel,
  ) {
    _submitLogbookEditController.add(UpdateLogbookEditLoading(message: ""));
    return mataKuliahEditRepository
        .requestUpdateLogbookEdit(
      logbookItemModel,
    )
        .then((value) {
      _submitLogbookEditController.add(value);
      return value;
    });
  }

  Future<DeleteLogbookEditState> deleteLogbookEdit({
    required String id,
  }) {
    _deleteLogbookEditController.add(DeleteLogbookEditLoading());
    return mataKuliahEditRepository.requestDeleteLogbookEdit(id: id).then((value) {
      _deleteLogbookEditController.add(value);
      return value;
    });
  }
}
