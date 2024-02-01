import 'package:bimo_app/features/chat_group/chat_list/model/chat_user_model.dart';
import 'package:bimo_app/global_widget/error_widget.dart';
import 'package:bimo_app/global_widget/global_app_bar.dart';
import 'package:bimo_app/global_widget/loading_widget.dart';
import 'package:bimo_app/global_widget/no_internet_widget.dart';
import 'package:bimo_app/global_widget/under_maintenance_widget.dart';
import 'package:bimo_app/injection_container.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:bimo_app/utils/storage_utils.dart';
import 'package:bimo_app/utils/text_theme_utils.dart';
import 'package:flutter/scheduler.dart';

import 'package:bimo_app/features/login/page/login_page.dart';
import '../bloc/chat_detail_bloc.dart';
import '../bloc/chat_detail_state.dart';
import '../model/get_chat_detail_model.dart';
import '../model/records_model.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  final ChatUserModel receiver;

  const ChatDetailPage({
    super.key,
    required this.receiver,
  });

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ChatDetailBloc chatDetailBloc = sl<ChatDetailBloc>();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  late String user_id;

  final TextEditingController _textController = TextEditingController();

  bool _isWriting = false;

  @override
  void initState() {
    user_id = StorageUtils.getUserId()!;
    _refresh();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    chatDetailBloc.dispose();
  }

  void addChatDetailResponseModel() {}

  Widget listItem(GetChatDetailResponseModel chatDetailModel) {
    return InkWell(
      onTap: addChatDetailResponseModel,
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

  Widget chatItemWidget(ChatItem chatItem) {
    if (chatItem.senderId.toString() == user_id) {
      return chatCurrentUserWidget(chatItem);
    } else {
      return chatOtherUserWidget(chatItem);
    }
  }

  void _submitMsg() {
    if (_textController.text.isNotEmpty) {
      chatDetailBloc.submitChatDetail(target_id: widget.receiver.id, konten: _textController.text).then((value) {
        if (value is SubmitChatDetailSuccess) {
          _refresh();
          _textController.clear();
        } else {
          _showSnackbar(value.message);
        }
      });
    }
  }

  Widget chatCurrentUserWidget(ChatItem chatItem) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 11, right: 11, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 65),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8), topRight: Radius.zero),
              color: CustomColors.blueSky,
            ),
            padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
            child: Text(
              chatItem.konten,
              style: CustomTextTheme.overline.copyWith(color: CustomColors.blackMamba),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatOtherUserWidget(ChatItem chatItem) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(
              widget.receiver.profilePicUrl,
              height: 50.0,
              width: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.zero, bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
              color: CustomColors.blueTeritiary,
            ),
            padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              chatItem.konten,
              style: CustomTextTheme.overline.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget bottomBarWidget() {
    return Container(
      color: CustomColors.blueTeritiary,
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.attach_file,
              color: Colors.white,
            ),
            color: Colors.white,
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.white,
              ),
              child: TextField(
                controller: _textController,
                onChanged: (String txt) {
                  setState(() {
                    _isWriting = txt.isNotEmpty;
                  });
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(color: Colors.grey[600], fontSize: 17.0),
                decoration: InputDecoration.collapsed(hintText: 'Type new message', hintStyle: TextStyle(color: Colors.grey[600])),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
            color: Colors.white,
            onPressed: _submitMsg,
          ),
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    chatDetailBloc.refreshChatDetail(receiver_id: widget.receiver.id).then((value) async {
      if (value is GetChatDetailJWTError) {
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
          resizeToAvoidBottomInset: true,
          appBar: GlobalAppBar1(
            context: context,
            title: widget.receiver.name,
            canPop: true,
            actions: [
              GlobalAppBarActionsButton(
                iconData: Icons.more_vert,
                onPressed: () {},
              ),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: bottomBarWidget(),
          ),
          body: RefreshIndicator(
            key: _refreshIndicatorKey,
            onRefresh: _refresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: StreamBuilder<GetChatDetailState>(
                initialData: chatDetailBloc.getInitialChatDetailState,
                stream: chatDetailBloc.getChatDetailState,
                builder: (context, snapshot) {
                  if (snapshot.data is GetChatDetailLoading) {
                    return const LoadingWidget();
                  } else if (snapshot.data is GetChatDetailClientError) {
                    return const UnderMaintenanceWidget();
                  } else if (snapshot.data is GetChatDetailInternetError) {
                    return const NoInternetWidget();
                  } else if (snapshot.data is GetChatDetailSuccess) {
                    GetChatDetailResponseModel data = (snapshot.data as GetChatDetailSuccess).getChatDetailResponseModel;
                    return ListView.builder(
                      itemCount: data.records.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 8, bottom: 24, left: 16, right: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return chatItemWidget(data.records[index]);
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
