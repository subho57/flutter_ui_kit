import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGAccountSetting.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGNotificationScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGWifiAndAppScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class EGSettingFragment extends StatefulWidget {
  static String tag = '/EGSettingFragment';

  @override
  EGSettingFragmentState createState() => EGSettingFragmentState();
}

class EGSettingFragmentState extends State<EGSettingFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings", style: boldTextStyle(size: 32)),
            16.height,
            buildSearchBar(hintText: "Search in Settings"),
            16.height,
            Text("App Settings", style: boldTextStyle(size: 20)),
            16.height,
            settingListWithBoldTitle(
              title: "Wifi & App",
              subtitle: "Wifi and app settings",
              iconLeading: Icons.wifi,
            ).onTap(() {
              EGWifiAndAppScreen().launch(context);
            }),
            16.height,
            settingListWithBoldTitle(
              title: "Notifications",
              subtitle: "Notification & in-app messaging",
              iconLeading: Icons.notifications,
            ).onTap(() {
              EGNotificationScreen().launch(context);
            }),
            16.height,
            Text("Account & Support", style: boldTextStyle(size: 20)),
            16.height,
            settingListWithBoldTitle(
              title: "Account",
              subtitle: "Account & privacy settings",
              iconLeading: Icons.account_circle_sharp,
            ).onTap(() {
              EGAccountSetting().launch(context);
            }),
            16.height,
            settingListWithBoldTitle(title: "Contact Us", subtitle: "Ask anything about product", iconLeading: Icons.headset_mic),
          ],
        ),
      ).paddingAll(16),
    );
  }
}
