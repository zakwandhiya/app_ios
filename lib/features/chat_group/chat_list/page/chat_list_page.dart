import 'package:bimo_app/features/chat_group/chat_detail/page/chat_detail_page.dart';

import '../model/chat_user_model.dart';
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
import '../bloc/chat_list_bloc.dart';
import '../model/get_chat_list_model.dart';
import '../bloc/chat_list_state.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget {
  // final String id;

  const ChatListPage({
    super.key,
    // required this.id,
  });

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ChatListBloc chatListBloc = sl<ChatListBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    chatListBloc.dispose();
  }

  void addChatListResponseModel() {}

  Widget listItem(GetChatListResponseModel chatListModel) {
    return InkWell(
      onTap: addChatListResponseModel,
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

  Widget chatUserWidget(ChatUserModel recordsModel) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatDetailPage(receiver: recordsModel)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 11, right: 11, bottom: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                recordsModel.profilePicUrl,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recordsModel.name,
                  style: CustomTextTheme.body2.copyWith(color: CustomColors.blackSecondary),
                ),
                const SizedBox(height: 8),
                Text(
                  "Cek",
                  style: CustomTextTheme.caption.copyWith(color: CustomColors.blackTeritiary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    chatListBloc.getChatList().then((value) async {
      if (value is GetChatListJWTError) {
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
            title: "Chat",
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
              child: StreamBuilder<GetChatListState>(
                initialData: chatListBloc.getInitialChatListState,
                stream: chatListBloc.getChatListState,
                builder: (context, snapshot) {
                  if (snapshot.data is GetChatListLoading) {
                    return const LoadingWidget();
                  } else if (snapshot.data is GetChatListClientError) {
                    return const UnderMaintenanceWidget();
                  } else if (snapshot.data is GetChatListInternetError) {
                    return const NoInternetWidget();
                  } else if (snapshot.data is GetChatListSuccess) {
                    GetChatListResponseModel data = (snapshot.data as GetChatListSuccess).getChatListResponseModel;
                    return ListView.builder(
                      itemCount: data.records.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return chatUserWidget(data.records[index]);
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
