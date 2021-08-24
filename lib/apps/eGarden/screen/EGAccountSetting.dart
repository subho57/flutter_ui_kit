import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGChangePasswordScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGAccountSetting extends StatefulWidget {
  static String tag = '/EGAccountSetting';

  @override
  EGAccountSettingState createState() => EGAccountSettingState();
}

class EGAccountSettingState extends State<EGAccountSetting> {
  bool isTwitter = true;
  bool isFB = true;
  bool isInsta = false;
  bool isDribble = false;

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
        appBar: appBarWidget("Account Settings", center: true, elevation: 0, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Password & Backup", style: boldTextStyle(size: 20)),
              16.height,
              settingList(title: "Change Password", iconTrailing: Icons.keyboard_arrow_right).onTap(() {
                EGChangePasswordScreen().launch(context);
              }),
              16.height,
              settingList(title: "Set Backup Email", iconTrailing: Icons.keyboard_arrow_right),
              16.height,
              Text("Connected", style: boldTextStyle(size: 20)),
              16.height,
              Card(
                child: Container(
                  color: appStore.cardColor,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          16.width,
                          commonCacheImageWidget(EGIconTwitter, 25),
                          16.width,
                          Text("Twitter", style: primaryTextStyle(size: 18)).expand(),
                          Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: isTwitter,
                              trackColor: gray,
                              onChanged: (val) {
                                isTwitter = val;
                                setState(() {});
                              },
                              activeColor: egPrimaryColor1,
                            ),
                          )
                        ],
                      ),
                      12.height,
                      Row(
                        children: [
                          16.width,
                          commonCacheImageWidget(EGIconFB, 25),
                          16.width,
                          Text("Facebook", style: primaryTextStyle(size: 18)).expand(),
                          Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: isFB,
                              trackColor: gray,
                              onChanged: (val) {
                                isFB = val;
                                setState(() {});
                              },
                              activeColor: egPrimaryColor1,
                            ),
                          )
                        ],
                      ),
                      12.height,
                      Row(
                        children: [
                          16.width,
                          commonCacheImageWidget(EGIconInstagram, 25),
                          16.width,
                          Text("Instagram", style: primaryTextStyle(size: 18)).expand(),
                          Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: isInsta,
                              trackColor: gray,
                              onChanged: (val) {
                                isInsta = val;
                                setState(() {});
                              },
                              activeColor: egPrimaryColor1,
                            ),
                          )
                        ],
                      ),
                      12.height,
                      Row(
                        children: [
                          16.width,
                          commonCacheImageWidget(EGIconDribble, 25),
                          16.width,
                          Text("Dribble", style: primaryTextStyle(size: 18)).expand(),
                          Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: isDribble,
                              trackColor: gray,
                              onChanged: (val) {
                                isDribble = false;
                                setState(() {});
                              },
                              activeColor: egPrimaryColor1,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
