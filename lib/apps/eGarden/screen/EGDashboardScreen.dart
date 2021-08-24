import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eGarden/fragment/EGGardenFragment.dart';
import 'package:mighty_ui_kit/apps/eGarden/fragment/EGSettingFragment.dart';
import 'package:mighty_ui_kit/apps/eGarden/fragment/EGStoreFragment.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGProfileScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGDashboardScreen extends StatefulWidget {
  static String tag = '/EGDashboardScreen';

  @override
  EGDashboardScreenState createState() => EGDashboardScreenState();
}

class EGDashboardScreenState extends State<EGDashboardScreen> {
  int _selectedIndex = 0;

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

  void _onItemTapped(int index) {
    setState(() {});
    _selectedIndex = index;
  }

  static List<Widget> _widgetOptions = <Widget>[
    EGGardenFragment(),
    EGStoreFragment(),
    EGSettingFragment(),
    EGProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: appStore.isDarkModeOn ? white : gray,
          backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
          // selectedItemColor: egPrimaryColor1,
          selectedItemColor: appStore.isDarkModeOn ? egPrimaryColor1 : egPrimaryColor1,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Entypo.leaf), label: "Garden"),
            BottomNavigationBarItem(icon: Icon(Feather.shopping_cart), label: "Store"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
