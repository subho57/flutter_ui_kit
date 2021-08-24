import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMHomeScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMInboxScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMProfileScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMTaskScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HMDashBoard extends StatefulWidget {
  static String tag = '/HMDashBoard';

  @override
  HMDashBoardState createState() => HMDashBoardState();
}

class HMDashBoardState extends State<HMDashBoard> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: index == 0
              ? HMHomeScreen()
              : index == 1
                  ? HMTaskScreen()
                  : index == 2
                      ? HMInboxScreen()
                      : index == 3
                          ? HMProfileScreen()
                          : Text("nothing"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          iconSize: 26,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: hmColorPrimary,
          unselectedItemColor: HMFontColor400,
          backgroundColor: appStore.cardColor,
          onTap: (bottomIndex) {
            index = bottomIndex;
            setState(() {});
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Task'),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.chat_bubble_outline).paddingTop(6),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(color: hmColorPrimary, borderRadius: BorderRadius.circular(64)),
                      child: Text("2", style: boldTextStyle(size: 10, color: HMColorWhite)).center(),
                    ),
                  ),
                ],
              ),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Profile')
          ],
        ).cornerRadiusWithClipRRectOnly(topRight: 32, topLeft: 32),
      ),
    );
  }
}
