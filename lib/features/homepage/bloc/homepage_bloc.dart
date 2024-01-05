import 'dart:async';

import '../repository/homepage_repository.dart';
import 'homepage_state.dart';

class HomepageBloc {
  final HomepageRepository homepageRepository;

  HomepageBloc({required this.homepageRepository});

  final StreamController<GetHomepageState> _getHomepageController = StreamController<GetHomepageState>.broadcast();
  Stream<GetHomepageState> get getHomepageState => _getHomepageController.stream.asBroadcastStream();

  GetHomepageState get getInitialHomepageState => GetHomepageLoading();

  final StreamController<SubmitHomepageState> _submitHomepageController = StreamController<SubmitHomepageState>.broadcast();
  Stream<SubmitHomepageState> get submitHomepageState => _submitHomepageController.stream.asBroadcastStream();

  SubmitHomepageState get submitInitialHomepageState => SubmitHomepageLoading();

  final StreamController<DeleteHomepageState> _deleteHomepageController = StreamController<DeleteHomepageState>.broadcast();
  Stream<DeleteHomepageState> get deleteHomepageState => _deleteHomepageController.stream.asBroadcastStream();

  DeleteHomepageState get deleteInitialHomepageState => DeleteHomepageLoading();

  void dispose() {
    _getHomepageController.close();
    _submitHomepageController.close();
    _deleteHomepageController.close();
  }

  Future<GetHomepageState> getHomepage() {
    _getHomepageController.add(GetHomepageLoading());
    return homepageRepository.requestGetHomepage().then((value) {
      _getHomepageController.add(value);
      return value;
    });
  }

  Future<SubmitHomepageState> submitHomepage({
    required String id,
    required String value1,
    required String value2,
    required String value3,
  }) {
    _submitHomepageController.add(SubmitHomepageLoading());
    return homepageRepository
        .requestSubmitHomepage(
      id: id,
      value1: value1,
      value2: value2,
      value3: value3,
    )
        .then((value) {
      _submitHomepageController.add(value);
      return value;
    });
  }

  Future<DeleteHomepageState> deleteHomepage({
    required String id,
  }) {
    _deleteHomepageController.add(DeleteHomepageLoading());
    return homepageRepository.requestDeleteHomepage(id: id).then((value) {
      _deleteHomepageController.add(value);
      return value;
    });
  }
}
