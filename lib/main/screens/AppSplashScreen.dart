import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/services/BannerServices.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

import 'DashboardScreen.dart';

class AppSplashScreen extends StatefulWidget {
  static String tag = '/AppSplashScreen';

  @override
  AppSplashScreenState createState() => AppSplashScreenState();
}

class AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    remoteConfig = await setUpRemoteConfig().catchError(log);
    await Future.delayed(Duration(seconds: 2));

    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;

    finish(context);
    DashboardScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          SizedBox(),
          Image.asset('images/app/app_icon.png', height: 130),
          Text(MainAppName, style: boldTextStyle(size: 24)),
          SizedBox(),
        ],
      ).center(),
    );
  }
}
