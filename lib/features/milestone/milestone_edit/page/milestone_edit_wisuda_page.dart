import 'package:bimo_app/features/milestone/milestone_detail/model/get_milestone_detail_model.dart';
import 'package:bimo_app/features/milestone/milestone_edit/bloc/milestone_edit_bloc.dart';
import 'package:bimo_app/features/milestone/milestone_edit/bloc/milestone_edit_state.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_dialog.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class MilestoneEditWisudaPage extends StatefulWidget {
  final GetMilestoneDetailResponseModel milestoneDetailModel;

  const MilestoneEditWisudaPage({
    super.key,
    required this.milestoneDetailModel,
  });

  @override
  _MilestoneEditWisudaPageState createState() => _MilestoneEditWisudaPageState();
}

class _MilestoneEditWisudaPageState extends State<MilestoneEditWisudaPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MilestoneEditBloc milestoneEditBloc = sl<MilestoneEditBloc>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    milestoneEditBloc.dispose();
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
    milestoneEditBloc.submitMilestoneEdit(widget.milestoneDetailModel).then((value) {
      if (value is SubmitMilestoneEditSuccess) {
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
        title: "Target Wisuda",
        subtitle: "Form PA-01",
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
                Image.asset(
                  "assets/target_wisuda.png",
                  width: MediaQuery.of(context).size.width - 100,
                  fit: BoxFit.fitWidth,
                ),
                inputFieldConstruct(
                    label: "Pelaksanaan",
                    initialValue: widget.milestoneDetailModel.targetWisudaPelaksanaan,
                    textInputType: TextInputType.text,
                    onSaved: (value) => [widget.milestoneDetailModel.targetWisudaPelaksanaan = value!]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
