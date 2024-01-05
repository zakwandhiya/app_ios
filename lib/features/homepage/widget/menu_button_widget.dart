import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class HomepageMenuButtonWidget extends StatefulWidget {
  final String text;
  final String imgUri;
  final void Function() onTap;

  const HomepageMenuButtonWidget({super.key, required this.text, required this.imgUri, required this.onTap});

  @override
  _HomepageMenuButtonWidgetState createState() => _HomepageMenuButtonWidgetState();
}

class _HomepageMenuButtonWidgetState extends State<HomepageMenuButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double width = ((MediaQuery.of(context).size.width) / 100 * 34);
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(right: 12),
        child: Container(
          padding: const EdgeInsets.only(bottom: 15),
          width: width,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imgUri,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
                Text(
                  widget.text,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blueSecondary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
