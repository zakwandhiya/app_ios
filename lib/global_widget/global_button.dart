import 'package:bimo_app/global_widget/global_rounded_rectangle_border.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.loading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8),
          backgroundColor: CustomColors.blueSecondary,
          shape: globalRoundedRectangleBorder,
        ),
        child: loading
            ? const CircularProgressIndicator(
                backgroundColor: Colors.white,
              )
            : Text(
                text,
                style: CustomTextTheme.button.copyWith(color: Colors.white),
              ),
      ),
    );
  }
}

class GlobalTextButton extends Container {
  GlobalTextButton(
    String data, {
    super.key,
    required void Function() onPressed,
  }) : super(
          height: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blueTeritiary),
            ),
            onPressed: onPressed,
            child: Text(data),
          ),
        );
}
