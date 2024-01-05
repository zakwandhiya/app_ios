import 'package:bimo_app/features/login/page/login_page.dart';
import 'package:bimo_app/global_widget/global_button.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

// OnBoarding content Model
class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
    image: "assets/onboarding_1_selamat_datang.png",
    title: "Selamat datang di FILKOM Mobile",
    description: "Aplikasi sistem informasi yang membantu anda  melakukan bimbingan akademik dengan dosen PA",
  ),
  OnBoard(
    image: "assets/onboarding_2_prosedur_bimbingan.png",
    title: "Bimbingan akademik mahasiswa",
    description: "Memberikan arahan dalam mencapai tingkat keberhasilan belajar mahasiswa sesuai dengan prosedur bimbingan akademik",
  ),
  OnBoard(
    image: "assets/onboarding_3_mencapai_keberhasilan.png",
    title: "Meningkatkan kesiapan mahasiswa",
    description: "Membantu mahasiswa dalam mengembangkan wawasan belajar dan mengatasi masalah perkuliahan",
  ),
  OnBoard(
    image: "assets/onboarding_4_mulai.png",
    title: "Bimbingan Akademik Lebih Mudah dan Terpadu",
    description: "",
  ),
];

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 310,
            width: 310,
            fit: BoxFit.fill,
          ),
          const Spacer(flex: 3),
          Text(
            title,
            style: CustomTextTheme.body1.copyWith(color: CustomColors.blackMamba),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            description,
            style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}

class OnBoardContent4 extends StatelessWidget {
  const OnBoardContent4({
    super.key,
    required this.context,
  });

  final BuildContext context;

  void _navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              demoData[3].title,
              textAlign: TextAlign.center,
              style: CustomTextTheme.heading6.copyWith(color: CustomColors.blackMamba),
            ),
          ),
          const Spacer(flex: 3),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              demoData[3].image,
              fit: BoxFit.fitWidth,
            ),
          ),
          const Spacer(flex: 3),
          GlobalButton(
            onPressed: _navigateToLoginPage,
            text: "MULAI",
          ),
        ],
      ),
    );
  }
}

// OnBoardingScreen
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // Variables
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void pageIndexIncrease() {
    setState(() {
      _pageIndex = _pageIndex + 1;
    });
    pageviewAnimatedToPageIndex();
  }

  void skipOnboardingPage() {
    setState(() {
      _pageIndex = 3;
    });
    pageviewAnimatedToPageIndex();
  }

  void pageviewAnimatedToPageIndex() {
    _pageController.animateToPage(
      _pageIndex,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Carousel area
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemCount: demoData.length,
                controller: _pageController,
                itemBuilder: (context, index) => index < 3
                    ? OnBoardContent(
                        title: demoData[index].title,
                        description: demoData[index].description,
                        image: demoData[index].image,
                      )
                    : OnBoardContent4(context: this.context),
              ),
            ),
            // Indicator area
            Padding(
              padding: const EdgeInsets.only(bottom: 22, left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: _pageIndex < 3,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: skipOnboardingPage,
                      child: Text("Skip", style: CustomTextTheme.button.copyWith(color: CustomColors.blackTeritiary)),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                        demoData.length,
                        (index) => DotIndicator(
                          isActive: index == _pageIndex,
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: _pageIndex < 3,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: pageIndexIncrease,
                      child: Text("Next", style: CustomTextTheme.button.copyWith(color: CustomColors.blueSecondary)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? CustomColors.blueSecondary : CustomColors.blackAsh,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
