import 'dart:async';

import '../model/submit_gedung_list_model.dart';
import '../repository/gedung_list_repository.dart';
import 'gedung_list_state.dart';

class GedungListBloc {
  final GedungListRepository gedungListRepository;

  GedungListBloc({required this.gedungListRepository});

  final StreamController<GetGedungListState> _getGedungListController = StreamController<GetGedungListState>.broadcast();
  Stream<GetGedungListState> get getGedungListState => _getGedungListController.stream.asBroadcastStream();

  GetGedungListState get getInitialGedungState => GetGedungListLoading();

  final StreamController<SubmitGedungListState> _submitGedungListController = StreamController<SubmitGedungListState>.broadcast();
  Stream<SubmitGedungListState> get submitGedungListState => _submitGedungListController.stream.asBroadcastStream();

  SubmitGedungListState get submitInitialGedungListState => SubmitGedungListLoading(message: "");

  final StreamController<DeleteGedungListState> _deleteGedungListController = StreamController<DeleteGedungListState>.broadcast();
  Stream<DeleteGedungListState> get deleteGedungListState => _deleteGedungListController.stream.asBroadcastStream();

  DeleteGedungListState get deleteInitialGedungListState => DeleteGedungListLoading();

  void dispose() {
    _getGedungListController.close();
    _submitGedungListController.close();
    _deleteGedungListController.close();
  }

  Future<GetGedungListState> getGedungList() {
    _getGedungListController.add(GetGedungListLoading());
    return gedungListRepository.requestGetGedungList().then((value) {
      _getGedungListController.add(value);
      return value;
    });
  }

  Future<SubmitGedungListState> submitGedungList(
    SubmitGedungListResponseModel submitGedungListTmp,
  ) {
    _submitGedungListController.add(SubmitGedungListLoading(message: ""));
    return gedungListRepository
        .requestSubmitGedungList(
      submitGedungListTmp,
    )
        .then((value) {
      _submitGedungListController.add(value);
      return value;
    });
  }

  Future<DeleteGedungListState> deleteGedungList({
    required String id,
  }) {
    _deleteGedungListController.add(DeleteGedungListLoading());
    return gedungListRepository.requestDeleteGedungList(id: id).then((value) {
      _deleteGedungListController.add(value);
      return value;
    });
  }
}
