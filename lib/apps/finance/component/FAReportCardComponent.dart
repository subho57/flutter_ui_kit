import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAActivityDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FAReportCardComponent extends StatefulWidget {
  static String tag = '/FAReportCardComponent';

  @override
  FAReportCardComponentState createState() => FAReportCardComponentState();
}

class FAReportCardComponentState extends State<FAReportCardComponent> {
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
      margin: EdgeInsets.only(left: 16, right: 16),
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: boxDecorationRoundedWithShadow(26, backgroundColor: white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingItemWidget(
            leading: Image.asset(
              fa_up_arrow,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
            title: '\$684.12',
            titleTextStyle: boldTextStyle(size: 18),
            subTitle: 'income',
            trailing: Icon(Icons.navigate_next_outlined),
            onTap: () {
              FAActivityDetailsScreen().launch(context);
            },
          ),
          Divider(),
          SettingItemWidget(
            leading: Image.asset(
              fa_down_arrow,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
            title: '\$1451.12',
            titleTextStyle: boldTextStyle(size: 18),
            subTitle: 'expense',
            trailing: Icon(Icons.navigate_next_outlined),
            onTap: () {
              FAActivityDetailsScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}
