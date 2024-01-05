import 'package:bimo_app/features/homepage/widget/academic_menu_button_widget.dart';
import 'package:bimo_app/features/homepage/widget/menu_button_widget.dart';
import 'package:bimo_app/features/logbook/logbook_list/page/logbook_list_page.dart';
import 'package:bimo_app/features/milestone/milestone_detail/page/milestone_detail_page.dart';
import 'package:bimo_app/features/portofolio/portofolio_list/page/portofolio_list_page.dart';
import 'package:bimo_app/features/rancangan/rancangan_main_page/rancangan_main_view.dart';
import 'package:bimo_app/global_widget/custom_badge_widget.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/homepage_bloc.dart';
import '../model/get_homepage_model.dart';
import '../bloc/homepage_state.dart';
import 'package:flutter/material.dart';

class HomepagePage extends StatefulWidget {
  // final String id;

  const HomepagePage({
    super.key,
    // required this.id,
  });

  @override
  _HomepagePageState createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomepageBloc homepageBloc = sl<HomepageBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    homepageBloc.dispose();
  }

  Future<void> _refresh() async {
    homepageBloc.getHomepage().then((value) {
      if (value is GetHomepageJWTError) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()));
        });
      }
    });
  }

  void _showSnackbar(String value) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(value),
        duration: const Duration(seconds: 1),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<GetHomepageState>(
            initialData: homepageBloc.getInitialHomepageState,
            stream: homepageBloc.getHomepageState,
            builder: (context, snapshot) {
              if (snapshot.data is GetHomepageLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetHomepageClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetHomepageSuccess) {
                GetHomepageResponseModel getHomepageResponseModel = (snapshot.data as GetHomepageSuccess).getHomepageResponseModel;
                return Column(
                  children: [
                    Stack(
                      children: [
                        backgroundWidget(context),
                        Column(
                          children: [
                            homepageUpper(getHomepageResponseModel),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 26,
                              decoration: const BoxDecoration(
                                  // borderRadius: BorderRadius.circular(4),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    menuWidget(context),
                  ],
                );
              }

              return const UnknownErrorWidget();
            },
          ),
        ),
      ),
    );
  }

  Container menuWidget(BuildContext context) {
    List<MenuData> menuData = [
      MenuData(
        text: "Milestone",
        imgUri: "assets/progres_akademik_milestone.png",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const MilestoneDetailPage()));
        },
      ),
      MenuData(
        text: "Rancangan",
        imgUri: "assets/progres_akademik_rancangan.png",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const RancanganMainPage()));
        },
      ),
      MenuData(
        text: "Portofolio",
        imgUri: "assets/progres_akademik_portofolio.png",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const PortofolioListPage()));
        },
      ),
      MenuData(
        text: "IPK & SKS",
        imgUri: "assets/progres_akademik_ipk.png",
        onTap: () {},
      ),
      MenuData(
        text: "Logbook",
        imgUri: "assets/progres_akademik_logbook.png",
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const LogbookListPage()));
        },
      ),
      MenuData(
        text: "Eskalasi",
        imgUri: "assets/progres_akademik_eskalasi.png",
        onTap: () {},
      ),
    ];

    List<HomepageAcademicMenuButtonWidget> menuAcademicData = [
      HomepageAcademicMenuButtonWidget(
        textFirst: "Instruksi",
        textSecond: "Bimbingan",
        imgUri: "assets/instruksi_bimbingan.png",
        onTap: () {},
      ),
      HomepageAcademicMenuButtonWidget(
        textFirst: "Kalender",
        textSecond: "Akademik",
        imgUri: "assets/kalender_akademik.png",
        onTap: () {},
      ),
      HomepageAcademicMenuButtonWidget(
        textFirst: "Ruangan",
        textSecond: "Filkom",
        imgUri: "assets/ruangan_filkom.png",
        onTap: () {},
      ),
      HomepageAcademicMenuButtonWidget(
        textFirst: "Kontak",
        textSecond: "Bantuan",
        imgUri: "assets/kontak_bantuan.png",
        onTap: () {},
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Progres Akademik",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blueDefault),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: menuData.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return HomepageMenuButtonWidget(
                  text: menuData[index].text,
                  imgUri: menuData[index].imgUri,
                  onTap: menuData[index].onTap,
                );
              },
            ),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Layanan Bimbingan Akademik",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blueDefault),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: menuAcademicData,
            ),
          )
        ],
      ),
    );
  }

  Container homepageUpper(GetHomepageResponseModel getHomepageResponseModel) {
    return Container(
      padding: const EdgeInsets.only(top: 36, left: 16, right: 16, bottom: 26),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    getHomepageResponseModel.profilePicUrl,
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 60,
                  margin: const EdgeInsets.only(top: 6),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getHomepageResponseModel.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextTheme.subtitle2.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      customBadgeGreen("Status : ${getHomepageResponseModel.status}"),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icon/bell-fill.svg',
                  semanticsLabel: 'notifikasi',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 4),
              Image.asset(
                'assets/icon/semester-calendar.png',
                width: 18,
                height: 18,
                // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Semester ${getHomepageResponseModel.semester}",
                  style: CustomTextTheme.subtitle3.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "IPK",
                style: CustomTextTheme.subtitle3.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 16),
              customBadgeGreen(getHomepageResponseModel.ipk.toString(), caption: true, width: 70),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 4),
              Image.asset(
                'assets/icon/semester-hourglass.png',
                width: 18,
                height: 18,
                // colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  "Tersisa ${getHomepageResponseModel.semesterLeft} semester lagi",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextTheme.subtitle3.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "SKS",
                style: CustomTextTheme.subtitle3.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 16),
              customBadgeRed(getHomepageResponseModel.sks.toString(), caption: true, width: 70),
            ],
          ),
        ],
      ),
    );
  }

  Widget backgroundWidget(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff3165A3),
              Color(0xff51A0AB),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuData {
  final String text;
  final String imgUri;
  final void Function() onTap;

  MenuData({
    required this.text,
    required this.imgUri,
    required this.onTap,
  });
}

// class MenuAcademicServiceData {
//   final String textFirst;
//   final String textSecond;
//   final String imgUri;
//   final void Function() onTap;

//   MenuAcademicServiceData({
//     required this.textFirst,
//     required this.textSecond,
//     required this.imgUri,
//     required this.onTap,
//   });
// }
