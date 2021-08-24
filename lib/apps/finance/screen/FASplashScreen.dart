import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FASignInScreen.dart';

class FASplashScreen extends StatefulWidget {
  static String tag = '/FASplashScreen';

  @override
  FASplashScreenState createState() => FASplashScreenState();
}

class FASplashScreenState extends State<FASplashScreen> with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.seconds.delay;

    finish(context);
    FASignInScreen().launch(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Image.asset(fa_app_logo, height: 120, width: 120, fit: BoxFit.fill).center(),
    );
  }
}
