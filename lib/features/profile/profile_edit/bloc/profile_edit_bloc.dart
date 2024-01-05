import 'dart:async';

import 'package:bimo_app/features/profile/profile_detail/model/get_profile_detail_model.dart';

import '../repository/profile_edit_repository.dart';
import 'profile_edit_state.dart';

class ProfileEditBloc {
  final ProfileEditRepository profileEditRepository;

  ProfileEditBloc({required this.profileEditRepository});

  final StreamController<GetProfileEditState> _getProfileEditController = StreamController<GetProfileEditState>.broadcast();
  Stream<GetProfileEditState> get getProfileEditState => _getProfileEditController.stream.asBroadcastStream();

  GetProfileEditState get getInitialProfileEditState => GetProfileEditLoading();

  final StreamController<SubmitProfileEditState> _submitProfileEditController = StreamController<SubmitProfileEditState>.broadcast();
  Stream<SubmitProfileEditState> get submitProfileEditState => _submitProfileEditController.stream.asBroadcastStream();

  SubmitProfileEditState get submitInitialProfileEditState => SubmitProfileEditLoading(message: "");

  final StreamController<DeleteProfileEditState> _deleteProfileEditController = StreamController<DeleteProfileEditState>.broadcast();
  Stream<DeleteProfileEditState> get deleteProfileEditState => _deleteProfileEditController.stream.asBroadcastStream();

  DeleteProfileEditState get deleteInitialProfileEditState => DeleteProfileEditLoading();

  void dispose() {
    _getProfileEditController.close();
    _submitProfileEditController.close();
    _deleteProfileEditController.close();
  }

  Future<GetProfileEditState> getProfileEdit() {
    _getProfileEditController.add(GetProfileEditLoading());
    return profileEditRepository.requestGetProfileEdit().then((value) {
      _getProfileEditController.add(value);
      return value;
    });
  }

  Future<SubmitProfileEditState> submitProfileEdit(GetProfileDetailResponseModel getProfileDetailResponseModel) {
    _submitProfileEditController.add(SubmitProfileEditLoading(message: ""));
    return profileEditRepository.requestSubmitProfileEdit(getProfileDetailResponseModel).then((value) {
      _submitProfileEditController.add(value);
      return value;
    });
  }

  Future<DeleteProfileEditState> deleteProfileEdit({
    required String id,
  }) {
    _deleteProfileEditController.add(DeleteProfileEditLoading());
    return profileEditRepository.requestDeleteProfileEdit(id: id).then((value) {
      _deleteProfileEditController.add(value);
      return value;
    });
  }
}
