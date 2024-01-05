import 'dart:async';

import 'package:bimo_app/features/milestone/milestone_detail/model/get_milestone_detail_model.dart';

import '../repository/milestone_edit_repository.dart';
import 'milestone_edit_state.dart';

class MilestoneEditBloc {
  final MilestoneEditRepository milestoneEditRepository;

  MilestoneEditBloc({required this.milestoneEditRepository});

  final StreamController<GetMilestoneEditState> _getMilestoneEditController = StreamController<GetMilestoneEditState>.broadcast();
  Stream<GetMilestoneEditState> get getMilestoneEditState => _getMilestoneEditController.stream.asBroadcastStream();

  GetMilestoneEditState get getInitialMilestoneEditState => GetMilestoneEditLoading();

  final StreamController<SubmitMilestoneEditState> _submitMilestoneEditController = StreamController<SubmitMilestoneEditState>.broadcast();
  Stream<SubmitMilestoneEditState> get submitMilestoneEditState => _submitMilestoneEditController.stream.asBroadcastStream();

  SubmitMilestoneEditState get submitInitialMilestoneEditState => SubmitMilestoneEditLoading(message: "");

  final StreamController<DeleteMilestoneEditState> _deleteMilestoneEditController = StreamController<DeleteMilestoneEditState>.broadcast();
  Stream<DeleteMilestoneEditState> get deleteMilestoneEditState => _deleteMilestoneEditController.stream.asBroadcastStream();

  DeleteMilestoneEditState get deleteInitialMilestoneEditState => DeleteMilestoneEditLoading();

  void dispose() {
    _getMilestoneEditController.close();
    _submitMilestoneEditController.close();
    _deleteMilestoneEditController.close();
  }

  Future<GetMilestoneEditState> getMilestoneEdit() {
    _getMilestoneEditController.add(GetMilestoneEditLoading());
    return milestoneEditRepository.requestGetMilestoneEdit().then((value) {
      _getMilestoneEditController.add(value);
      return value;
    });
  }

  Future<SubmitMilestoneEditState> submitMilestoneEdit(
    GetMilestoneDetailResponseModel submitMilestoneEditTmp,
  ) {
    _submitMilestoneEditController.add(SubmitMilestoneEditLoading(message: ""));
    return milestoneEditRepository
        .requestSubmitMilestoneEdit(
      submitMilestoneEditTmp,
    )
        .then((value) {
      _submitMilestoneEditController.add(value);
      return value;
    });
  }

  Future<DeleteMilestoneEditState> deleteMilestoneEdit({
    required String id,
  }) {
    _deleteMilestoneEditController.add(DeleteMilestoneEditLoading());
    return milestoneEditRepository.requestDeleteMilestoneEdit(id: id).then((value) {
      _deleteMilestoneEditController.add(value);
      return value;
    });
  }
}
