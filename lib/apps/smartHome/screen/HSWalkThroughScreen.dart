import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSSignInScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSWalkThroughFourthScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSWalkThroughSecondScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSWalkThroughThirdScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSWalkthroughOneScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSWalkThroughScreen extends StatefulWidget {
  static String tag = '/HSWalkThroughScreen';

  @override
  HSWalkThroughScreenState createState() => HSWalkThroughScreenState();
}

class HSWalkThroughScreenState extends State<HSWalkThroughScreen> {
  int currentPage = 0;
  static const _kDuration = const Duration(milliseconds: 500);
  static const _kCurve = Curves.ease;
  PageController pageController = PageController();
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    widgets.add(HSWalkThroughOneScreen().paddingOnly(left: 18, right: 16));
    widgets.add(HSWalkThroughSecondScreen().paddingOnly(left: 18, right: 16));
    widgets.add(HSWalkThroughThirdScreen().paddingOnly(left: 18, right: 16));
    widgets.add(HSWalkThroughFourthScreen().paddingOnly(left: 18, right: 16));
  }

  @override
  void dispose() {
    //pageController?.dispose();
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
        key: globalScaffoldKey,
        body: Stack(
          children: [
            Container(
              height: context.height(),
              width: context.width(),
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: widgets,
                onPageChanged: (i) {
                  currentPage = i;
                  setState(() {});
                },
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Container(
                width: context.width(),
                height: 50,
                margin: EdgeInsets.only(left: 18, right: 16),
                child: RaisedButton(
                  onPressed: () {
                    if (currentPage == 3) {
                      HSSignInScreen().launch(context);
                    } else {
                      pageController.nextPage(duration: _kDuration, curve: _kCurve);
                    }
                  },
                  color: hsColorAccent,
                  child: Text(currentPage == 3 ? 'Login' : "Next", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: DotIndicator(
                  pageController: pageController,
                  pages: widgets,
                  indicatorColor: hsColorAccent,
                  unselectedIndicatorColor: Colors.grey,
                ),
              ),
            ),
          ],
        ).paddingOnly(top: 30),
      ),
    );
  }
}
