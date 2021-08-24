import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

List<HSRoomListModel> getDashBoardList = getRoomList();

class HSSplashScreen extends StatefulWidget {
  static String tag = '/HSSplashScreen';

  @override
  HSSplashScreenState createState() => HSSplashScreenState();
}

class HSSplashScreenState extends State<HSSplashScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInQuad,
    );
    animationController.forward();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (mounted) {
      finish(context);
      HSWalkThroughScreen().launch(context);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
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
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: animation,
                child: commonCacheImageWidget(HS_home_blue_img, 120, width: 120, fit: BoxFit.cover),
              ),
              10.height,
              Text("Smart Home", style: primaryTextStyle(color: hsColorAccent, size: 24, weight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
