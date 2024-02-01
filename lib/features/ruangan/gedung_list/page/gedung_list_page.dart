import 'package:bimo_app/features/ruangan/gedung_list/model/dosen_item_model.dart';
import 'package:bimo_app/global_widget/custom_badge_widget.dart';
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
import '../bloc/gedung_list_bloc.dart';
import '../model/get_gedung_list_model.dart';
import '../bloc/gedung_list_state.dart';
import 'package:flutter/material.dart';

class GedungListPage extends StatefulWidget {
  // final String id;

  const GedungListPage({
    super.key,
    // required this.id,
  });

  @override
  _GedungListPageState createState() => _GedungListPageState();
}

class _GedungListPageState extends State<GedungListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GedungListBloc gedungListBloc = sl<GedungListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    gedungListBloc.dispose();
  }

  Widget gedungWidget(DosenItemModel recordsModel) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Text(
              recordsModel.nama,
              maxLines: 1,
              style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                recordsModel.ruangan,
                maxLines: 1,
                style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    gedungListBloc.getGedungList().then((value) async {
      print("==========" + value.toString());
      if (value is GetGedungListJWTError) {
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
          child: StreamBuilder<GetGedungListState>(
            initialData: gedungListBloc.getInitialGedungState,
            stream: gedungListBloc.getGedungListState,
            builder: (context, snapshot) {
              if (snapshot.data is GetGedungListLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetGedungListClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetGedungListEmpty) {
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
                                  "Anda belum memiliki riwayat IPK & SKS",
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                );
              } else if (snapshot.data is GetGedungListInternetError) {
                return const NoInternetWidget();
              } else if (snapshot.data is GetGedungListSuccess) {
                GetGedungListResponseModel data = (snapshot.data as GetGedungListSuccess).getGedungListResponseModel;
                return Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/gedung.png",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(10),
                        color: CustomColors.blueSky,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Text(
                                "Nama Dosen",
                                maxLines: 1,
                                style: CustomTextTheme.caption.copyWith(color: CustomColors.blackMamba),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(
                                child: Text(
                                  "Ruangan",
                                  maxLines: 1,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackMamba),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        itemCount: data.records.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return gedungWidget(data.records[index]);
                        },
                      ),
                      const SizedBox(height: 4),
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
