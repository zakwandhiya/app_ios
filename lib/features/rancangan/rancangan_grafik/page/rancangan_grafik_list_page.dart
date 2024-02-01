import 'package:bimo_app/features/rancangan/rancangan_grafik/model/rancangan_grafik_model.dart';
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
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/rancangan_grafik_list_bloc.dart';
import '../model/get_rancangan_grafik_list_model.dart';
import '../bloc/rancangan_grafik_list_state.dart';
import 'package:flutter/material.dart';

class RancanganGrafikListPage extends StatefulWidget {
  // final String id;

  const RancanganGrafikListPage({
    super.key,
    // required this.id,
  });

  @override
  _RancanganGrafikListPageState createState() => _RancanganGrafikListPageState();
}

class _RancanganGrafikListPageState extends State<RancanganGrafikListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  RancanganGrafikListBloc rancanganGrafikListBloc = sl<RancanganGrafikListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    rancanganGrafikListBloc.dispose();
  }

  Widget rancanganGrafikWidget(RancanganGrafikItemModel recordsModel) {
    TextStyle line = CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary);
    double width = 130;
    Widget badgeIpk;
    switch (recordsModel.ipkStatus) {
      case "Excellent":
        badgeIpk = customBadgeGold("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      case "Normal":
        badgeIpk = customBadgeGreen("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      case "Kurang":
        badgeIpk = customBadgeOrange("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      case "Kritis":
        badgeIpk = customBadgeRed("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      default:
        badgeIpk = customBadgeRed("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
    }

    Widget badgeSks;
    switch (recordsModel.sksStatus) {
      case "Excellent":
        badgeSks = customBadgeGold("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      case "Normal":
        badgeSks = customBadgeGreen("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      case "Kurang":
        badgeSks = customBadgeOrange("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      case "Kritis":
        badgeSks = customBadgeRed("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      default:
        badgeSks = customBadgeRed("SKS: " + recordsModel.sksStatus, caption: false, width: width);
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: customShadow,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Catatan Dosen PA",
                        maxLines: 2,
                        style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        recordsModel.catatan,
                        maxLines: 3,
                        style: CustomTextTheme.caption.copyWith(color: CustomColors.blackMamba),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        badgeIpk,
                        const SizedBox(height: 6),
                        badgeSks,
                        const SizedBox(height: 6),
                        Text(
                          "Semester " + recordsModel.semester.toString(),
                          maxLines: 1,
                          style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  StreamBuilder<GetRancanganGrafikListState> grafikIPK() {
    return StreamBuilder<GetRancanganGrafikListState>(
      initialData: rancanganGrafikListBloc.getInitialRancanganGrafikState,
      stream: rancanganGrafikListBloc.getRancanganGrafikListState,
      builder: (context, snapshot) {
        if (snapshot.data is GetRancanganGrafikListLoading) {
          return const LoadingWidget();
        } else if (snapshot.data is GetRancanganGrafikListClientError) {
          return const UnderMaintenanceWidget();
        } else if (snapshot.data is GetRancanganGrafikListEmpty) {
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
        } else if (snapshot.data is GetRancanganGrafikListInternetError) {
          return const NoInternetWidget();
        } else if (snapshot.data is GetRancanganGrafikListSuccess) {
          GetRancanganGrafikListResponseModel data = (snapshot.data as GetRancanganGrafikListSuccess).getRancanganGrafikListResponseModel;

          Widget leftTitleWidgets(double value, TitleMeta meta) {
            Widget text = Text(value.toString(), style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary));
            return text;
          }

          SideTitles leftTitles() => SideTitles(
                getTitlesWidget: leftTitleWidgets,
                showTitles: true,
                interval: 1,
                reservedSize: 40,
              );

          Widget bottomTitleWidgets(double value, TitleMeta meta) {
            return SideTitleWidget(
              axisSide: meta.axisSide,
              space: 10,
              child: Text(value.toInt().toString(), style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary)),
            );
          }

          SideTitles bottomTitles = SideTitles(
            showTitles: true,
            reservedSize: 32,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          );

          LineChartData sampleData1 = LineChartData(
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
              ),
            ),
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: bottomTitles,
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: leftTitles(),
              ),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
                left: const BorderSide(color: Colors.transparent),
                right: const BorderSide(color: Colors.transparent),
                top: const BorderSide(color: Colors.transparent),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: false,
                color: CustomColors.blueDefault,
                barWidth: 1,
                isStrokeCapRound: true,
                dotData: const FlDotData(show: true),
                belowBarData: BarAreaData(show: false),
                spots: data.records.map((e) => FlSpot(e.semester.toDouble(), e.ipk)).toList(),

                // [
                //   FlSpot(1, 2.5),
                //   FlSpot(2, 3.9),
                //   FlSpot(3, 3.1),
                // ],
              )
            ],
            minX: 1,
            maxX: data.records.length.toDouble(),
            maxY: 4,
            minY: 0,
          );

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Grafik Indeks Prestasi",
                            style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "*Tap titik untuk menampilkan nilai",
                            style: CustomTextTheme.overline.copyWith(color: CustomColors.blackTeritiary),
                          ),
                          const SizedBox(height: 24),
                          AspectRatio(
                            aspectRatio: 2,
                            child: LineChart(
                              sampleData1,
                              duration: const Duration(milliseconds: 250),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          );
        }
        return const UnknownErrorWidget();
      },
    );
  }

  Future<void> _refresh() async {
    rancanganGrafikListBloc.getRancanganGrafikList().then((value) async {
      if (value is GetRancanganGrafikListJWTError) {
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
          child: Column(
            children: [
              grafikIPK(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
