import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_dialog.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import '../../profile_detail/model/get_profile_detail_model.dart';
import '../bloc/profile_edit_bloc.dart';
import '../bloc/profile_edit_state.dart';
import 'package:flutter/material.dart';

class ProfileEditGuardianPage extends StatefulWidget {
  final GetProfileDetailResponseModel profileDetailModel;

  const ProfileEditGuardianPage({
    super.key,
    required this.profileDetailModel,
  });

  @override
  _ProfileEditGuardianPageState createState() => _ProfileEditGuardianPageState();
}

class _ProfileEditGuardianPageState extends State<ProfileEditGuardianPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileEditBloc profileEditBloc = sl<ProfileEditBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    profileEditBloc.dispose();
  }

  void submitProfileEditResponseModel() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showBimoConfirmDialog(
        context: context,
        title: "Input Data Orang Tua/Wali",
        body: "Apakah anda yakin ingin menambahkan data pada biodata mahasiswa?",
        callback: sendSubmitRequest,
      );
    }
  }

  void sendSubmitRequest() {
    profileEditBloc.submitProfileEdit(widget.profileDetailModel).then((value) {
      if (value is SubmitProfileEditSuccess) {
        Navigator.of(context).pop<bool>(true);
      } else {
        _showSnackbar(value.message);
      }
    });
  }

  Widget inputFieldConstruct({
    required String label,
    required String initialValue,
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
            title: "Data Orang Tua",
            subtitle: "Form PA-00",
            canPop: true,
            actions: [
              GlobalAppBarActionsButton(
                iconData: Icons.check,
                onPressed: submitProfileEditResponseModel,
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
                        label: "Nama Orang Tua/Wali",
                        initialValue: widget.profileDetailModel.namaOrangTuaWali,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.profileDetailModel.namaOrangTuaWali = value!]),
                    inputFieldConstruct(
                        label: "Email Orang Tua/Wali",
                        initialValue: widget.profileDetailModel.emailOrangTuaWali,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.profileDetailModel.emailOrangTuaWali = value!]),
                    inputFieldConstruct(
                        label: "Nomor Hp Orang Tua/Wali",
                        initialValue: widget.profileDetailModel.nomorHpOrangTuaWali,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.profileDetailModel.nomorHpOrangTuaWali = value!]),
                    inputFieldConstruct(
                        label: "Alamat Orang Tua",
                        initialValue: widget.profileDetailModel.alamatOrangTua,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.profileDetailModel.alamatOrangTua = value!]),
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
