import 'dart:async';

import 'package:bimo_app/features/portofolio/model/portofolio_item_model.dart';

import '../repository/portofolio_edit_repository.dart';
import 'portofolio_edit_state.dart';

class PortofolioEditBloc {
  final PortofolioEditRepository portofolioEditRepository;

  PortofolioEditBloc({required PortofolioEditRepository this.portofolioEditRepository});

  StreamController<AddPortofolioEditState> _getPortofolioEditController = StreamController<AddPortofolioEditState>.broadcast();
  Stream<AddPortofolioEditState> get getPortofolioEditState => _getPortofolioEditController.stream.asBroadcastStream();

  AddPortofolioEditState get getInitialPortofolioEditState => AddPortofolioEditLoading(message: "");

  StreamController<UpdatePortofolioEditState> _submitPortofolioEditController = StreamController<UpdatePortofolioEditState>.broadcast();
  Stream<UpdatePortofolioEditState> get submitPortofolioEditState => _submitPortofolioEditController.stream.asBroadcastStream();

  UpdatePortofolioEditState get submitInitialPortofolioEditState => UpdatePortofolioEditLoading(message: "");

  StreamController<DeletePortofolioEditState> _deletePortofolioEditController = StreamController<DeletePortofolioEditState>.broadcast();
  Stream<DeletePortofolioEditState> get deletePortofolioEditState => _deletePortofolioEditController.stream.asBroadcastStream();

  DeletePortofolioEditState get deleteInitialPortofolioEditState => DeletePortofolioEditLoading();

  void dispose() {
    _getPortofolioEditController.close();
    _submitPortofolioEditController.close();
    _deletePortofolioEditController.close();
  }

  Future<AddPortofolioEditState> addPortofolioEdit(
    PortofolioItemModel portofolioItemModel,
  ) {
    _getPortofolioEditController.add(AddPortofolioEditLoading(message: ""));
    return portofolioEditRepository
        .requestAddPortofolioEdit(
      portofolioItemModel,
    )
        .then((value) {
      _getPortofolioEditController.add(value);
      return value;
    });
  }

  Future<UpdatePortofolioEditState> updatePortofolioEdit(
    PortofolioItemModel portofolioItemModel,
  ) {
    _submitPortofolioEditController.add(UpdatePortofolioEditLoading(message: ""));
    return portofolioEditRepository
        .requestUpdatePortofolioEdit(
      portofolioItemModel,
    )
        .then((value) {
      _submitPortofolioEditController.add(value);
      return value;
    });
  }

  Future<DeletePortofolioEditState> deletePortofolioEdit({
    required String id,
  }) {
    _deletePortofolioEditController.add(DeletePortofolioEditLoading());
    return portofolioEditRepository.requestDeletePortofolioEdit(id: id).then((value) {
      _deletePortofolioEditController.add(value);
      return value;
    });
  }
}
