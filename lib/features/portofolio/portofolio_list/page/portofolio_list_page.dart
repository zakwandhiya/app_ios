import 'package:bimo_app/features/portofolio/model/portofolio_item_model.dart';
import 'package:bimo_app/features/portofolio/portofolio_edit/page/portofolio_edit_page.dart';
import 'package:bimo_app/global_widget/custom_shadow.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_rounded_rectangle_border.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/no_internet_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/portofolio_list_bloc.dart';
import '../model/get_portofolio_list_model.dart';
import '../bloc/portofolio_list_state.dart';
import 'package:flutter/material.dart';

class PortofolioListPage extends StatefulWidget {
  // final String id;

  const PortofolioListPage({
    super.key,
    // required this.id,
  });

  @override
  _PortofolioListPageState createState() => _PortofolioListPageState();
}

class _PortofolioListPageState extends State<PortofolioListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PortofolioListBloc portofolioListBloc = sl<PortofolioListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    portofolioListBloc.dispose();
  }

  void addPortofolioListResponseModel(PortofolioItemModel recordsModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PortofolioEditPage(
                  add: false,
                  portofolioDetailModel: recordsModel,
                )));
  }

  Widget pengumumamWidget(PortofolioItemModel recordsModel) {
    TextStyle line = CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: customShadow,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: () {
            addPortofolioListResponseModel(recordsModel);
          },
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recordsModel.namaKegiatan,
                  style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                ),
                const SizedBox(height: 6),
                Text(
                  "${recordsModel.penyelenggara}",
                  style: line,
                ),
                const SizedBox(height: 6),
                Text(
                  "${recordsModel.tanggalMulai} - ${recordsModel.tanggalSelesai}",
                  style: line,
                ),
                const SizedBox(height: 6),
                Text(
                  "${recordsModel.kategori}",
                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blueDefault),
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addPortofolioButon() {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PortofolioEditPage(
                    add: true,
                    portofolioDetailModel: PortofolioItemModel(
                        penyelenggara: "",
                        userId: 0,
                        namaKegiatan: "",
                        dateCreated: "",
                        kategori: "",
                        jabatan: "",
                        tanggalSelesai: "",
                        tanggalMulai: "",
                        id: 0,
                        dateModified: ""))));
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
        'Tambah Mata Kuliah',
        style: CustomTextTheme.button.copyWith(color: CustomColors.blueSecondary),
      ),
    );
  }

  Future<void> _refresh() async {
    portofolioListBloc.getPortofolioList().then((value) async {
      if (value is GetPortofolioListJWTError) {
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
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: GlobalAppBar2(
            context: context,
            title: "Portofolio",
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
              child: StreamBuilder<GetPortofolioListState>(
                initialData: portofolioListBloc.getInitialPortofolioListState,
                stream: portofolioListBloc.getPortofolioListState,
                builder: (context, snapshot) {
                  if (snapshot.data is GetPortofolioListLoading) {
                    return const LoadingWidget();
                  } else if (snapshot.data is GetPortofolioListClientError) {
                    return const UnderMaintenanceWidget();
                  } else if (snapshot.data is GetPortofolioListEmpty) {
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
                                      "Anda belum memprogram portofolio",
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          addPortofolioButon(),
                        ],
                      ),
                    );
                  } else if (snapshot.data is GetPortofolioListInternetError) {
                    return const NoInternetWidget();
                  } else if (snapshot.data is GetPortofolioListSuccess) {
                    GetPortofolioListResponseModel data = (snapshot.data as GetPortofolioListSuccess).getPortofolioListResponseModel;
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
                          addPortofolioButon(),
                        ],
                      ),
                    );
                  }

                  return const UnknownErrorWidget();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
