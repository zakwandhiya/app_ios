import 'package:bimo_app/global_widget/global_rounded_rectangle_border.dart';
import 'package:flutter/material.dart';

ShapeDecoration customShadow = ShapeDecoration(
  color: Colors.white,
  shape: globalRoundedRectangleBorder,
  shadows: [
    BoxShadow(
      color: Color(0x30000000),
      blurRadius: 3,
      offset: Offset(0, 0.85),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x09000000),
      blurRadius: 1,
      offset: Offset(0, 0.25),
      spreadRadius: 0,
    )
  ],
);
