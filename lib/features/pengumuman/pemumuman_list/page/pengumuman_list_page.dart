import 'package:bimo_app/features/pengumuman/pemumuman_list/model/records_model.dart';
import 'package:bimo_app/features/pengumuman/pengumuman_detail/pengumuman_detail.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/no_internet_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../bloc/pengumuman_list_bloc.dart';
import '../model/get_pengumuman_list_model.dart';
import '../bloc/pengumuman_list_state.dart';
import 'package:flutter/material.dart';

class PengumumanListPage extends StatefulWidget {
  // final String id;

  const PengumumanListPage({
    super.key,
    // required this.id,
  });

  @override
  _PengumumanListPageState createState() => _PengumumanListPageState();
}

class _PengumumanListPageState extends State<PengumumanListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PengumumanListBloc pengumumanListBloc = sl<PengumumanListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    pengumumanListBloc.dispose();
  }

  void addPengumumanListResponseModel() {}

  Widget listItem(GetPengumumanListResponseModel pengumumanListModel) {
    return InkWell(
      onTap: addPengumumanListResponseModel,
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

  Widget pengumumamWidget(RecordsModel recordsModel) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PengumumanDetailPage(recordsModel: recordsModel)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 11, right: 11, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                recordsModel.imgIcon,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                child: Text(
                  recordsModel.judul,
                  maxLines: 3,
                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackSecondary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    pengumumanListBloc.getPengumumanList().then((value) async {
      if (value is GetPengumumanListJWTError) {
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
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: GlobalAppBar1(
            context: context,
            title: "Pengumuman",
            canPop: false,
            actions: [
              GlobalAppBarActionsButton(
                iconData: IconlyLight.search,
                onPressed: () {},
              ),
              GlobalAppBarActionsButton(
                iconData: Icons.tune_sharp,
                onPressed: () {},
              ),
            ],
          ),
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: StreamBuilder<GetPengumumanListState>(
                initialData: pengumumanListBloc.getInitialPengumumanListState,
                stream: pengumumanListBloc.getPengumumanListState,
                builder: (context, snapshot) {
                  if (snapshot.data is GetPengumumanListLoading) {
                    return const LoadingWidget();
                  } else if (snapshot.data is GetPengumumanListClientError) {
                    return const UnderMaintenanceWidget();
                  } else if (snapshot.data is GetPengumumanListInternetError) {
                    return const NoInternetWidget();
                  } else if (snapshot.data is GetPengumumanListSuccess) {
                    GetPengumumanListResponseModel data = (snapshot.data as GetPengumumanListSuccess).getPengumumanListResponseModel;
                    return ListView.builder(
                      itemCount: data.records.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return pengumumamWidget(data.records[index]);
                      },
                    );
                  }

                  return const UnknownErrorWidget();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
