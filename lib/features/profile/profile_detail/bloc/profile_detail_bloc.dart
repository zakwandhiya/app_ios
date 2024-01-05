import 'dart:async';

import '../repository/profile_detail_repository.dart';
import 'profile_detail_state.dart';

class ProfileDetailBloc {
  final ProfileDetailRepository profileDetailRepository;

  ProfileDetailBloc({required this.profileDetailRepository});

  final StreamController<GetProfileDetailState> _getProfileDetailController = StreamController<GetProfileDetailState>.broadcast();
  Stream<GetProfileDetailState> get getProfileDetailState => _getProfileDetailController.stream.asBroadcastStream();

  GetProfileDetailState get getInitialProfileDetailState => GetProfileDetailLoading();

  final StreamController<SubmitProfileDetailState> _submitProfileDetailController = StreamController<SubmitProfileDetailState>.broadcast();
  Stream<SubmitProfileDetailState> get submitProfileDetailState => _submitProfileDetailController.stream.asBroadcastStream();

  SubmitProfileDetailState get submitInitialProfileDetailState => SubmitProfileDetailLoading();

  final StreamController<DeleteProfileDetailState> _deleteProfileDetailController = StreamController<DeleteProfileDetailState>.broadcast();
  Stream<DeleteProfileDetailState> get deleteProfileDetailState => _deleteProfileDetailController.stream.asBroadcastStream();

  DeleteProfileDetailState get deleteInitialProfileDetailState => DeleteProfileDetailLoading();

  void dispose() {
    _getProfileDetailController.close();
    _submitProfileDetailController.close();
    _deleteProfileDetailController.close();
  }

  Future<GetProfileDetailState> getProfileDetail() {
    _getProfileDetailController.add(GetProfileDetailLoading());
    return profileDetailRepository.requestGetProfileDetail().then((value) {
      _getProfileDetailController.add(value);
      return value;
    });
  }

  Future<SubmitProfileDetailState> submitProfileDetail({
    required String id,
    required String value1,
    required String value2,
    required String value3,
  }) {
    _submitProfileDetailController.add(SubmitProfileDetailLoading());
    return profileDetailRepository
        .requestSubmitProfileDetail(
      id: id,
      value1: value1,
      value2: value2,
      value3: value3,
    )
        .then((value) {
      _submitProfileDetailController.add(value);
      return value;
    });
  }

  Future<DeleteProfileDetailState> deleteProfileDetail({
    required String id,
  }) {
    _deleteProfileDetailController.add(DeleteProfileDetailLoading());
    return profileDetailRepository.requestDeleteProfileDetail(id: id).then((value) {
      _deleteProfileDetailController.add(value);
      return value;
    });
  }
}
