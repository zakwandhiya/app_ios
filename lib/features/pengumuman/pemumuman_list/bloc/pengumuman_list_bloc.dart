import 'dart:async';

import '../model/submit_pengumuman_list_model.dart';
import '../repository/pengumuman_list_repository.dart';
import 'pengumuman_list_state.dart';

class PengumumanListBloc {
  final PengumumanListRepository pengumumanListRepository;

  PengumumanListBloc({required this.pengumumanListRepository});

  final StreamController<GetPengumumanListState> _getPengumumanListController = StreamController<GetPengumumanListState>.broadcast();
  Stream<GetPengumumanListState> get getPengumumanListState => _getPengumumanListController.stream.asBroadcastStream();

  GetPengumumanListState get getInitialPengumumanListState => GetPengumumanListLoading();

  final StreamController<SubmitPengumumanListState> _submitPengumumanListController = StreamController<SubmitPengumumanListState>.broadcast();
  Stream<SubmitPengumumanListState> get submitPengumumanListState => _submitPengumumanListController.stream.asBroadcastStream();

  SubmitPengumumanListState get submitInitialPengumumanListState => SubmitPengumumanListLoading(message: "");

  final StreamController<DeletePengumumanListState> _deletePengumumanListController = StreamController<DeletePengumumanListState>.broadcast();
  Stream<DeletePengumumanListState> get deletePengumumanListState => _deletePengumumanListController.stream.asBroadcastStream();

  DeletePengumumanListState get deleteInitialPengumumanListState => DeletePengumumanListLoading();

  void dispose() {
    _getPengumumanListController.close();
    _submitPengumumanListController.close();
    _deletePengumumanListController.close();
  }

  Future<GetPengumumanListState> getPengumumanList() {
    _getPengumumanListController.add(GetPengumumanListLoading());
    return pengumumanListRepository.requestGetPengumumanList().then((value) {
      _getPengumumanListController.add(value);
      return value;
    });
  }

  Future<SubmitPengumumanListState> submitPengumumanList(
    SubmitPengumumanListResponseModel submitPengumumanListTmp,
  ) {
    _submitPengumumanListController.add(SubmitPengumumanListLoading(message: ""));
    return pengumumanListRepository
        .requestSubmitPengumumanList(
      submitPengumumanListTmp,
    )
        .then((value) {
      _submitPengumumanListController.add(value);
      return value;
    });
  }

  Future<DeletePengumumanListState> deletePengumumanList({
    required String id,
  }) {
    _deletePengumumanListController.add(DeletePengumumanListLoading());
    return pengumumanListRepository.requestDeletePengumumanList(id: id).then((value) {
      _deletePengumumanListController.add(value);
      return value;
    });
  }
}

