import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class UnknownErrorWidget extends StatefulWidget {
  const UnknownErrorWidget({Key? key}) : super(key: key);

  @override
  State<UnknownErrorWidget> createState() => _UnknownErrorWidgetState();
}

class _UnknownErrorWidgetState extends State<UnknownErrorWidget> {
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
            "assets/error_not_found.png",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Text(
            "Terjadi Kesalahan",
            textAlign: TextAlign.center,
            style: CustomTextTheme.heading6.copyWith(color: CustomColors.blackMamba),
          ),
          const SizedBox(height: 14),
          Text(
            "Periksa kembali data anda dan silahkan coba lagi.",
            textAlign: TextAlign.center,
            style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
          ),
        ],
      ),
    );
  }
}
