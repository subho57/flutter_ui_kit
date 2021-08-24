import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMSigninScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMSplashScreen extends StatefulWidget {
  static String tag = '/HMSplashScreen';

  @override
  HMSplashScreenState createState() => HMSplashScreenState();
}

class HMSplashScreenState extends State<HMSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Timer(Duration(seconds: 2), () {
      finish(context);
      HMSignInScreen().launch(context);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HMColorSecondary,
      body: Hero(tag: "handyman_logo", child: Image.asset('images/handyman/hm_handyman_logo_2.png')).center(),
    );
  }
}
