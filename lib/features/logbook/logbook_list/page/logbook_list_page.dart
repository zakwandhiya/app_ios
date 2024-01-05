import 'package:bimo_app/features/logbook/model/logbook_item_model.dart';
import 'package:bimo_app/features/logbook/logbook_edit/page/logbook_edit_page.dart';
import 'package:bimo_app/global_widget/custom_shadow.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_rounded_rectangle_border.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/no_internet_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/global_widget/custom_badge_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/logbook_list_bloc.dart';
import '../model/get_logbook_list_model.dart';
import '../bloc/logbook_list_state.dart';
import 'package:flutter/material.dart';

class LogbookListPage extends StatefulWidget {
  // final String id;

  const LogbookListPage({
    super.key,
    // required this.id,
  });

  @override
  _LogbookListPageState createState() => _LogbookListPageState();
}

class _LogbookListPageState extends State<LogbookListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  LogbookListBloc mataKuliahListBloc = sl<LogbookListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    mataKuliahListBloc.dispose();
  }

  void addLogbookListResponseModel(LogbookItemModel recordsModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LogbookEditPage(
                  add: false,
                  logbookDetailModel: recordsModel,
                )));
  }

  Widget pengumumamWidget(LogbookItemModel recordsModel) {
    TextStyle line = CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: customShadow,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: () {
            addLogbookListResponseModel(recordsModel);
          },
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recordsModel.keterangan,
                  style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                ),
                const SizedBox(height: 6),
                Text(
                  "Semester ${recordsModel.semester}",
                  style: line,
                ),
                const SizedBox(height: 6),
                Text(
                  "Tanggal Konsultasi : ${recordsModel.tanggalKonsultasi}",
                  style: line,
                ),
                const SizedBox(height: 12),
                recordsModel.status == "Belum disetujui"
                    ? customBadgeOrange(recordsModel.status, caption: false, width: 120)
                    : customBadgeGreen(recordsModel.status, caption: false, width: 120),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addLogbookButon() {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LogbookEditPage(
                    add: true,
                    logbookDetailModel: LogbookItemModel(
                        dateModified: "",
                        dosenPembimbing: "",
                        tanggalKonsultasi: "",
                        keperluan: "",
                        semester: "",
                        id: 0,
                        dateCreated: "",
                        status: "Belum Disetujui",
                        userId: 0,
                        keterangan: ""))));
      },
      icon: const Icon(
        Icons.add,
        size: 24.0,
        color: CustomColors.blueSecondary,
      ),
      style: OutlinedButton.styleFrom(
        shape: globalRoundedRectangleBorder,
        side: const BorderSide(
          color: CustomColors.blueSecondary,
          style: BorderStyle.solid,
        ),
      ),
      label: Text(
        'Tambah Logbook',
        style: CustomTextTheme.button.copyWith(color: CustomColors.blueSecondary),
      ),
    );
  }

  Future<void> _refresh() async {
    mataKuliahListBloc.getLogbookList().then((value) async {
      if (value is GetLogbookListJWTError) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GlobalAppBar2(
        context: context,
        title: "Logbook",
        subtitle: "Form PA-03",
        canPop: true,
        // actions: [
        //   SizedBox(
        //     height: 42,
        //     child: TextButton(
        //       style: TextButton.styleFrom(
        //         textStyle: CustomTextTheme.button.copyWith(color: CustomColors.blueSecondary),
        //       ),
        //       onPressed: _navigateToMilestoneEdit,
        //       child: const Text("Update"),
        //     ),
        //   ),
        // ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<GetLogbookListState>(
            initialData: mataKuliahListBloc.getInitialLogbookListState,
            stream: mataKuliahListBloc.getLogbookListState,
            builder: (context, snapshot) {
              if (snapshot.data is GetLogbookListLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetLogbookListClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetLogbookListEmpty) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: customShadow,
                        child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/daftar_riwayat.png",
                                  width: 100,
                                  fit: BoxFit.fitWidth,
                                ),
                                const Text(
                                  "Anda belum memprogram mata kuliah di semsetrer 8",
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      addLogbookButon(),
                    ],
                  ),
                );
              } else if (snapshot.data is GetLogbookListInternetError) {
                return const NoInternetWidget();
              } else if (snapshot.data is GetLogbookListSuccess) {
                GetLogbookListResponseModel data = (snapshot.data as GetLogbookListSuccess).getLogbookListResponseModel;
                return Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListView.builder(
                        itemCount: data.records.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return pengumumamWidget(data.records[index]);
                        },
                      ),
                      const SizedBox(height: 4),
                      addLogbookButon(),
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
