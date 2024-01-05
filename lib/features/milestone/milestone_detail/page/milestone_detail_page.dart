import 'package:bimo_app/features/milestone/milestone_edit/page/milestone_edit_page.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/no_internet_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/milestone_detail_bloc.dart';
import '../model/get_milestone_detail_model.dart';
import '../bloc/milestone_detail_state.dart';
import 'package:flutter/material.dart';

class MilestoneDetailPage extends StatefulWidget {
  // final String id;

  const MilestoneDetailPage({
    super.key,
    // required this.id,
  });

  @override
  _MilestoneDetailPageState createState() => _MilestoneDetailPageState();
}

class _MilestoneDetailPageState extends State<MilestoneDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MilestoneDetailBloc milestoneDetailBloc = sl<MilestoneDetailBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  late GetMilestoneDetailResponseModel data;

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    milestoneDetailBloc.dispose();
  }

  void addMilestoneDetailResponseModel() {}

  Widget listItem(GetMilestoneDetailResponseModel milestoneDetailModel) {
    return InkWell(
      onTap: addMilestoneDetailResponseModel,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              Text(
                "",
                style: CustomTextTheme.body2.copyWith(color: CustomColors.blackDisabled),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    milestoneDetailBloc.getMilestoneDetail().then((value) async {
      if (value is GetMilestoneDetailJWTError) {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(
                // jwtErrorLogin: true,
                ),
          ),
        );
        if (result) {
          _refresh();
        }
      }
    });
  }

  void _showSnackbar(String value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value),
        duration: const Duration(seconds: 1),
      ));
    });
  }

  void _navigateToMilestoneEdit() {
    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (BuildContext context) => MilestoneEditPage(
          milestoneDetailModel: data,
        ),
      ),
    )
        .then((value) {
      if (value != null && value) {
        _refresh();
        _showSnackbar("Update Data Berhasil");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const double height = 150;
    return Scaffold(
      key: _scaffoldKey,
      appBar: GlobalAppBar2(
        context: context,
        title: "Biodata Mahasiswa",
        subtitle: "Form PA-00",
        canPop: true,
        actions: [
          SizedBox(
            height: 42,
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: CustomTextTheme.button.copyWith(color: CustomColors.blueSecondary),
              ),
              onPressed: _navigateToMilestoneEdit,
              child: const Text("Update"),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<GetMilestoneDetailState>(
            initialData: milestoneDetailBloc.getInitialMilestoneDetailState,
            stream: milestoneDetailBloc.getMilestoneDetailState,
            builder: (context, snapshot) {
              if (snapshot.data is GetMilestoneDetailLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetMilestoneDetailClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetMilestoneDetailInternetError) {
                return const NoInternetWidget();
              } else if (snapshot.data is GetMilestoneDetailSuccess) {
                data = (snapshot.data as GetMilestoneDetailSuccess).getMilestoneDetailResponseModel;
                return Container(
                  padding: const EdgeInsets.only(left: 20, right: 16, top: 16, bottom: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: height,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    data.targetWisudaStatus ? "assets/target_wisuda_on.png" : "assets/target_wisuda_off.png",
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 3,
                                      color: data.targetSkripsiStatus ? CustomColors.blueSecondary : CustomColors.blackTeritiary,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    "Target Wisuda",
                                    style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "Pelaksanaan : ${data.targetWisudaPelaksanaan}",
                                    style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: height,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    data.targetSkripsiStatus ? "assets/target_skripsi_on.png" : "assets/target_skripsi_off.png",
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 3,
                                      color: data.targetPklStatus ? CustomColors.blueSecondary : CustomColors.blackTeritiary,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    "Target Skripsi",
                                    style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "Pra-Proposal : ${data.targetSkripsiPraproposal}\nProposal : ${data.targetSkripsiProposal}\nPengerjaan : ${data.targetSkripsiPengerjaan}\nSemhas/Sidang : ${data.targetSkripsiSemhasSidang}\n",
                                    style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: height,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    data.targetPklStatus ? "assets/target_pkl_on.png" : "assets/target_pkl_off.png",
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 3,
                                      color: data.kuliahStatus ? CustomColors.blueSecondary : CustomColors.blackTeritiary,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    "Target PKL/KKN-P",
                                    style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "Pendaftaran : ${data.targetPklPendaftaran}\nPelaksanaan : ${data.targetPklPelaksaan}",
                                    style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        height: height,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    data.kuliahStatus ? "assets/target_kuliah_on.png" : "assets/target_kuliah_off.png",
                                    width: 80,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  Text(
                                    "Kuliah dengan IPK  ≥ ${data.kuliahTargetIpk}",
                                    maxLines: 2,
                                    style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    "1. ${data.kuliahCatatan_1}\n2. ${data.kuliahCatatan_2}\n3. ${data.kuliahCatatan_3}",
                                    style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const UnknownErrorWidget();
            },
          ),
        ),
      ),
    );
  }
}
