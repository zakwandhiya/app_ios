import 'package:bimo_app/features/ipk_sks/ipk_sks_list/model/ipk_sks_item_model.dart';
import 'package:bimo_app/global_widget/custom_badge_widget.dart';
import 'package:bimo_app/global_widget/custom_shadow.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_rounded_rectangle_border.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/no_internet_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/ipk_sks_list_bloc.dart';
import '../model/get_ipk_sks_list_model.dart';
import '../bloc/ipk_sks_list_state.dart';
import 'package:flutter/material.dart';

class IpkSksListPage extends StatefulWidget {
  // final String id;

  const IpkSksListPage({
    super.key,
    // required this.id,
  });

  @override
  _IpkSksListPageState createState() => _IpkSksListPageState();
}

class _IpkSksListPageState extends State<IpkSksListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  IpkSksListBloc ipkSksListBloc = sl<IpkSksListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    ipkSksListBloc.dispose();
  }

  Widget ipkSksWidget(IpkSksItemModel recordsModel) {
    TextStyle line = CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary);
    double width = 130;
    Widget badgeIpk;
    switch (recordsModel.ipkStatus) {
      case "Excellent":
        badgeIpk = customBadgeGold("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      case "Normal":
        badgeIpk = customBadgeGreen("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      case "Kurang":
        badgeIpk = customBadgeOrange("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      case "Kritis":
        badgeIpk = customBadgeRed("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
        break;
      default:
        badgeIpk = customBadgeRed("IPK: " + recordsModel.ipkStatus, caption: false, width: width);
    }

    Widget badgeSks;
    switch (recordsModel.sksStatus) {
      case "Excellent":
        badgeSks = customBadgeGold("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      case "Normal":
        badgeSks = customBadgeGreen("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      case "Kurang":
        badgeSks = customBadgeOrange("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      case "Kritis":
        badgeSks = customBadgeRed("SKS: " + recordsModel.sksStatus, caption: false, width: width);
        break;
      default:
        badgeSks = customBadgeRed("SKS: " + recordsModel.sksStatus, caption: false, width: width);
    }
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
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Catatan Dosen PA",
                        maxLines: 2,
                        style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        recordsModel.catatan,
                        maxLines: 3,
                        style: CustomTextTheme.caption.copyWith(color: CustomColors.blackMamba),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        badgeIpk,
                        const SizedBox(height: 6),
                        badgeSks,
                        const SizedBox(height: 6),
                        Text(
                          "Semester " + recordsModel.semester.toString(),
                          maxLines: 1,
                          style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    ipkSksListBloc.getIpkSksList().then((value) async {
      if (value is GetIpkSksListJWTError) {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(
                // jwtErrorLogin: true,
                ),
          ),
        );
        if (result) {
          _refresh();
        }
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
          child: StreamBuilder<GetIpkSksListState>(
            initialData: ipkSksListBloc.getInitialIpkSksState,
            stream: ipkSksListBloc.getIpkSksListState,
            builder: (context, snapshot) {
              if (snapshot.data is GetIpkSksListLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetIpkSksListClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetIpkSksListEmpty) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: customShadow,
                        child: Card(
                          elevation: 0,
                          margin: const EdgeInsets.all(0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/daftar_riwayat.png",
                                  width: 100,
                                  fit: BoxFit.fitWidth,
                                ),
                                const Text(
                                  "Anda belum memiliki riwayat IPK & SKS",
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                );
              } else if (snapshot.data is GetIpkSksListInternetError) {
                return const NoInternetWidget();
              } else if (snapshot.data is GetIpkSksListSuccess) {
                GetIpkSksListResponseModel data = (snapshot.data as GetIpkSksListSuccess).getIpkSksListResponseModel;
                return Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListView.builder(
                        itemCount: data.records.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ipkSksWidget(data.records[index]);
                        },
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                );
              }

              return const UnknownErrorWidget();
            },
          ),
        ),
      ),
    );
  }
}
