import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHSignInScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHConstants.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:nb_utils/nb_utils.dart';

class RHSplashScreen extends StatefulWidget {
  static String tag = '/RMSplashScreen';

  @override
  RHSplashScreenState createState() => RHSplashScreenState();
}

class RHSplashScreenState extends State<RHSplashScreen> with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2))..repeat();
    startTime();
  }

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (mounted) {
      finish(context);
      RHSignInScreen().launch(context);
    }
  }

  @override
  void dispose() {
    controller.dispose();
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
        key: scaffoldKey,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (_, child) {
                  return Transform.rotate(angle: controller.value * 2, child: child);
                },
                child: Image.asset(RH_app_icon, height: 120, width: 120),
              ),
              30.height,
              Text(RHAppName, style: boldTextStyle(size: 20))
            ],
          ),
        ),
      ),
    );
  }
}
