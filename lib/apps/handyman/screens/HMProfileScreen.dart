import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMAddPaymentMethod.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class HMProfileScreen extends StatefulWidget {
  static String tag = '/HMProfileScreen';

  @override
  HMProfileScreenState createState() => HMProfileScreenState();
}

class HMProfileScreenState extends State<HMProfileScreen> {
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
        body: Stack(
          overflow: Overflow.visible,
          children: [
            Container(decoration: BoxDecoration(color: hmColorPrimary), height: 250),
            SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(width: context.width(), child: _buildStackData()).paddingOnly(top: context.height() * 0.2, bottom: 16),
                  ),
                  Positioned(
                      left: context.width() / 3,
                      top: context.height() / 9,
                      child: Container(
                        child: commonCacheImageWidget(hm_person1, context.width() / 3, fit: BoxFit.cover),
                        width: context.width() / 3,
                      ).cornerRadiusWithClipRRect(HMCornerRadius)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildStackData() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: appStore.cardColor),
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(child: Container(height: 180)),
              Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text("Selena Lennis", style: boldTextStyle(size: HMHeadingFontSize.toInt())),
                      Text("freeslab@gmail.com", style: secondaryTextStyle(size: 16)),
                    ],
                  ))
            ],
          ),
        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(left: 16, right: 16),
        Container(
          decoration: BoxDecoration(color: appStore.cardColor),
          child: Column(
            children: [
              _buildGeneralMEthod(icon: Icon(Icons.person_outline_outlined, color: HMColorWhite), title: "Account", color: hmColorPrimary, index: 0),
              Divider(thickness: 1, height: 0, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              _buildGeneralMEthod(icon: Icon(Icons.payment, color: HMColorWhite), title: "Payment Methods", color: hmColorPrimary, index: 1),
              Divider(thickness: 1, height: 0, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
              _buildGeneralMEthod(icon: Icon(Icons.notifications, color: HMColorWhite), title: "Notification", color: hmColorPrimary, index: 2),
            ],
          ),
        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16, left: 16, right: 16),
        Container(
            decoration: BoxDecoration(color: appStore.cardColor),
            child: Column(
              children: [
                _buildGeneralMEthod(icon: Icon(Icons.headset_mic_outlined, color: HMColorWhite), title: "Help", color: hmColorPrimary, index: 3),
                Divider(thickness: 1, height: 0, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                _buildGeneralMEthod(icon: Icon(Icons.lock, color: HMColorWhite), title: "Privacy Policy", color: hmColorPrimary, index: 4),
                Divider(thickness: 1, height: 0, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                _buildGeneralMEthod(icon: Icon(Icons.help_outline_rounded, color: HMColorWhite), title: "Terms of Use", color: hmColorPrimary, index: 5),
                Divider(thickness: 1, height: 0, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                _buildGeneralMEthod(icon: Icon(Icons.logout, color: HMColorWhite), title: "Logout", color: HMFontColor400, index: 6)
              ],
            )).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16, left: 16, right: 16),
      ],
    );
  }

  _buildGeneralMEthod({Icon icon, String title, Color color, int index}) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          child: icon,
          decoration: BoxDecoration(color: color),
        ).cornerRadiusWithClipRRect(16).paddingOnly(left: 4, right: 4),
        8.width,
        Text(title, style: secondaryTextStyle()).expand(),
        Icon(Icons.arrow_forward_ios, size: 12, color: HMFontColor400)
      ],
    ).paddingAll(8).onTap(
      () {
        if (index == 0) {
          toast("Account");
        } else if (index == 1) {
          HMAddPaymentMethod().launch(context);
        } else if (index == 2) {
          toast("Notification");
        } else if (index == 3) {
          toast("Help");
        } else if (index == 4) {
          toast("Privacy policy");
        } else if (index == 5) {
          toast("Terms and conditions");
        } else if (index == 6) {
          _buildLogoutDialog();
        }
      },
    );
  }

  _buildLogoutDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("want to logout?", style: primaryTextStyle()),
            actions: [
              Text("Cancel", style: TextStyle(color: hmColorPrimary, fontSize: 18)).paddingAll(8).onTap(() {
                finish(context);
              }),
              Text("Ok", style: TextStyle(color: hmColorPrimary, fontSize: 18)).paddingAll(8).onTap(() {
                finish(context);
              })
            ],
          );
        });
  }
}
