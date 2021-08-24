import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSplashScreen extends StatefulWidget {
  @override
  MBSplashScreenState createState() => MBSplashScreenState();
}

class MBSplashScreenState extends State<MBSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      finish(context);
      return MBWalkThroughScreen().launch(context);
    });
    init();
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset(mb_bank_logo, height: 300, width: 300).cornerRadiusWithClipRRect(16), 16.height, Text('Bank Finance and \n Wallet UI Kit', textAlign: TextAlign.center, style: boldTextStyle())],
      ).center(),
    );
  }
}
