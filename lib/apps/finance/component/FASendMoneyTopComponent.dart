import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FASendMoneyNextScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FASendMoneyTopComponent extends StatefulWidget {
  static String tag = '/FASendMoneyTopComponent';

  @override
  FASendMoneyTopComponentState createState() => FASendMoneyTopComponentState();
}

class FASendMoneyTopComponentState extends State<FASendMoneyTopComponent> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Send money', style: boldTextStyle(color: Colors.white, size: 24)),
        8.height,
        Text(
          'Select contact below or add new recipient to send money.',
          style: secondaryTextStyle(color: white),
          textAlign: TextAlign.center,
        ),
        32.height,
        AppButton(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              4.width,
              Text("Add recipient", style: boldTextStyle(color: white)),
            ],
          ),
          color: fa_color_secondary,
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
          onTap: () {
            FASendMoneyNextScreen().launch(context);
          },
        )
      ],
    ).paddingOnly(left: 32, right: 32, top: 16);
  }
}
