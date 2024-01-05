import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_edit/page/rancangan_mata_kuliah_edit_page.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_list/model/mata_kuliah_item_model.dart';
import 'package:bimo_app/global_widget/custom_shadow.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
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
import '../bloc/rancangan_mata_kuliah_list_bloc.dart';
import '../model/get_mata_kuliah_list_model.dart';
import '../bloc/rancangan_mata_kuliah_list_state.dart';
import 'package:flutter/material.dart';

class MataKuliahListPage extends StatefulWidget {
  // final String id;

  const MataKuliahListPage({
    super.key,
    // required this.id,
  });

  @override
  _MataKuliahListPageState createState() => _MataKuliahListPageState();
}

class _MataKuliahListPageState extends State<MataKuliahListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MataKuliahListBloc mataKuliahListBloc = sl<MataKuliahListBloc>();

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

  void addMataKuliahListResponseModel(MataKuliahItemModel recordsModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MataKuliahEditWisudaPage(
                  add: false,
                  mataKuliahDetailModel: recordsModel,
                )));
  }

  Widget pengumumamWidget(MataKuliahItemModel recordsModel) {
    TextStyle line = CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: customShadow,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: () {
            addMataKuliahListResponseModel(recordsModel);
          },
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  recordsModel.namaMataKuliah,
                  style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${recordsModel.sks} SKS",
                      style: line,
                    ),
                    Text(
                      "target : ${recordsModel.targetNilai}",
                      style: line,
                    ),
                    Text(
                      "Realisasi : ${recordsModel.realisasi}",
                      style: line,
                    ),
                    Text(
                      "N×K : ${recordsModel.nxk}",
                      style: line,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Row(
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addMataKuliahButon() {
    return OutlinedButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MataKuliahEditWisudaPage(
                      add: true,
                      mataKuliahDetailModel: MataKuliahItemModel(
                          semester: 0,
                          targetNilai: "",
                          nxk: 0,
                          status: "",
                          realisasi: "",
                          id: 0,
                          dateCreated: "",
                          dateModified: "",
                          userId: 0,
                          namaMataKuliah: "",
                          sks: 0,
                          catatanDosen: ""),
                    )));
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
    mataKuliahListBloc.getMataKuliahList().then((value) async {
      if (value is GetMataKuliahListJWTError) {
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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<GetMataKuliahListState>(
            initialData: mataKuliahListBloc.getInitialMataKuliahListState,
            stream: mataKuliahListBloc.getMataKuliahListState,
            builder: (context, snapshot) {
              if (snapshot.data is GetMataKuliahListLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetMataKuliahListClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetMataKuliahListEmpty) {
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
                      addMataKuliahButon(),
                    ],
                  ),
                );
              } else if (snapshot.data is GetMataKuliahListInternetError) {
                return const NoInternetWidget();
              } else if (snapshot.data is GetMataKuliahListSuccess) {
                GetMataKuliahListResponseModel data = (snapshot.data as GetMataKuliahListSuccess).getMataKuliahListResponseModel;
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
                      addMataKuliahButon(),
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
