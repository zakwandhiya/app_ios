import 'dart:async';

import 'package:bimo_app/features/milestone/milestone_detail/model/submit_milestone_detail_model.dart';

import '../repository/milestone_detail_repository.dart';
import 'milestone_detail_state.dart';

class MilestoneDetailBloc {
  final MilestoneDetailRepository milestoneDetailRepository;

  MilestoneDetailBloc({required this.milestoneDetailRepository});

  final StreamController<GetMilestoneDetailState> _getMilestoneDetailController = StreamController<GetMilestoneDetailState>.broadcast();
  Stream<GetMilestoneDetailState> get getMilestoneDetailState => _getMilestoneDetailController.stream.asBroadcastStream();

  GetMilestoneDetailState get getInitialMilestoneDetailState => GetMilestoneDetailLoading();

  final StreamController<SubmitMilestoneDetailState> _submitMilestoneDetailController = StreamController<SubmitMilestoneDetailState>.broadcast();
  Stream<SubmitMilestoneDetailState> get submitMilestoneDetailState => _submitMilestoneDetailController.stream.asBroadcastStream();

  SubmitMilestoneDetailState get submitInitialMilestoneDetailState => SubmitMilestoneDetailLoading(message: "");

  final StreamController<DeleteMilestoneDetailState> _deleteMilestoneDetailController = StreamController<DeleteMilestoneDetailState>.broadcast();
  Stream<DeleteMilestoneDetailState> get deleteMilestoneDetailState => _deleteMilestoneDetailController.stream.asBroadcastStream();

  DeleteMilestoneDetailState get deleteInitialMilestoneDetailState => DeleteMilestoneDetailLoading();

  void dispose() {
    _getMilestoneDetailController.close();
    _submitMilestoneDetailController.close();
    _deleteMilestoneDetailController.close();
  }

  Future<GetMilestoneDetailState> getMilestoneDetail() {
    _getMilestoneDetailController.add(GetMilestoneDetailLoading());
    return milestoneDetailRepository.requestGetMilestoneDetail().then((value) {
      _getMilestoneDetailController.add(value);
      return value;
    });
  }

  Future<SubmitMilestoneDetailState> submitMilestoneDetail(
    SubmitMilestoneDetailResponseModel submitMilestoneDetailTmp,
  ) {
    _submitMilestoneDetailController.add(SubmitMilestoneDetailLoading(message: ""));
    return milestoneDetailRepository
        .requestSubmitMilestoneDetail(
      submitMilestoneDetailTmp,
    )
        .then((value) {
      _submitMilestoneDetailController.add(value);
      return value;
    });
  }

  Future<DeleteMilestoneDetailState> deleteMilestoneDetail({
    required String id,
  }) {
    _deleteMilestoneDetailController.add(DeleteMilestoneDetailLoading());
    return milestoneDetailRepository.requestDeleteMilestoneDetail(id: id).then((value) {
      _deleteMilestoneDetailController.add(value);
      return value;
    });
  }
}
