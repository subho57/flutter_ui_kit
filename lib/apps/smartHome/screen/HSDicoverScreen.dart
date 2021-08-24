import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSMainScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSDiscoverScreen extends StatefulWidget {
  static String tag = '/HSDiscoverScreen';

  @override
  HSDiscoverScreenState createState() => HSDiscoverScreenState();
}

class HSDiscoverScreenState extends State<HSDiscoverScreen> {
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

  // BHDashedBoardImage3
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Image.asset(
                HS_welcome_bg,
                fit: BoxFit.fill,
                width: context.width(),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
                  20.height,
                  Text(
                    "You can control all your Smart Home and enjoy Smart Life.",
                    style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? HS_colorPrimary : textSecondaryColorGlobal),
                  ).expand(),
                  AppButton(
                    width: context.width(),
                    onTap: () {
                      HSMainScreen().launch(context);
                    },
                    color: hsColorAccent,
                    child: Text("Discover Now", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ).paddingOnly(left: 24, right: 24, top: 30, bottom: 30),
            )
          ],
        ),
      ),
    );
  }
}
