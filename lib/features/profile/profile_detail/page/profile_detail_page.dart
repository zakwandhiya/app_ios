import 'package:bimo_app/features/profile/profile_edit/page/profile_edit_guardian_page.dart';
import 'package:bimo_app/features/profile/profile_edit/page/profile_edit_page.dart';
import 'package:bimo_app/features/profile/profile_edit/page/profile_edit_socmed_page.dart';
import 'package:bimo_app/global_widget/custom_badge_widget.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/global_button.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/profile_detail_bloc.dart';
import '../model/get_profile_detail_model.dart';
import '../bloc/profile_detail_state.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:flutter/material.dart';

class ProfileDetailPage extends StatefulWidget {
  // final String id;

  const ProfileDetailPage({
    super.key,
    // required this.id,
  });

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfileDetailBloc profileDetailBloc = sl<ProfileDetailBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    profileDetailBloc.dispose();
  }

  void addProfileDetailResponseModel() {}

  Widget listItem(GetProfileDetailResponseModel profileDetailModel) {
    return InkWell(
      onTap: addProfileDetailResponseModel,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            children: [
              Text(
                "",
                style: CustomTextTheme.body2.copyWith(color: CustomColors.blackDisabled),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    profileDetailBloc.getProfileDetail().then((value) async {
      if (value is GetProfileDetailJWTError) {
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
        duration: const Duration(seconds: 3),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: GlobalAppBar1(
        context: context,
        title: "Profil",
        canPop: false,
        actions: [
          GlobalAppBarActionsButton(
            iconData: Icons.more_vert,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('menu')),
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: StreamBuilder<GetProfileDetailState>(
            initialData: profileDetailBloc.getInitialProfileDetailState,
            stream: profileDetailBloc.getProfileDetailState,
            builder: (context, snapshot) {
              if (snapshot.data is GetProfileDetailLoading) {
                return const LoadingWidget();
              } else if (snapshot.data is GetProfileDetailClientError) {
                return const UnderMaintenanceWidget();
              } else if (snapshot.data is GetProfileDetailSuccess) {
                GetProfileDetailResponseModel data = (snapshot.data as GetProfileDetailSuccess).getProfileDetailResponseModel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    profileDetailUpper(data),
                    profileEditBar(
                      text: "Biodata Mahasiswa",
                      width: width,
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => ProfileEditPage(
                              profileDetailModel: data,
                            ),
                          ),
                        )
                            .then((value) {
                          if (value != null && value) {
                            _refresh();
                            _showSnackbar("Update Data Berhasil");
                          }
                        });
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 12, bottom: 4, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width),
                          lineConstruct(label: "Email", value: data.email),
                          lineConstruct(label: "Email Alternaif", value: data.emailAlternatif),
                          lineConstruct(label: "Nomor HP", value: data.nomorHp),
                          lineConstruct(label: "NIK/NIP", value: data.nikNip),
                          lineConstruct(label: "Alamat Malang", value: data.alamatMalang),
                          lineConstruct(label: "Alamat Asal", value: data.alamatAsal),
                          lineConstruct(label: "Hobby", value: data.hobby),
                        ],
                      ),
                    ),
                    profileEditBar(
                      text: "Data Orang Tua/Wali",
                      width: width,
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => ProfileEditGuardianPage(
                              profileDetailModel: data,
                            ),
                          ),
                        )
                            .then((value) {
                          if (value != null && value) {
                            _refresh();
                            _showSnackbar("Update Data Berhasil");
                          }
                        });
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 12, bottom: 4, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width),
                          lineConstruct(label: "Nama Orang Tua/Wali", value: data.namaOrangTuaWali),
                          lineConstruct(label: "Email Orang Tua/Wali", value: data.emailOrangTuaWali),
                          lineConstruct(label: "Nomor HP Orang Tua/Wali", value: data.nomorHpOrangTuaWali),
                          lineConstruct(label: "Alamat Orang Tua/Wali", value: data.alamatOrangTua),
                        ],
                      ),
                    ),
                    profileEditBar(
                      text: "Media Sosial",
                      width: width,
                      onPressed: () {
                        Navigator.of(context)
                            .push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => ProfileEditSocmedPage(
                              profileDetailModel: data,
                            ),
                          ),
                        )
                            .then((value) {
                          if (value != null && value) {
                            _refresh();
                            _showSnackbar("Update Data Berhasil");
                          }
                        });
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 12, bottom: 4, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: width),
                          lineConstruct(label: "Facebook ID", value: data.facebookId),
                          lineConstruct(label: "Instagram ID", value: data.instagramId),
                          lineConstruct(label: "Line ID", value: data.lineId),
                        ],
                      ),
                    ),
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

  Widget lineConstruct({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
        ),
        const SizedBox(height: 7),
        Text(
          value,
          textAlign: TextAlign.start,
          style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Container profileEditBar({
    required double width,
    required String text,
    required void Function() onPressed,
  }) {
    return Container(
      width: width,
      color: CustomColors.blackAsh,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
          ),
          GlobalTextButton(
            'Update',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Column profileDetailUpper(GetProfileDetailResponseModel data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            data.profilePic,
            height: 60.0,
            width: 60.0,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          data.nama,
          style: CustomTextTheme.subtitle2.copyWith(color: CustomColors.blackMamba),
        ),
        const SizedBox(height: 8),
        Text(
          "${data.prodi} - ${data.nim}",
          style: CustomTextTheme.overline.copyWith(color: CustomColors.blackSecondary),
        ),
        const SizedBox(height: 8),
        customBadgeGreen("Status : ${data.status}"),
        const SizedBox(height: 20),
      ],
    );
  }
}
