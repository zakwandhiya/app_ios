import 'package:bimo_app/features/homepage/page/homepage_page.dart';
import 'package:bimo_app/features/onboarding/onboarding_page.dart';
import 'package:bimo_app/global_widget/bottom_menu.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import '../../utils/storage_utils.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    checkUserId();
    super.initState();
  }

  void checkUserId() {
    String? userId = StorageUtils.getUserId();
    if (userId == null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnBoardingPage(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomMenu(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            CustomColors.blueSky,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            "assets/logo_filkom.png",
            width: MediaQuery.of(context).size.width - 60,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
