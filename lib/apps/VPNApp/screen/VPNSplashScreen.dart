import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNImages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main/utils/AppWidget.dart';

class VPNSplashScreen extends StatefulWidget {
  static String tag = '/VPNSplashScreen';

  @override
  VPNSplashScreenState createState() => VPNSplashScreenState();
}

class VPNSplashScreenState extends State<VPNSplashScreen> with SingleTickerProviderStateMixin {
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
      VPNWalkThroughScreen().launch(context);
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
        backgroundColor: vpnBackgroundColor,
        key: globalScaffoldKey,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: animation,
                child: commonCacheImageWidget(vpnLogo, 120, width: 120, fit: BoxFit.cover),
              ),
              10.height,
              Text("VPN App", style: primaryTextStyle(color: white, size: 24, weight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
