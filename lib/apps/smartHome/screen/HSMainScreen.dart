import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSNewSceneScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSRoomsListScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSUserProfileScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';

class HSMainScreen extends StatefulWidget {
  static String tag = '/HSMainScreen';

  @override
  HSMainScreenState createState() => HSMainScreenState();
}

class HSMainScreenState extends State<HSMainScreen> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  final List<Widget> pages = [
    HSDashBoardScreen(),
    HSRoomsListScreen(),
    HSNewSceneScreen(),
    HSUserProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalScaffoldKey,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: hsColorOrange),
        selectedItemColor: appPrimaryColor,
        backgroundColor: appStore.cardColor,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 3,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(HS_home_icon, color: Colors.grey, height: 22, width: 22),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(HS_rooms_icon, color: Colors.grey, height: 20, width: 20),
            label: 'Rooms',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(HS_clock_icon, color: Colors.grey, height: 20, width: 20),
            label: 'Automation',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(HS_user_icon, color: Colors.grey, height: 20, width: 20),
            label: 'User',
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
