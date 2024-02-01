import 'package:bimo_app/features/ipk_sks/ipk_sks_list/page/ipk_sks_list_page.dart';
import 'package:bimo_app/features/ruangan/fakultas_page.dart';
import 'package:bimo_app/features/ruangan/gedung_list/page/gedung_list_page.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class RuanganMainPage extends StatefulWidget {
  const RuanganMainPage({Key? key}) : super(key: key);

  @override
  State<RuanganMainPage> createState() => _RuanganMainPageState();
}

class _RuanganMainPageState extends State<RuanganMainPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: GlobalAppBar1(
                context: context,
                title: "Ruangan FILKOM",
                canPop: true,
              ),
              body: Column(
                children: [
                  // give the tab bar a height [can change hheight to preferred height]
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(0),
                    indicatorColor: CustomColors.blueSecondary,
                    labelColor: CustomColors.blackMamba,
                    unselectedLabelColor: CustomColors.blackMamba,
                    labelStyle: CustomTextTheme.subtitle2,
                    unselectedLabelStyle: CustomTextTheme.subtitle2,
                    tabs: const [
                      Tab(
                        text: 'Fakultas',
                        height: 40,
                      ),

                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Gedung',
                        height: 40,
                      ),
                    ],
                  ),
                  // tab bar view here
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        // first tab bar view widget
                        FakultasPage(),

                        // second tab bar view widget
                        GedungListPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// GlobalAppBar2(
//         context: context,
//         title: "Rancangan Kuliah",
//         subtitle: "Form PA-02",
//         canPop: true,
//         actions: [
//           GlobalAppBarActionsButton(
//             iconData: Icons.tune_sharp,
//             onPressed: () {},
//           ),
//         ],
//       ),
