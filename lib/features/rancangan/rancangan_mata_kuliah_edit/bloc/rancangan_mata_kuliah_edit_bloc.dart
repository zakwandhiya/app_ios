import 'dart:async';

import '../model/submit_mata_kuliah_edit_model.dart';
import '../repository/rancangan_mata_kuliah_edit_repository.dart';
import 'rancangan_mata_kuliah_edit_state.dart';

class MataKuliahEditBloc {
  final MataKuliahEditRepository mataKuliahEditRepository;

  MataKuliahEditBloc({required MataKuliahEditRepository this.mataKuliahEditRepository});

  StreamController<GetMataKuliahEditState> _getMataKuliahEditController = StreamController<GetMataKuliahEditState>.broadcast();
  Stream<GetMataKuliahEditState> get getMataKuliahEditState => _getMataKuliahEditController.stream.asBroadcastStream();

  GetMataKuliahEditState get getInitialMataKuliahEditState => GetMataKuliahEditLoading();

  StreamController<SubmitMataKuliahEditState> _submitMataKuliahEditController = StreamController<SubmitMataKuliahEditState>.broadcast();
  Stream<SubmitMataKuliahEditState> get submitMataKuliahEditState => _submitMataKuliahEditController.stream.asBroadcastStream();

  SubmitMataKuliahEditState get submitInitialMataKuliahEditState => SubmitMataKuliahEditLoading(message: "");

  StreamController<DeleteMataKuliahEditState> _deleteMataKuliahEditController = StreamController<DeleteMataKuliahEditState>.broadcast();
  Stream<DeleteMataKuliahEditState> get deleteMataKuliahEditState => _deleteMataKuliahEditController.stream.asBroadcastStream();

  DeleteMataKuliahEditState get deleteInitialMataKuliahEditState => DeleteMataKuliahEditLoading();

  void dispose() {
    _getMataKuliahEditController.close();
    _submitMataKuliahEditController.close();
    _deleteMataKuliahEditController.close();
  }

  Future<GetMataKuliahEditState> getMataKuliahEdit() {
    _getMataKuliahEditController.add(GetMataKuliahEditLoading());
    return mataKuliahEditRepository.requestGetMataKuliahEdit().then((value) {
      _getMataKuliahEditController.add(value);
      return value;
    });
  }

  Future<SubmitMataKuliahEditState> submitMataKuliahEdit(
    SubmitMataKuliahEditResponseModel submitMataKuliahEditTmp,
  ) {
    _submitMataKuliahEditController.add(SubmitMataKuliahEditLoading(message: ""));
    return mataKuliahEditRepository
        .requestSubmitMataKuliahEdit(
      submitMataKuliahEditTmp,
    )
        .then((value) {
      _submitMataKuliahEditController.add(value);
      return value;
    });
  }

  Future<DeleteMataKuliahEditState> deleteMataKuliahEdit({
    required String id,
  }) {
    _deleteMataKuliahEditController.add(DeleteMataKuliahEditLoading());
    return mataKuliahEditRepository.requestDeleteMataKuliahEdit(id: id).then((value) {
      _deleteMataKuliahEditController.add(value);
      return value;
    });
  }
}
