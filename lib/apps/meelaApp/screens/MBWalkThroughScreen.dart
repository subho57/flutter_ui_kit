import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSignInScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBWalkThroughScreen extends StatefulWidget {
  @override
  MBWalkThroughScreenState createState() => MBWalkThroughScreenState();
}

class MBWalkThroughScreenState extends State<MBWalkThroughScreen> with AfterLayoutMixin<MBWalkThroughScreen> {
  PageController pageController = PageController();

  List<Widget> pages = [];
  double currentPage = 0;

  final _kDuration = Duration(milliseconds: 300);
  final _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    init();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(mb_bank_logo, height: 200, fit: BoxFit.cover).paddingOnly(top: 40),
          32.height,
          Text('Encrypted', style: boldTextStyle(size: 24)),
          16.height,
          Text(
            'Our new encrypted process makes \n it more secure between you \n and your bank',
            textAlign: TextAlign.center,
            style: secondaryTextStyle(size: 16),
          ),
        ],
      ).paddingOnly(top: 60),
      Column(
        children: [
          Image.asset(mb_bank_logo, height: 200, fit: BoxFit.cover).paddingOnly(top: 40),
          32.height,
          Text('Easy To Use', style: boldTextStyle(size: 24)),
          16.height,
          Text(
            'Manage your bank account,\n financial transaction. Its all \n easy like never before',
            textAlign: TextAlign.center,
            style: secondaryTextStyle(size: 16),
          ),
        ],
      ).paddingOnly(top: 60),
      Column(
        children: [
          Image.asset(mb_bank_logo, height: 200, fit: BoxFit.cover).paddingOnly(top: 40),
          32.height,
          Text('Fast & Secure', style: boldTextStyle(size: 24)),
          16.height,
          Text('Don\'t Worry about 3rd party\n Hacks. It is fast and secure', textAlign: TextAlign.center, style: secondaryTextStyle(size: 16)),
        ],
      ).paddingOnly(top: 60),
      Column(
        children: [
          Image.asset(mb_bank_logo, height: 200, fit: BoxFit.cover).paddingOnly(top: 40),
          32.height,
          Text('Watch Tutorial', style: boldTextStyle(size: 24)),
          16.height,
          Text(
            'if you are new on this and need \n help, watch this short tutorial clip to \n get started.',
            textAlign: TextAlign.center,
            style: secondaryTextStyle(size: 16),
          ),
        ],
      ).paddingOnly(top: 60),
    ];
    setState(() {});
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
      body: Stack(
        children: [
          PageView(controller: pageController, children: pages.map((e) => e).toList()),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Column(
              children: [
                AppButton(
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 12,
                  onTap: () {
                    pageController.nextPage(duration: _kDuration, curve: _kCurve);
                    if (currentPage == 3) {
                      finish(context);
                      MBSignUpScreen().launch(context);
                    }
                  },
                  width: context.width(),
                  child: Text(currentPage == 3 ? 'Let\'s create an account' : 'Next', style: boldTextStyle(color: Colors.white)),
                  color: appPrimaryColor,
                ).paddingSymmetric(horizontal: 16),
                8.height,
                Text(currentPage == 3 ? 'Already have an account ? Sign In' : 'Skip', style: secondaryTextStyle()).paddingAll(8).onTap(() {
                  if (currentPage == 3) {
                    MBSignInScreen().launch(context);
                  } else {
                    finish(context);
                    MBDashBoardScreen().launch(context);
                  }
                }),
                16.height,
                DotIndicator(pageController: pageController, pages: pages, indicatorColor: appPrimaryColor, unselectedIndicatorColor: grey),
              ],
            ),
          )
        ],
      ),
    );
  }
}
