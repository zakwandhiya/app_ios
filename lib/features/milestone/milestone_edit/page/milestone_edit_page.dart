import 'package:bimo_app/features/milestone/milestone_detail/model/get_milestone_detail_model.dart';
import 'package:bimo_app/features/milestone/milestone_edit/bloc/milestone_edit_bloc.dart';
import 'package:bimo_app/features/milestone/milestone_edit/bloc/milestone_edit_state.dart';
import 'package:bimo_app/features/milestone/milestone_edit/page/indicator_widget.dart';
import 'package:bimo_app/features/milestone/milestone_edit/page/milestone_edit_pkl_page.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/input_decoration.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

class MilestoneEditPage extends StatefulWidget {
  final GetMilestoneDetailResponseModel milestoneDetailModel;

  const MilestoneEditPage({
    super.key,
    required this.milestoneDetailModel,
  });

  @override
  _MilestoneEditPageState createState() => _MilestoneEditPageState();
}

class _MilestoneEditPageState extends State<MilestoneEditPage> {
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

      Navigator.of(context)
          .push<bool>(
        MaterialPageRoute(
          builder: (BuildContext context) => MilestoneEditPklPage(
            milestoneDetailModel: widget.milestoneDetailModel,
          ),
        ),
      )
          .then((value) {
        Navigator.of(context).pop<bool>(value);
      });
      // showBimoConfirmDialog(
      //   context: context,
      //   title: "Input Biodata Mahasiswa",
      //   body: "Apakah anda yakin ingin menambahkan data pada biodata mahasiswa?",
      //   callback: sendSubmitRequest,
      // );
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
            title: "Catatan Target",
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
                    IndicatorWidget(number: 1),
                    SizedBox(
                      height: 16,
                    ),
                    Image.asset(
                      "assets/target_kuliah_dengan_baik.png",
                      width: MediaQuery.of(context).size.width - 100,
                      fit: BoxFit.fitWidth,
                    ),
                    inputFieldConstruct(
                        label: "Kuliah dengan IPK ≥",
                        initialValue: widget.milestoneDetailModel.kuliahTargetIpk.toString(),
                        textInputType: TextInputType.number,
                        onSaved: (value) => [widget.milestoneDetailModel.kuliahTargetIpk = double.parse(value!)]),
                    inputFieldConstruct(
                        label: "Catatan Target 1",
                        initialValue: widget.milestoneDetailModel.kuliahCatatan_1,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.milestoneDetailModel.kuliahCatatan_1 = value!]),
                    inputFieldConstruct(
                        label: "Catatan Target 2",
                        initialValue: widget.milestoneDetailModel.kuliahCatatan_2,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.milestoneDetailModel.kuliahCatatan_2 = value!]),
                    inputFieldConstruct(
                        label: "Catatan Target 3",
                        initialValue: widget.milestoneDetailModel.kuliahCatatan_3,
                        textInputType: TextInputType.emailAddress,
                        onSaved: (value) => [widget.milestoneDetailModel.kuliahCatatan_3 = value!]),
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
