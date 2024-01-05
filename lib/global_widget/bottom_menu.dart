import 'package:bimo_app/features/chat_group/chat_list/page/chat_list_page.dart';
import 'package:bimo_app/features/homepage/page/homepage_page.dart';
import 'package:bimo_app/features/pengumuman/pemumuman_list/page/pengumuman_list_page.dart';
import 'package:bimo_app/features/profile/profile_detail/page/profile_detail_page.dart';
import 'package:bimo_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  List<Widget> page = [];
  final List<int> _indexList = [0];
  late int _counter;
  late int _pageCounter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
    _pageCounter = 0;
    page.add(const HomepagePage());
    page.add(const ChatListPage());
    page.add(const PengumumanListPage());
    page.add(const ProfileDetailPage());
    // page.add(DiskusiPage());
    // page.add(ProfilePage(
    //   navigateCallback: onTabTapped,
    //   navigatorPopCallback: onWillPop,
    // ));
    // page.add(NotificationPage(
    //   isForBottomMenu: true,
    //   navigatorPopCallback: onWillPop,
    // ));
  }

  Future<bool> onWillPop() async {
    if (_indexList.length > 1) {
      setState(() {
        _indexList.removeLast();
        _counter = _indexList.last;
        _pageCounter = _indexList.last;
      });
      return false;
    } else if (_indexList.length == 1) {
      return true;
    } else {
      return false;
    }
  }

  void onTabTapped(int index) {
    if (index < 4) {
      setState(() {
        _counter = index;
        _pageCounter = index;
        _indexList.add(index);
      });
    }
    // if (index == 3) {
    //   _launchURL();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: page[_indexList.last],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color(0xff979797),
          selectedItemColor: CustomColors.blueDefault,

          // style: TextStyle(fontSize: 12, color: Color(0xff868686)),
          unselectedLabelStyle: const TextStyle(color: Color(0xff979797)),
          selectedLabelStyle: const TextStyle(color: CustomColors.blueDefault),
          // backgroundColor: Colors.white,
          // showSelectedLabels: false,
          onTap: onTabTapped,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          // showUnselectedLabels: false,
          currentIndex: _counter,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 0),
                child: Image.asset(
                  _counter == 0 ? "assets/beranda_on.png" : "assets/beranda_off.png",
                  height: 24,
                  fit: BoxFit.fitHeight,
                ),
              ),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 0),
                child: Image.asset(
                  _counter == 1 ? "assets/chat_on.png" : "assets/chat_off.png",
                  height: 24,
                  fit: BoxFit.fitHeight,
                ),
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 0),
                child: Image.asset(
                  _counter == 2 ? "assets/pengumuman_on.png" : "assets/pengumuman_off.png",
                  height: 24,
                  fit: BoxFit.fitHeight,
                ),
              ),
              label: "Pengumumam",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 0),
                child: Image.asset(
                  _counter == 3 ? "assets/profil_on.png" : "assets/profil_off.png",
                  height: 24,
                  fit: BoxFit.fitHeight,
                ),
              ),
              label: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}
