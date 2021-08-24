import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMSigninScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HMWalkThroughScreen extends StatefulWidget {
  static String tag = '/HMWalkThroughScreen';

  @override
  HMWalkThroughScreenState createState() => HMWalkThroughScreenState();
}

class HMWalkThroughScreenState extends State<HMWalkThroughScreen> {
  PageController _pageController;
  int pageIndex = 0;

  bool page1 = true;
  bool page2 = false;
  bool page3 = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _pageController = PageController(initialPage: pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: context.height() * 0.8,
                child: PageView(
                  onPageChanged: (index) {
                    pageIndex = index;
                    if (pageIndex == 0) {
                      page2 = false;
                      page3 = false;
                    }
                    if (pageIndex == 1) {
                      page2 = true;
                      page3 = false;
                    }
                    if (pageIndex == 2) {
                      page3 = true;
                    }
                    setState(() {});
                  },
                  controller: _pageController,
                  children: [
                    _buildWalkThroughData(
                      svgImage: hm_walkthrough_1,
                      title: "Professional Vendors",
                      subtitle: "We provide professional vendor for your all service needs\nwe satisfied here..!",
                    ),
                    _buildWalkThroughData(
                      svgImage: hm_walkthrough_2,
                      title: "At your Location",
                      subtitle: "We provide vendors to your nearest location area\nfor save your valuable time and money",
                    ),
                    _buildWalkThroughData(
                      svgImage: hm_walkthrough_3,
                      title: "Easy to pay",
                      subtitle: "We provide payment threw you card or any online pay-way\nfor your security and your comfortably",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 60, height: 5, color: page1 ? hmColorPrimary : HMFontColor400)
                            .cornerRadiusWithClipRRect(
                              HMCornerRadius,
                            )
                            .paddingOnly(left: 8, right: 8),
                        Container(width: 60, height: 5, color: page2 ? hmColorPrimary : HMFontColor400)
                            .cornerRadiusWithClipRRect(
                              HMCornerRadius,
                            )
                            .paddingOnly(left: 8, right: 8),
                        Container(width: 60, height: 5, color: page3 ? hmColorPrimary : HMFontColor400)
                            .cornerRadiusWithClipRRect(
                              HMCornerRadius,
                            )
                            .paddingOnly(left: 8, right: 8),
                      ],
                    ),
                  ),
                  16.height,
                  pageIndex == 2
                      ? CommonButton("Let's Start").onTap(() {
                          finish(context);
                          HMSignInScreen().launch(context);
                          setState(() {});
                        })
                      : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Container(
                            color: appStore.cardColor,
                            width: 150,
                            child: Text("Skip", textAlign: TextAlign.center, style: boldTextStyle()).paddingOnly(top: 16, bottom: 16),
                          ).onTap(() {
                            finish(context);
                            HMSignInScreen().launch(context);
                          }),
                          Container(
                            width: 150,
                            decoration: BoxDecoration(color: hmColorPrimary),
                            child: Text("Next", textAlign: TextAlign.center, style: boldTextStyle(color: HMColorWhite)).paddingOnly(top: 16, bottom: 16),
                          ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(() {
                            _pageController.animateToPage(++pageIndex, duration: Duration(milliseconds: 250), curve: Curves.easeInOutQuad);
                            if (pageIndex == 1) page2 = true;
                            if (pageIndex == 2) page3 = true;
                            setState(() {});
                          }),
                        ]),
                ],
              ),
            ),
          ],
        ).paddingAll(HMAppPadding),
      ),
    );
  }

  _buildWalkThroughData({String svgImage, String title, String subtitle}) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(svgImage, height: context.height() * 0.42),
          Text(title, style: boldTextStyle(size: HMHeadingFontSize.toInt())),
          Text(subtitle, style: TextStyle(fontSize: HMFontSize, color: HMFontColor600), textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
