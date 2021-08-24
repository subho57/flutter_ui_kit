import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FASendMoneyScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FAHomeTopComponent extends StatefulWidget {
  static String tag = '/FAHomeTopComponent';

  @override
  FAHomeTopComponentState createState() => FAHomeTopComponentState();
}

class FAHomeTopComponentState extends State<FAHomeTopComponent> {
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
    return Stack(
      children: [
        Container(
          color: fa_color_primary,
          height: context.height() * 0.45,
          width: context.width(),
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Safe-to-spend', style: primaryTextStyle(color: Colors.white)),
              8.height,
              Row(
                children: [
                  Text("\$ 2,985213.64", style: boldTextStyle(color: Colors.white, size: 30)),
                  8.width,
                  Icon(Icons.info_outline_rounded, color: Colors.white70),
                ],
              ),
              8.height,
              Text('Updated 2 mins ago', style: secondaryTextStyle(color: Colors.white70)),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: boxDecorationRoundedWithShadow(
              26,
              backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
            ),
            height: 100,
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  homeWidget(icon: fa_top_up, title: "Top Up").onTap(() {
                    toast('click');
                  }),
                  homeWidget(icon: fa_transfer, title: "Transfer").onTap(() {
                    FASendMoneyScreen().launch(context);
                  }),
                  homeWidget(icon: fa_history, title: "History").onTap(() {
                    toast('click');
                  }),
                  homeWidget(icon: fa_atm, title: "ATM").onTap(() {
                    toast('click');
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
