import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

Widget customBadgeGreen(String input, {bool caption = false, double? width}) => Container(
      decoration: BoxDecoration(
        color: CustomColors.greenSuccess,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
      width: width,
      child: Text(
        input,
        textAlign: TextAlign.center,
        style: caption ? CustomTextTheme.caption.copyWith(color: Colors.white) : CustomTextTheme.overline.copyWith(color: Colors.white),
      ),
    );

Widget customBadgeRed(String input, {bool caption = false, double? width}) => Container(
      decoration: BoxDecoration(
        color: CustomColors.redDanger,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
      width: width,
      child: Text(
        input,
        textAlign: TextAlign.center,
        style: caption ? CustomTextTheme.caption.copyWith(color: Colors.white) : CustomTextTheme.overline.copyWith(color: Colors.white),
      ),
    );

Widget customBadgeOrange(String input, {bool caption = false, double? width}) => Container(
      decoration: BoxDecoration(
        color: CustomColors.orangeReminder,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
      width: width,
      child: Text(
        input,
        textAlign: TextAlign.center,
        style: caption ? CustomTextTheme.caption.copyWith(color: Colors.white) : CustomTextTheme.overline.copyWith(color: Colors.white),
      ),
    );

Widget customBadgeGold(String input, {bool caption = false, double? width}) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: const LinearGradient(
          colors: [Colors.yellow, Color(0xffad9c00)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.only(top: 6, bottom: 6, left: 8, right: 8),
      width: width,
      child: Text(
        input,
        textAlign: TextAlign.center,
        style: caption ? CustomTextTheme.caption.copyWith(color: Colors.white) : CustomTextTheme.overline.copyWith(color: Colors.white),
      ),
    );
