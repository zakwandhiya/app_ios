import 'dart:async';

import '../model/submit_ipk_sks_grafik_list_model.dart';
import '../repository/ipk_sks_grafik_list_repository.dart';
import 'ipk_sks_grafik_list_state.dart';

class IpkSksGrafikListBloc {
  final IpkSksGrafikListRepository ipkSksGrafikListRepository;

  IpkSksGrafikListBloc({required this.ipkSksGrafikListRepository});

  final StreamController<GetIpkSksGrafikListState> _getIpkSksGrafikListController = StreamController<GetIpkSksGrafikListState>.broadcast();
  Stream<GetIpkSksGrafikListState> get getIpkSksGrafikListState => _getIpkSksGrafikListController.stream.asBroadcastStream();

  GetIpkSksGrafikListState get getInitialIpkSksGrafikState => GetIpkSksGrafikListLoading();

  final StreamController<SubmitIpkSksGrafikListState> _submitIpkSksGrafikListController = StreamController<SubmitIpkSksGrafikListState>.broadcast();
  Stream<SubmitIpkSksGrafikListState> get submitIpkSksGrafikListState => _submitIpkSksGrafikListController.stream.asBroadcastStream();

  SubmitIpkSksGrafikListState get submitInitialIpkSksGrafikListState => SubmitIpkSksGrafikListLoading(message: "");

  final StreamController<DeleteIpkSksGrafikListState> _deleteIpkSksGrafikListController = StreamController<DeleteIpkSksGrafikListState>.broadcast();
  Stream<DeleteIpkSksGrafikListState> get deleteIpkSksGrafikListState => _deleteIpkSksGrafikListController.stream.asBroadcastStream();

  DeleteIpkSksGrafikListState get deleteInitialIpkSksGrafikListState => DeleteIpkSksGrafikListLoading();

  void dispose() {
    _getIpkSksGrafikListController.close();
    _submitIpkSksGrafikListController.close();
    _deleteIpkSksGrafikListController.close();
  }

  Future<GetIpkSksGrafikListState> getIpkSksGrafikList() {
    _getIpkSksGrafikListController.add(GetIpkSksGrafikListLoading());
    return ipkSksGrafikListRepository.requestGetIpkSksGrafikList().then((value) {
      _getIpkSksGrafikListController.add(value);
      return value;
    });
  }

  Future<SubmitIpkSksGrafikListState> submitIpkSksGrafikList(
    SubmitIpkSksGrafikListResponseModel submitIpkSksGrafikListTmp,
  ) {
    _submitIpkSksGrafikListController.add(SubmitIpkSksGrafikListLoading(message: ""));
    return ipkSksGrafikListRepository
        .requestSubmitIpkSksGrafikList(
      submitIpkSksGrafikListTmp,
    )
        .then((value) {
      _submitIpkSksGrafikListController.add(value);
      return value;
    });
  }

  Future<DeleteIpkSksGrafikListState> deleteIpkSksGrafikList({
    required String id,
  }) {
    _deleteIpkSksGrafikListController.add(DeleteIpkSksGrafikListLoading());
    return ipkSksGrafikListRepository.requestDeleteIpkSksGrafikList(id: id).then((value) {
      _deleteIpkSksGrafikListController.add(value);
      return value;
    });
  }
}
