import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBTransferSuccessFullScreen extends StatefulWidget {
  @override
  MBTransferSuccessFullScreenState createState() => MBTransferSuccessFullScreenState();
}

class MBTransferSuccessFullScreenState extends State<MBTransferSuccessFullScreen> {
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
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(mb_successfully1, width: 220, height: 220, color: white),
                24.height,
                Text(MBTextTransferSuccessfulTitle, style: boldTextStyle(size: 26, color: white), textAlign: TextAlign.center),
                24.height,
                Text(MBTextTransferSuccessfulSubTitle, style: primaryTextStyle(size: 16, color: white), textAlign: TextAlign.center),
              ],
            ),
            44.height,
            Column(
              children: [
                AppButton(
                  child: Text(MBBtnViewDetail, style: boldTextStyle(color: appStore.isDarkModeOn ? white : appPrimaryColor, size: 14)),
                  onTap: () {},
                  color: appStore.isDarkModeOn ? appStore.cardColor : white,
                  width: context.width(),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                8.height,
                AppButton(
                  child: Text(MBBtnContinue, style: boldTextStyle(color: appStore.isDarkModeOn ? white : appPrimaryColor, size: 14)),
                  onTap: () {
                    MBDashBoardScreen().launch(context);
                  },
                  color: appStore.isDarkModeOn ? appStore.cardColor : white,
                  width: context.width(),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
              ],
            ),
          ],
        ).paddingAll(32),
      ),
    );
  }
}
