import 'package:bimo_app/features/rancangan/mata_kuliah_model/records_model.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_edit/bloc/rancangan_mata_kuliah_edit_bloc.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_edit/bloc/rancangan_mata_kuliah_edit_state.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_list/model/mata_kuliah_item_model.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_dialog.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class MataKuliahEditWisudaPage extends StatefulWidget {
  final MataKuliahItemModel mataKuliahDetailModel;
  final bool add;

  const MataKuliahEditWisudaPage({
    super.key,
    this.add = true,
    required this.mataKuliahDetailModel,
  });

  @override
  _MataKuliahEditWisudaPageState createState() => _MataKuliahEditWisudaPageState();
}

class _MataKuliahEditWisudaPageState extends State<MataKuliahEditWisudaPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MataKuliahEditBloc mata_kuliahEditBloc = sl<MataKuliahEditBloc>();
  final _formKey = GlobalKey<FormState>();
  final MataKuliahModel mataKuliahModel = MataKuliahModel(
      dateCreated: "", dateModified: "", id: 1, namaMataKuliah: "", sks: 0, idMataKuliahPrasyarat: null, namaMataKuliahPrasyarat: null);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    mata_kuliahEditBloc.dispose();
  }

  void submitProfileEditResponseModel() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showBimoConfirmDialog(
        context: context,
        title: "Input Biodata Mahasiswa",
        body: "Apakah anda yakin ingin menambahkan data pada biodata mahasiswa?",
        callback: sendSubmitRequest,
      );
    }
  }

  void sendSubmitRequest() {
    // mata_kuliahEditBloc.submitMataKuliahEdit(widget.mataKuliahDetailModel).then((value) {
    //   if (value is SubmitMataKuliahEditSuccess) {
    //     Navigator.of(context).pop<bool>(true);
    //   } else {
    //     _showSnackbar(value.message);
    //   }
    // });
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
            hintText: "Enter Your $label",
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

  Widget inputMataKuliah() {
    return DropdownSearch<MataKuliahModel>(
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
    return Scaffold(
      key: _scaffoldKey,
      appBar: GlobalAppBar2(
        context: context,
        title: widget.add ? "Tambah Mata Kuliah" : "Ubah Rancangan",
        subtitle: "Form PA-02",
        canPop: true,
        actions: widget.add
            ? [
                GlobalAppBarActionsButton(
                  iconData: Icons.check,
                  onPressed: submitProfileEditResponseModel,
                ),
              ]
            : null,
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
                    label: "Mata Kuliah",
                    initialValue: widget.mataKuliahDetailModel.namaMataKuliah,
                    textInputType: TextInputType.text,
                    onSaved: (value) => [widget.mataKuliahDetailModel.namaMataKuliah = value!]),
                inputFieldConstruct(
                    label: "Jumlah SKS",
                    initialValue: widget.mataKuliahDetailModel.sks > 0 ? widget.mataKuliahDetailModel.sks.toString() : null,
                    textInputType: TextInputType.number,
                    onSaved: (value) => [widget.mataKuliahDetailModel.sks = int.parse(value!)]),
                inputFieldConstruct(
                    label: "Mata Kuliah Prasyarat",
                    initialValue: widget.mataKuliahDetailModel.targetNilai,
                    textInputType: TextInputType.text,
                    onSaved: (value) => [widget.mataKuliahDetailModel.namaMataKuliah = value!]),
                inputFieldConstruct(
                    label: "Target Nilai",
                    initialValue: widget.mataKuliahDetailModel.namaMataKuliah,
                    textInputType: TextInputType.text,
                    onSaved: (value) => [widget.mataKuliahDetailModel.namaMataKuliah = value!]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
