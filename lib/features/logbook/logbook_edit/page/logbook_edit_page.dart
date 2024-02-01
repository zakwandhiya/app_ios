import 'package:bimo_app/features/logbook/model/logbook_item_model.dart';
import 'package:bimo_app/features/rancangan/mata_kuliah_model/records_model.dart';
import 'package:bimo_app/features/logbook/logbook_edit/bloc/logbook_edit_bloc.dart';
import 'package:bimo_app/features/logbook/logbook_edit/bloc/logbook_edit_state.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_dialog.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class LogbookEditPage extends StatefulWidget {
  final LogbookItemModel logbookDetailModel;
  final bool add;

  const LogbookEditPage({
    super.key,
    this.add = true,
    required this.logbookDetailModel,
  });

  @override
  _LogbookEditPageState createState() => _LogbookEditPageState();
}

class _LogbookEditPageState extends State<LogbookEditPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LogbookEditBloc logbookEditBloc = sl<LogbookEditBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    logbookEditBloc.dispose();
  }

  void addProfileEditResponseModel() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showBimoConfirmDialog(
        context: context,
        title: "Input Logbook",
        body: "Apakah anda yakin ingin menambahkan data pada logbook?",
        callback: sendAddLogbookRequest,
      );
    }
  }

  void sendAddLogbookRequest() {
    logbookEditBloc.addLogbookEdit(widget.logbookDetailModel).then((value) {
      if (value is UpdateLogbookEditSuccess) {
        Navigator.of(context).pop<bool>(true);
      } else {
        _showSnackbar(value.message);
      }
    });
  }

  void updateProfileEditResponseModel() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showBimoConfirmDialog(
        context: context,
        title: "Input Logbook",
        body: "Apakah anda yakin ingin memperbaharui logbook?",
        callback: sendUpdateLogbookRequest,
      );
    }
  }

  void sendUpdateLogbookRequest() {
    logbookEditBloc.updateLogbookEdit(widget.logbookDetailModel).then((value) {
      if (value is UpdateLogbookEditSuccess) {
        Navigator.of(context).pop<bool>(true);
      } else {
        _showSnackbar(value.message);
      }
    });
  }

  Widget inputFieldConstruct({
    required String label,
    String? initialValue,
    required TextInputType textInputType,
    required void Function(String?)? onSaved,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: CustomTextTheme.caption.copyWith(color: CustomColors.blackMamba),
        ),
        const SizedBox(height: 9),
        TextFormField(
          decoration: globalInputDecoration.copyWith(
            hintText: "Tambahkan $label",
          ),
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          onSaved: onSaved,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$label tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget inputLogbook() {
    return DropdownSearch<LogbookItemModel>(
      validator: (value) {
        if (value == null) {
          return 'value kosong';
        }
        return null;
      },
      autoValidateMode: AutovalidateMode.onUserInteraction,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: globalInputDecoration.copyWith(),
      ),
    );
  }

  void _showSnackbar(String value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value),
        duration: const Duration(seconds: 1),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: GlobalAppBar2(
            context: context,
            title: widget.add ? "Tambah Logbook" : "Ubah Logbook",
            subtitle: "Form PA-02",
            canPop: true,
            actions: widget.add
                ? [
                    GlobalAppBarActionsButton(
                      iconData: Icons.check,
                      onPressed: addProfileEditResponseModel,
                    ),
                  ]
                : [
                    GlobalAppBarActionsButton(
                      iconData: Icons.check,
                      onPressed: updateProfileEditResponseModel,
                    ),
                  ],
          ),
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    inputFieldConstruct(
                        label: "Dosen Pembimbing Akademik",
                        initialValue: widget.logbookDetailModel.dosenPembimbing,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.logbookDetailModel.dosenPembimbing = value!]),
                    inputFieldConstruct(
                        label: "Keperluan",
                        initialValue: widget.logbookDetailModel.keperluan,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.logbookDetailModel.keperluan = value!]),
                    inputFieldConstruct(
                        label: "Keterangan",
                        initialValue: widget.logbookDetailModel.keterangan,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.logbookDetailModel.keterangan = value!]),
                    inputFieldConstruct(
                        label: "Semester",
                        initialValue: widget.logbookDetailModel.semester,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.logbookDetailModel.semester = value!]),
                    inputFieldConstruct(
                        label: "Tanggal Konsultasi",
                        initialValue: widget.logbookDetailModel.tanggalKonsultasi,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.logbookDetailModel.tanggalKonsultasi = value!]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
