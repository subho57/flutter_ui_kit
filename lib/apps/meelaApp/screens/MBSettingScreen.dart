import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBHelpAndSupportScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSettingScreen extends StatefulWidget {
  @override
  MBSettingScreenState createState() => MBSettingScreenState();
}

class MBSettingScreenState extends State<MBSettingScreen> {
  bool isCheck = true;
  bool isCheck1 = true;

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              22.height,
              Text('App Settings', style: boldTextStyle(size: 26)),
              8.height,
              Container(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      //height: 100,
                      width: context.width(),
                      color: appPrimaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          8.height,
                          Text('Do more with pro account', style: primaryTextStyle(color: Colors.white)),
                          4.height,
                          Text('Get Premium Now', style: boldTextStyle(color: Colors.white)),
                          16.height,
                          Text('Purchase Account', style: boldTextStyle(color: Colors.white, decoration: TextDecoration.underline))
                        ],
                      ).paddingOnly(left: 16),
                    ).cornerRadiusWithClipRRect(20).paddingOnly(top: 36),
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset(mb_trophy_logo, height: 70, width: 70, fit: BoxFit.cover).paddingOnly(right: 16),
                    ),
                  ],
                ),
              ),
              22.height,
              Row(
                children: [
                  Icon(Icons.notification_important_sharp, color: appPrimaryColor),
                  8.width,
                  Text('Get Notification', style: primaryTextStyle()).expand(),
                  Switch(
                    activeColor: appStore.isDarkModeOn ? appBarBackgroundColor : Colors.green,
                    activeTrackColor: Colors.grey,
                    inactiveTrackColor: Colors.grey,
                    value: isCheck,
                    onChanged: (val) {
                      isCheck = val;
                      setState(() {});
                    },
                  )
                ],
              ),
              Row(
                children: [
                  Icon(Icons.email, color: appPrimaryColor),
                  8.width,
                  Text('Email Newsletters', style: primaryTextStyle()).expand(),
                  Switch(
                    activeColor: appStore.isDarkModeOn ? appBarBackgroundColor : Colors.green,
                    activeTrackColor: Colors.grey,
                    inactiveTrackColor: Colors.grey,
                    value: isCheck1,
                    onChanged: (val) {
                      isCheck1 = val;
                      setState(() {});
                    },
                  )
                ],
              ),
              16.height,
              settingRowWidget(name: 'Privacy and Security', icon: Icons.security, icon1: Icons.arrow_forward_ios),
              22.height,
              settingRowWidget(name: 'Account Settings', icon: Icons.settings_sharp, icon1: Icons.arrow_forward_ios),
              22.height,
              settingRowWidget(name: 'Set Stock Rates', icon: Icons.rate_review, icon1: Icons.arrow_forward_ios),
              22.height,
              settingRowWidget(name: 'Date & Usage', icon: Icons.data_usage, icon1: Icons.arrow_forward_ios),
              22.height,
              settingRowWidget(name: 'Help & Support', icon: Icons.help, icon1: Icons.arrow_forward_ios).onTap(() {
                MBHelpAndSupportScreen(name: 'Help & Support').launch(context);
              }),
              22.height,
              settingRowWidget(name: 'Factory Reset', icon: Icons.block, icon1: Icons.arrow_forward_ios),
              22.height,
              AppButton(
                width: context.width(),
                color: appPrimaryColor,
                elevation: 12,
                onTap: () {},
                child: Text('Deactivate My Account', style: boldTextStyle(color: Colors.white)),
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
