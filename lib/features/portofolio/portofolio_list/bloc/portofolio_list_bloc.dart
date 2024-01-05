import 'dart:async';

import '../model/submit_portofolio_list_model.dart';
import '../repository/portofolio_list_repository.dart';
import 'portofolio_list_state.dart';

class PortofolioListBloc {
  final PortofolioListRepository portofolioListRepository;

  PortofolioListBloc({required this.portofolioListRepository});

  final StreamController<GetPortofolioListState> _getPortofolioListController = StreamController<GetPortofolioListState>.broadcast();
  Stream<GetPortofolioListState> get getPortofolioListState => _getPortofolioListController.stream.asBroadcastStream();

  GetPortofolioListState get getInitialPortofolioListState => GetPortofolioListLoading();

  final StreamController<SubmitPortofolioListState> _submitPortofolioListController = StreamController<SubmitPortofolioListState>.broadcast();
  Stream<SubmitPortofolioListState> get submitPortofolioListState => _submitPortofolioListController.stream.asBroadcastStream();

  SubmitPortofolioListState get submitInitialPortofolioListState => SubmitPortofolioListLoading(message: "");

  final StreamController<DeletePortofolioListState> _deletePortofolioListController = StreamController<DeletePortofolioListState>.broadcast();
  Stream<DeletePortofolioListState> get deletePortofolioListState => _deletePortofolioListController.stream.asBroadcastStream();

  DeletePortofolioListState get deleteInitialPortofolioListState => DeletePortofolioListLoading();

  void dispose() {
    _getPortofolioListController.close();
    _submitPortofolioListController.close();
    _deletePortofolioListController.close();
  }

  Future<GetPortofolioListState> getPortofolioList() {
    _getPortofolioListController.add(GetPortofolioListLoading());
    return portofolioListRepository.requestGetPortofolioList().then((value) {
      _getPortofolioListController.add(value);
      return value;
    });
  }

  Future<SubmitPortofolioListState> submitPortofolioList(
    SubmitPortofolioListResponseModel submitPortofolioListTmp,
  ) {
    _submitPortofolioListController.add(SubmitPortofolioListLoading(message: ""));
    return portofolioListRepository
        .requestSubmitPortofolioList(
      submitPortofolioListTmp,
    )
        .then((value) {
      _submitPortofolioListController.add(value);
      return value;
    });
  }

  Future<DeletePortofolioListState> deletePortofolioList({
    required String id,
  }) {
    _deletePortofolioListController.add(DeletePortofolioListLoading());
    return portofolioListRepository.requestDeletePortofolioList(id: id).then((value) {
      _deletePortofolioListController.add(value);
      return value;
    });
  }
}
