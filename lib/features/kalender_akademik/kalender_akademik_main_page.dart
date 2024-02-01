import 'package:bimo_app/features/ipk_sks/ipk_sks_list/page/ipk_sks_list_page.dart';
import 'package:bimo_app/global_widget/custom_shadow.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/material.dart';

class KalenderAkademikMainPage extends StatefulWidget {
  const KalenderAkademikMainPage({Key? key}) : super(key: key);

  @override
  State<KalenderAkademikMainPage> createState() => _KalenderAkademikMainPageState();
}

class _KalenderAkademikMainPageState extends State<KalenderAkademikMainPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget itemWidget({required Widget child}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: customShadow,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(6.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: child,
          ),
        ),
      ),
    );
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
                title: "Kalender Akademik",
                canPop: true,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    itemWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Daftar Ulang Mahasiswa Baru",
                            maxLines: 2,
                            style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Jalur SNMPTN",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                              Text(
                                " = ",
                                maxLines: 2,
                                style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                              ),
                              Expanded(
                                child: Text(
                                  "12 - 30 Mei 2020",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Jalur SBMPTN",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                              Text(
                                " = ",
                                maxLines: 2,
                                style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                              ),
                              Expanded(
                                child: Text(
                                  "12 - 30 Mei 2020",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Jalur Mandiri",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                              Text(
                                " = ",
                                maxLines: 2,
                                style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                              ),
                              Expanded(
                                child: Text(
                                  "12 - 30 Mei 2020",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Pascasarjana",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                              Text(
                                " = ",
                                maxLines: 2,
                                style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                              ),
                              Expanded(
                                child: Text(
                                  "12 - 30 Mei 2020",
                                  maxLines: 2,
                                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    itemWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Pengisian KRS",
                                  maxLines: 2,
                                  style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "1 - 12 Juni 2020",
                            maxLines: 2,
                            style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    itemWidget(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Kegiatan PK-Maba",
                                  maxLines: 2,
                                  style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "24 Mei - 05 Juni 2020",
                            maxLines: 2,
                            style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
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
