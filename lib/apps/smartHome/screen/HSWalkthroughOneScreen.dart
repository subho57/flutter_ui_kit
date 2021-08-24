import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:nb_utils/nb_utils.dart';

class HSWalkThroughOneScreen extends StatefulWidget {
  static String tag = '/WalkThroughOneComponent';

  @override
  HSWalkThroughOneScreenState createState() => HSWalkThroughOneScreenState();
}

class HSWalkThroughOneScreenState extends State<HSWalkThroughOneScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Smart Home", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
          12.height,
          Text("You control all your Smart Home and enjoy Smart life", style: primaryTextStyle(size: 16, color: textSecondaryColorGlobal)),
          60.height,
          Image.asset(HS_home_blue_img, height: 300, fit: BoxFit.cover),
        ],
      ),
    );
  }
}
