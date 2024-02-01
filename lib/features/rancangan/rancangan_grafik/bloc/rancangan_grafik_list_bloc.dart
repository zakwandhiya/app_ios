import 'dart:async';

import '../model/submit_rancangan_grafik_list_model.dart';
import '../repository/rancangan_grafik_list_repository.dart';
import 'rancangan_grafik_list_state.dart';

class RancanganGrafikListBloc {
  final RancanganGrafikListRepository rancanganGrafikListRepository;

  RancanganGrafikListBloc({required this.rancanganGrafikListRepository});

  final StreamController<GetRancanganGrafikListState> _getRancanganGrafikListController = StreamController<GetRancanganGrafikListState>.broadcast();
  Stream<GetRancanganGrafikListState> get getRancanganGrafikListState => _getRancanganGrafikListController.stream.asBroadcastStream();

  GetRancanganGrafikListState get getInitialRancanganGrafikState => GetRancanganGrafikListLoading();

  final StreamController<SubmitRancanganGrafikListState> _submitRancanganGrafikListController =
      StreamController<SubmitRancanganGrafikListState>.broadcast();
  Stream<SubmitRancanganGrafikListState> get submitRancanganGrafikListState => _submitRancanganGrafikListController.stream.asBroadcastStream();

  SubmitRancanganGrafikListState get submitInitialRancanganGrafikListState => SubmitRancanganGrafikListLoading(message: "");

  final StreamController<DeleteRancanganGrafikListState> _deleteRancanganGrafikListController =
      StreamController<DeleteRancanganGrafikListState>.broadcast();
  Stream<DeleteRancanganGrafikListState> get deleteRancanganGrafikListState => _deleteRancanganGrafikListController.stream.asBroadcastStream();

  DeleteRancanganGrafikListState get deleteInitialRancanganGrafikListState => DeleteRancanganGrafikListLoading();

  void dispose() {
    _getRancanganGrafikListController.close();
    _submitRancanganGrafikListController.close();
    _deleteRancanganGrafikListController.close();
  }

  Future<GetRancanganGrafikListState> getRancanganGrafikList() {
    _getRancanganGrafikListController.add(GetRancanganGrafikListLoading());
    return rancanganGrafikListRepository.requestGetRancanganGrafikList().then((value) {
      _getRancanganGrafikListController.add(value);
      return value;
    });
  }

  Future<SubmitRancanganGrafikListState> submitRancanganGrafikList(
    SubmitRancanganGrafikListResponseModel submitRancanganGrafikListTmp,
  ) {
    _submitRancanganGrafikListController.add(SubmitRancanganGrafikListLoading(message: ""));
    return rancanganGrafikListRepository
        .requestSubmitRancanganGrafikList(
      submitRancanganGrafikListTmp,
    )
        .then((value) {
      _submitRancanganGrafikListController.add(value);
      return value;
    });
  }

  Future<DeleteRancanganGrafikListState> deleteRancanganGrafikList({
    required String id,
  }) {
    _deleteRancanganGrafikListController.add(DeleteRancanganGrafikListLoading());
    return rancanganGrafikListRepository.requestDeleteRancanganGrafikList(id: id).then((value) {
      _deleteRancanganGrafikListController.add(value);
      return value;
    });
  }
}
