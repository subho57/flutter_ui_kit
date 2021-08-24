import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/Fragment/BottomNavigationFragment/VPNHomeFragment.dart';
import 'package:mighty_ui_kit/apps/VPNApp/Fragment/BottomNavigationFragment/VPNLocationFragment.dart';
import 'package:mighty_ui_kit/apps/VPNApp/Fragment/BottomNavigationFragment/VPNPremiumFragment.dart';
import 'package:mighty_ui_kit/apps/VPNApp/Fragment/BottomNavigationFragment/VPNProfileFragment.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNDashboardScreen extends StatefulWidget {
  static String tag = '/VPNDashboard';

  @override
  VPNDashboardScreenState createState() => VPNDashboardScreenState();
}

class VPNDashboardScreenState extends State<VPNDashboardScreen> {
  int _selectedIndex = 0;
  var size = 100.0;

  _getBottomNavigationWidget(int index) {
    switch (index) {
      case 0:
        return new VPNHomeFragment();
      case 1:
        return new VPNLocationFragment();
      case 2:
        return new VPNProfileFragment();
      case 3:
        return new VPNPremiumFragment();
      default:
        return Text("No any Fragment");
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
    if (appStore.isDarkModeOn) {
      setStatusBarColor(scaffoldSecondaryDark, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: vpnBackgroundColor,
        body: _getBottomNavigationWidget(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 30,
            backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
            // selectedItemColor: vpnBackgroundColor,
            selectedItemColor: appStore.isDarkModeOn ? white : vpnBackgroundColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.star), label: '')
            ]).cornerRadiusWithClipRRect(16).paddingAll(8),
      ),
    );
  }
}
