import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSelectLanguageScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGWifiAndAppScreen extends StatefulWidget {
  static String tag = '/EGWifiAndAppScreen';

  @override
  EGWifiAndAppScreenState createState() => EGWifiAndAppScreenState();
}

class EGWifiAndAppScreenState extends State<EGWifiAndAppScreen> {
  bool isDark = false;

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
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Wifi & App", elevation: 0, center: true, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Wifi", style: boldTextStyle(size: 20)),
            16.height,
            settingList(title: "Device-2215", subtitle: "Connected", iconLeading: MaterialIcons.cast_connected, iconTrailing: Icons.signal_cellular_alt),
            16.height,
            settingList(title: "Device-4485", subtitle: "WPA2 / PSK", iconLeading: MaterialIcons.cast_connected, iconTrailing: Icons.signal_cellular_alt),
            32.height,
            Text("App Setting", style: boldTextStyle(size: 20)),
            16.height,
            settingListWithSwitch(
              title: "Dark Mode",
              subtitle: "Dark mode will arrive soon",
              trailing: CupertinoSwitch(
                onChanged: (val) {
                  isDark = val;
                  setState(() {});
                },
                value: isDark,
                activeColor: egPrimaryColor1,
              ),
            ),
            16.height,
            settingList(title: "App Permission", iconTrailing: Icons.keyboard_arrow_right),
            16.height,
            settingList(
              title: "Language: English",
              iconTrailing: Icons.keyboard_arrow_right,
            ).onTap(() {
              EGSelectLanguageScreen().launch(context);
            }),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
