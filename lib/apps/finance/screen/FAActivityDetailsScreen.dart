import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/finance/component/FABillsMonthComponent.dart';
import 'package:mighty_ui_kit/apps/finance/component/FABudgetComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FAActivityDetailsScreen extends StatefulWidget {
  static String tag = '/FAActivityDetailsScreen';

  @override
  FAActivityDetailsScreenState createState() => FAActivityDetailsScreenState();
}

class FAActivityDetailsScreenState extends State<FAActivityDetailsScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(fa_color_primary);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fa_color_background,
      appBar: faAppbarWidget(
        context,
        title: '',
        backgroundColor: fa_color_background,
        iconColor: Colors.black,
        textColor: Colors.black,
        actions: [
          Icon(Icons.more_horiz_outlined),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: 35),
            width: context.width(),
            height: context.height(),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topLeft: 12, topRight: 12),
              backgroundColor: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Bills & Utilities', style: boldTextStyle(size: 22)),
                  16.height,
                  FABudgetComponent(),
                  Divider(),
                  FABillsMonthComponent(),
                ],
              ).paddingTop(80),
            ),
          ),
          Image.asset(fa_bills, height: 100, width: 100, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
