import 'dart:async';

import '../repository/login_repository.dart';
import 'login_state.dart';

class LoginBloc {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository});

  final StreamController<GetLoginState> _getLoginController = StreamController<GetLoginState>.broadcast();
  Stream<GetLoginState> get getLoginState => _getLoginController.stream.asBroadcastStream();

  GetLoginState get getInitialLoginState => GetLoginLoading();

  final StreamController<SubmitLoginState> _submitLoginController = StreamController<SubmitLoginState>.broadcast();
  Stream<SubmitLoginState> get submitLoginState => _submitLoginController.stream.asBroadcastStream();

  SubmitLoginState get submitInitialLoginState => SubmitLoginEmpty();

  final StreamController<DeleteLoginState> _deleteLoginController = StreamController<DeleteLoginState>.broadcast();
  Stream<DeleteLoginState> get deleteLoginState => _deleteLoginController.stream.asBroadcastStream();

  DeleteLoginState get deleteInitialLoginState => DeleteLoginLoading();

  void dispose() {
    _getLoginController.close();
    _submitLoginController.close();
    _deleteLoginController.close();
  }

  Future<GetLoginState> getLogin({
    required String id,
  }) {
    _getLoginController.add(GetLoginLoading());
    return loginRepository.requestGetLogin(id: id).then((value) {
      _getLoginController.add(value);
      return value;
    });
  }

  Future<SubmitLoginState> submitLogin({
    required String username,
    required String password,
  }) {
    _submitLoginController.add(SubmitLoginLoading());
    return loginRepository
        .requestSubmitLogin(
      username: username,
      password: password,
    )
        .then((value) {
      _submitLoginController.add(value);
      return value;
    });
  }

  Future<DeleteLoginState> deleteLogin({
    required String id,
  }) {
    _deleteLoginController.add(DeleteLoginLoading());
    return loginRepository.requestDeleteLogin(id: id).then((value) {
      _deleteLoginController.add(value);
      return value;
    });
  }
}
