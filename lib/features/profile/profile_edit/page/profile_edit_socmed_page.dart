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

class ProfileEditSocmedPage extends StatefulWidget {
  final GetProfileDetailResponseModel profileDetailModel;

  const ProfileEditSocmedPage({
    super.key,
    required this.profileDetailModel,
  });

  @override
  _ProfileEditSocmedPageState createState() => _ProfileEditSocmedPageState();
}

class _ProfileEditSocmedPageState extends State<ProfileEditSocmedPage> {
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
        title: "Input Media Sosial Mahasiswa",
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
            title: "Media Sosial",
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
                        label: "Facebook ID",
                        initialValue: widget.profileDetailModel.facebookId,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.profileDetailModel.facebookId = value!]),
                    inputFieldConstruct(
                        label: "Instagram ID",
                        initialValue: widget.profileDetailModel.instagramId,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.profileDetailModel.instagramId = value!]),
                    inputFieldConstruct(
                        label: "Line ID",
                        initialValue: widget.profileDetailModel.lineId,
                        textInputType: TextInputType.number,
                        onSaved: (value) => [widget.profileDetailModel.lineId = value!]),
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
