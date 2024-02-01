import 'package:bimo_app/chart_playground/line_chart_sample1.dart';
import 'package:bimo_app/features/eskalasi/eskalasi_page.dart';
import 'package:bimo_app/features/instruksi/instruksi_page.dart';
import 'package:bimo_app/features/ipk_sks/ipk_sks_main_page/ipk_sks_main_view.dart';
import 'package:bimo_app/features/kalender_akademik/kalender_akademik_main_page.dart';
import 'package:bimo_app/features/logbook/logbook_list/page/logbook_list_page.dart';
import 'package:bimo_app/features/milestone/milestone_detail/page/milestone_detail_page.dart';
import 'package:bimo_app/features/portofolio/portofolio_list/page/portofolio_list_page.dart';
import 'package:bimo_app/features/rancangan/rancangan_main_page/rancangan_main_view.dart';
import 'package:bimo_app/features/rancangan/rancangan_mata_kuliah_list/page/rancangan_mata_kuliah_list_page.dart';
import 'package:bimo_app/features/ruangan/ruangan_main_view.dart';
import 'package:bimo_app/features/splash_screen/splash_screen.dart';
import 'package:bimo_app/global_widget/bottom_menu.dart';
import 'package:bimo_app/global_widget/global_rounded_rectangle_border.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await StorageUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bimo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff37BDE8)),
        primaryColor: CustomColors.blueSecondary,
        indicatorColor: CustomColors.blueTeritiary,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        cardColor: Colors.white,
        cardTheme: CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: globalRoundedRectangleBorder,
        ),
        dialogBackgroundColor: Colors.white,
        dialogTheme: const DialogTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          alignment: Alignment.center,
        ),
        fontFamily: 'Montserrat',
      ),
      // home: const LogbookListPage(),
      home: const BottomMenu(),
      // home: const MilestoneDetailPage(),
      // home: const MilestoneDetailPage(),
      // home: const RancanganMainPage(),
      // home: const IpkSksMainPage(),
      // home: const KalenderAkademikMainPage(),
      // home: const RuanganMainPage(),
      // home: LineChartExamle(isShowingMainData: true),

      // home: const EskalasiPage(),
    );
  }
}
