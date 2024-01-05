import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

void showBimoConfirmDialog({
  required BuildContext context,
  required String title,
  required String body,
  required Function() callback,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        titleTextStyle: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
        content: Text(body),
        contentTextStyle: CustomTextTheme.caption.copyWith(color: CustomColors.blackMamba),
        backgroundColor: Colors.white,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        alignment: Alignment.center,
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('BATAL'),
          ),
          const VerticalDivider(),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blueSecondary),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              callback();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
