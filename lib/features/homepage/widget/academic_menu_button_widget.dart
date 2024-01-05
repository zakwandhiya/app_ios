import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class HomepageAcademicMenuButtonWidget extends StatefulWidget {
  final String textFirst;
  final String textSecond;
  final String imgUri;
  final void Function() onTap;

  const HomepageAcademicMenuButtonWidget({super.key, required this.textFirst, required this.textSecond, required this.imgUri, required this.onTap});

  @override
  _HomepageAcademicMenuButtonWidgetState createState() => _HomepageAcademicMenuButtonWidgetState();
}

class _HomepageAcademicMenuButtonWidgetState extends State<HomepageAcademicMenuButtonWidget> {
  @override
  Widget build(BuildContext context) {
    double width = ((MediaQuery.of(context).size.width) / 100 * 20);
    return InkWell(
      onTap: widget.onTap,
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
                width: 52,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(height: 10),
              Text(
                widget.textFirst,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: CustomTextTheme.overline.copyWith(color: const Color(0xff272727)),
              ),
              const SizedBox(height: 4),
              Text(
                widget.textSecond,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: CustomTextTheme.overline.copyWith(color: const Color(0xff272727)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
