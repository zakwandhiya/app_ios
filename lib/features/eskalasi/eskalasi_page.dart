import 'package:bimo_app/features/ipk_sks/ipk_sks_list/model/ipk_sks_item_model.dart';
import 'package:bimo_app/global_widget/custom_badge_widget.dart';
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
import 'package:flutter/material.dart';

class EskalasiPage extends StatefulWidget {
  // final String id;

  const EskalasiPage({
    super.key,
    // required this.id,
  });

  @override
  _EskalasiPageState createState() => _EskalasiPageState();
}

class _EskalasiPageState extends State<EskalasiPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  TextStyle style = CustomTextTheme.subtitle2.copyWith(
    color: CustomColors.blackSecondary,
  );

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _refresh() async {}

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
          appBar: GlobalAppBar2(
            context: context,
            title: "Eskalasi Bimbingan",
            subtitle: "Form PA-06",
            canPop: true,
          ),
          key: _scaffoldKey,
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Data Mahasiswa",
                    style: CustomTextTheme.subtitle2.copyWith(
                      color: CustomColors.blackSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: customShadow,
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama = Zakwan Dhiyaulhaq kussasih",
                              style: CustomTextTheme.overline.copyWith(
                                color: CustomColors.blackSecondary,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "NIM = 165150201111266",
                              style: CustomTextTheme.overline.copyWith(
                                color: CustomColors.blackSecondary,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Data Dosen Pembimbing Akademik",
                    style: CustomTextTheme.subtitle2.copyWith(
                      color: CustomColors.blackSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: customShadow,
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama = Dr. Eng. Herman Tolle, S.T., M.T.",
                              style: CustomTextTheme.overline.copyWith(
                                color: CustomColors.blackSecondary,
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "NIK = 19740823 200012 1 001",
                              style: CustomTextTheme.overline.copyWith(
                                color: CustomColors.blackSecondary,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Deskripsi Permasalahan",
                    style: CustomTextTheme.subtitle2.copyWith(
                      color: CustomColors.blackSecondary,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                            Text(
                              "Anda tidak memiliki riwayat eskalasi",
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: CustomTextTheme.caption.copyWith(
                                color: CustomColors.blackTeritiary,
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
