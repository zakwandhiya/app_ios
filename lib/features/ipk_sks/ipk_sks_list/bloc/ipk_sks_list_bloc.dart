import 'dart:async';

import '../model/submit_ipk_sks_list_model.dart';
import '../repository/ipk_sks_list_repository.dart';
import 'ipk_sks_list_state.dart';

class IpkSksListBloc {
  final IpkSksListRepository ipkSksListRepository;

  IpkSksListBloc({required this.ipkSksListRepository});

  final StreamController<GetIpkSksListState> _getIpkSksListController = StreamController<GetIpkSksListState>.broadcast();
  Stream<GetIpkSksListState> get getIpkSksListState => _getIpkSksListController.stream.asBroadcastStream();

  GetIpkSksListState get getInitialIpkSksState => GetIpkSksListLoading();

  final StreamController<SubmitIpkSksListState> _submitIpkSksListController = StreamController<SubmitIpkSksListState>.broadcast();
  Stream<SubmitIpkSksListState> get submitIpkSksListState => _submitIpkSksListController.stream.asBroadcastStream();

  SubmitIpkSksListState get submitInitialIpkSksListState => SubmitIpkSksListLoading(message: "");

  final StreamController<DeleteIpkSksListState> _deleteIpkSksListController = StreamController<DeleteIpkSksListState>.broadcast();
  Stream<DeleteIpkSksListState> get deleteIpkSksListState => _deleteIpkSksListController.stream.asBroadcastStream();

  DeleteIpkSksListState get deleteInitialIpkSksListState => DeleteIpkSksListLoading();

  void dispose() {
    _getIpkSksListController.close();
    _submitIpkSksListController.close();
    _deleteIpkSksListController.close();
  }

  Future<GetIpkSksListState> getIpkSksList() {
    _getIpkSksListController.add(GetIpkSksListLoading());
    return ipkSksListRepository.requestGetIpkSksList().then((value) {
      _getIpkSksListController.add(value);
      return value;
    });
  }

  Future<SubmitIpkSksListState> submitIpkSksList(
    SubmitIpkSksListResponseModel submitIpkSksListTmp,
  ) {
    _submitIpkSksListController.add(SubmitIpkSksListLoading(message: ""));
    return ipkSksListRepository
        .requestSubmitIpkSksList(
      submitIpkSksListTmp,
    )
        .then((value) {
      _submitIpkSksListController.add(value);
      return value;
    });
  }

  Future<DeleteIpkSksListState> deleteIpkSksList({
    required String id,
  }) {
    _deleteIpkSksListController.add(DeleteIpkSksListLoading());
    return ipkSksListRepository.requestDeleteIpkSksList(id: id).then((value) {
      _deleteIpkSksListController.add(value);
      return value;
    });
  }
}
