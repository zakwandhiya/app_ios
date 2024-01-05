import 'dart:async';

import '../model/submit_mata_kuliah_list_model.dart';
import '../repository/rancangan_mata_kuliah_list_repository.dart';
import 'rancangan_mata_kuliah_list_state.dart';

class MataKuliahListBloc {
  final MataKuliahListRepository mataKuliahListRepository;

  MataKuliahListBloc({required this.mataKuliahListRepository});

  final StreamController<GetMataKuliahListState> _getMataKuliahListController = StreamController<GetMataKuliahListState>.broadcast();
  Stream<GetMataKuliahListState> get getMataKuliahListState => _getMataKuliahListController.stream.asBroadcastStream();

  GetMataKuliahListState get getInitialMataKuliahListState => GetMataKuliahListLoading();

  final StreamController<SubmitMataKuliahListState> _submitMataKuliahListController = StreamController<SubmitMataKuliahListState>.broadcast();
  Stream<SubmitMataKuliahListState> get submitMataKuliahListState => _submitMataKuliahListController.stream.asBroadcastStream();

  SubmitMataKuliahListState get submitInitialMataKuliahListState => SubmitMataKuliahListLoading(message: "");

  final StreamController<DeleteMataKuliahListState> _deleteMataKuliahListController = StreamController<DeleteMataKuliahListState>.broadcast();
  Stream<DeleteMataKuliahListState> get deleteMataKuliahListState => _deleteMataKuliahListController.stream.asBroadcastStream();

  DeleteMataKuliahListState get deleteInitialMataKuliahListState => DeleteMataKuliahListLoading();

  void dispose() {
    _getMataKuliahListController.close();
    _submitMataKuliahListController.close();
    _deleteMataKuliahListController.close();
  }

  Future<GetMataKuliahListState> getMataKuliahList() {
    _getMataKuliahListController.add(GetMataKuliahListLoading());
    return mataKuliahListRepository.requestGetMataKuliahList().then((value) {
      _getMataKuliahListController.add(value);
      return value;
    });
  }

  Future<SubmitMataKuliahListState> submitMataKuliahList(
    SubmitMataKuliahListResponseModel submitMataKuliahListTmp,
  ) {
    _submitMataKuliahListController.add(SubmitMataKuliahListLoading(message: ""));
    return mataKuliahListRepository
        .requestSubmitMataKuliahList(
      submitMataKuliahListTmp,
    )
        .then((value) {
      _submitMataKuliahListController.add(value);
      return value;
    });
  }

  Future<DeleteMataKuliahListState> deleteMataKuliahList({
    required String id,
  }) {
    _deleteMataKuliahListController.add(DeleteMataKuliahListLoading());
    return mataKuliahListRepository.requestDeleteMataKuliahList(id: id).then((value) {
      _deleteMataKuliahListController.add(value);
      return value;
    });
  }
}
