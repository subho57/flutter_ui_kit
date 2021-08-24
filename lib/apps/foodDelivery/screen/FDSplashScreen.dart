import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FDSplashScreen extends StatefulWidget {
  static String tag = '/FDSplashScreen';

  @override
  FDSplashScreenState createState() => FDSplashScreenState();
}

class FDSplashScreenState extends State<FDSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      finish(context);
      FDWalkThroughScreen().launch(context);
    });
    init();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FDPrimaryColor,
      body: Text('FOODDOOR', style: boldTextStyle(color: FDSecondaryColor, size: 50)).center(),
    );
  }
}
