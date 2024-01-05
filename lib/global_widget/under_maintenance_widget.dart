import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class UnderMaintenanceWidget extends StatefulWidget {
  const UnderMaintenanceWidget({Key? key}) : super(key: key);

  @override
  State<UnderMaintenanceWidget> createState() => _UnderMaintenanceWidgetState();
}

class _UnderMaintenanceWidgetState extends State<UnderMaintenanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Image.asset(
            "assets/error_under_maintenance.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Text(
            "Maaf! Kami sedang dalam maintenance",
            textAlign: TextAlign.center,
            style: CustomTextTheme.heading6.copyWith(color: CustomColors.blackMamba),
          ),
          const SizedBox(height: 14),
          Text(
            "Kami sedang mempersiapkan perbaikan untuk melayani anda lebih baik..",
            textAlign: TextAlign.center,
            style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
          ),
        ],
      ),
    );
  }
}
