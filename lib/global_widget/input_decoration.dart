import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

InputDecoration globalInputDecoration = InputDecoration(
  // errorStyle: TextStyle(
  //   fontSize: 6,
  // ),
  isDense: false,
  filled: true,
  fillColor: CustomColors.blackAsh,
  hintStyle: CustomTextTheme.body2.copyWith(color: CustomColors.blackTeritiary),
  contentPadding: const EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 10),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: CustomColors.blueSecondary, width: 1.0),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: CustomColors.redDanger, width: 1.0),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: CustomColors.redDanger, width: 1.0),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: CustomColors.blackDisabled, width: 1.0),
  ),
);
