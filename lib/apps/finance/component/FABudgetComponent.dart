import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FABudgetComponent extends StatefulWidget {
  static String tag = '/FABudgetComponent';

  @override
  FABudgetComponentState createState() => FABudgetComponentState();
}

class FABudgetComponentState extends State<FABudgetComponent> {
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
    return Container(
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithShadow(borderRadius: radius(12), backgroundColor: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Left to Spend', style: secondaryTextStyle()),
                  4.height,
                  Text('\$262', style: boldTextStyle(size: 20, color: fa_color_secondary)),
                ],
              ),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monthly Budget', style: secondaryTextStyle()),
                  4.height,
                  Text('\$380', style: boldTextStyle(size: 20)),
                ],
              ),
            ],
          ),
          16.height,
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 20,
              valueColor: AlwaysStoppedAnimation<Color>(fa_color_secondary),
              backgroundColor: Colors.grey[200],
            ),
          ),
          16.height,
          Row(
            children: [
              Image.asset(fa_fire, height: 24, width: 24, fit: BoxFit.fill),
              8.width,
              Text('Awesome, your spend is on track!', style: secondaryTextStyle()),
            ],
          ),
        ],
      ),
    ).paddingAll(16);
  }
}
