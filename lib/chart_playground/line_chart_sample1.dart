import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartExamle extends StatelessWidget {
  const LineChartExamle({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        sampleData1,
        duration: const Duration(milliseconds: 250),
      ),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 6,
        maxY: 4,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
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
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
      ];

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
    Widget text = Text(value.toInt().toString(), style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary));

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: CustomColors.blueDefault,
            width: 4,
          ),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: false,
        color: CustomColors.blueDefault,
        barWidth: 1,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 3.5),
          FlSpot(2, 3.7),
          FlSpot(3, 3.1),
        ],
      );
}

// class LineChartSample1 extends StatefulWidget {
//   const LineChartSample1({super.key});

//   @override
//   State<StatefulWidget> createState() => LineChartSample1State();
// }

// class LineChartSample1State extends State<LineChartSample1> {
//   late bool isShowingMainData;

//   @override
//   void initState() {
//     super.initState();
//     isShowingMainData = true;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.23,
//       child: Stack(
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               const SizedBox(
//                 height: 37,
//               ),
//               const Text(
//                 'Monthly Sales',
//                 style: TextStyle(
//                   color: CustomColors.blueDefault,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: 37,
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 16, left: 6),
//                   child: LineChartExamle(isShowingMainData: isShowingMainData),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//           IconButton(
//             icon: Icon(
//               Icons.refresh,
//               color: Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
//             ),
//             onPressed: () {
//               setState(() {
//                 isShowingMainData = !isShowingMainData;
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
