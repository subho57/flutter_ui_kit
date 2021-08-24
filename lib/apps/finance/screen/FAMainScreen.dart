import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAHomeScreen.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAScanDocumentScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FAActivityScreen.dart';
import 'FAProfileScreen.dart';
import 'FASummaryScreen.dart';

class FAMainScreen extends StatefulWidget {
  static String tag = '/FAMainScreen';

  @override
  FAMainScreenState createState() => FAMainScreenState();
}

class FAMainScreenState extends State<FAMainScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(fa_color_primary);
  }

  @override
  void dispose() {
    setStatusBarColor(fa_color_secondary);
    super.dispose();
  }

  void onItemTapped(int index) {
    setState(() {});
    selectedIndex = index;
  }

  static List<Widget> widgetOptions = <Widget>[
    FAHomeScreen(),
    FAActivityScreen(),
    FAScanDocumentScreen(),
    FASummaryScreen(),
    FAProfileScreen(),
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
        activeColor: fa_color_secondary,
        height: 60,
        color: Colors.grey,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.local_activity, title: 'Activity'),
          TabItem(icon: Icons.settings_overscan, title: 'Scan'),
          TabItem(icon: Icons.money, title: 'Summary'),
          TabItem(icon: Icons.person_outline, title: 'Profile'),
        ],
        initialActiveIndex: selectedIndex,
        onTap: (int i) {
          onItemTapped(i);
        },
      ),
    );
  }
}
