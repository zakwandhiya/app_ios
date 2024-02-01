import 'package:bimo_app/features/portofolio/model/portofolio_item_model.dart';
import 'package:bimo_app/features/rancangan/mata_kuliah_model/records_model.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/bloc/portofolio_edit_bloc.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/bloc/portofolio_edit_state.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_dialog.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class PortofolioEditPage extends StatefulWidget {
  final PortofolioItemModel portofolioDetailModel;
  final bool add;

  const PortofolioEditPage({
    super.key,
    this.add = true,
    required this.portofolioDetailModel,
  });

  @override
  _PortofolioEditPageState createState() => _PortofolioEditPageState();
}

class _PortofolioEditPageState extends State<PortofolioEditPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PortofolioEditBloc portofolioEditBloc = sl<PortofolioEditBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    portofolioEditBloc.dispose();
  }

  void addProfileEditResponseModel() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showBimoConfirmDialog(
        context: context,
        title: "Input Portofolio",
        body: "Apakah anda yakin ingin menambahkan data pada portofolio?",
        callback: sendAddPortofolioRequest,
      );
    }
  }

  void sendAddPortofolioRequest() {
    portofolioEditBloc.addPortofolioEdit(widget.portofolioDetailModel).then((value) {
      if (value is UpdatePortofolioEditSuccess) {
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
        title: "Input Portofolio",
        body: "Apakah anda yakin ingin memperbaharui portofolio?",
        callback: sendUpdatePortofolioRequest,
      );
    }
  }

  void sendUpdatePortofolioRequest() {
    portofolioEditBloc.updatePortofolioEdit(widget.portofolioDetailModel).then((value) {
      if (value is UpdatePortofolioEditSuccess) {
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

  Widget inputPortofolio() {
    return DropdownSearch<PortofolioItemModel>(
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
            title: widget.add ? "Tambah Portofolio" : "Ubah Portofolio",
            subtitle: "Form PA-03",
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
                        label: "Nama Kegiatan",
                        initialValue: widget.portofolioDetailModel.namaKegiatan,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.portofolioDetailModel.namaKegiatan = value!]),
                    inputFieldConstruct(
                        label: "Kategori Kegiatan",
                        initialValue: widget.portofolioDetailModel.kategori,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.portofolioDetailModel.kategori = value!]),
                    inputFieldConstruct(
                        label: "Jabatan",
                        initialValue: widget.portofolioDetailModel.jabatan,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.portofolioDetailModel.jabatan = value!]),
                    inputFieldConstruct(
                        label: "Penyelenggara",
                        initialValue: widget.portofolioDetailModel.penyelenggara,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.portofolioDetailModel.penyelenggara = value!]),
                    inputFieldConstruct(
                        label: "Tanggal Mulai",
                        initialValue: widget.portofolioDetailModel.tanggalMulai,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.portofolioDetailModel.tanggalMulai = value!]),
                    inputFieldConstruct(
                        label: "Tanggal Selesai",
                        initialValue: widget.portofolioDetailModel.tanggalSelesai,
                        textInputType: TextInputType.text,
                        onSaved: (value) => [widget.portofolioDetailModel.tanggalSelesai = value!]),
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
