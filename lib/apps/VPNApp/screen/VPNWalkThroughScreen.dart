import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNLoginOptionScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNImages.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main/utils/AppWidget.dart';

class VPNWalkThroughScreen extends StatefulWidget {
  static String tag = '/VPNWalkThroughScreen';

  @override
  VPNWalkThroughScreenState createState() => VPNWalkThroughScreenState();
}

class VPNWalkThroughScreenState extends State<VPNWalkThroughScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int tabIndex = 0;

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
    setStatusBarColor(vpnBackgroundColor, statusBarIconBrightness: Brightness.light);
    return SafeArea(
      child: Scaffold(
        backgroundColor: vpnBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: context.width() * 0.9,
              child: PageView(
                onPageChanged: (index) {
                  tabIndex = index;
                  setState(() {});
                },
                controller: _pageController,
                //physics: NeverScrollableScrollPhysics(),
                children: [
                  OnBoardScreenData(
                    title: "Secure browsing with no limits",
                    subtitle: "Unlock your limit with over 150+ ever around the world",
                    imageTitle: onBoardScreenImg,
                  ),
                  OnBoardScreenData(
                    title: "Super fasting streaming",
                    subtitle: "Unlock your limit with over 150+ ever around the world",
                    imageTitle: onBoardScreenImg,
                  ),
                  OnBoardScreenData(
                    title: "Block malware and phising",
                    subtitle: "Unlock your limit with over 150+ ever around the world",
                    imageTitle: onBoardScreenImg,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: tabIndex == 0 ? 8 : 5, backgroundColor: tabIndex == 0 ? appPrimaryColor : white),
                12.width,
                CircleAvatar(radius: tabIndex == 1 ? 8 : 5, backgroundColor: tabIndex == 1 ? appPrimaryColor : white),
                12.width,
                CircleAvatar(radius: tabIndex == 2 ? 8 : 5, backgroundColor: tabIndex == 2 ? appPrimaryColor : white),
              ],
            ),
            Column(
              children: [
                Text(
                  "Start your 7-day free trial \nthen \$12.99 per month",
                  style: boldTextStyle(color: white),
                  textAlign: TextAlign.center,
                ).center(),
                24.height,
                commonButton(context: context, title: "Subscribe with 7-day trial").onTap(() {
                  VPNLoginOptionScreen().launch(context);
                }),
                24.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign in", style: boldTextStyle(color: white)).onTap(() {
                      finish(context);
                      VPNLoginOptionScreen().launch(context);
                    }),
                    CircleAvatar(backgroundColor: grey, radius: 4).paddingSymmetric(horizontal: 16),
                    Text("Restore Purchase", style: boldTextStyle(color: white)),
                  ],
                ),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}

class OnBoardScreenData extends StatelessWidget {
  final String title;
  final String imageTitle;
  final String subtitle;

  const OnBoardScreenData({Key key, this.title, this.imageTitle, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: boldTextStyle(color: white, size: 32), textAlign: TextAlign.center),
        16.height,
        commonCacheImageWidget(onBoardScreenImg, 150, fit: BoxFit.cover).expand(),
        16.height,
        Text(subtitle, style: boldTextStyle(color: white, size: 20), textAlign: TextAlign.center),
      ],
    ).paddingSymmetric(horizontal: 32);
  }
}
