import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAReserveCardScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FAVerifyIdentityTypeComponent extends StatefulWidget {
  static String tag = '/FAVerifyIdentityTypeComponent';

  @override
  FAVerifyIdentityTypeComponentState createState() => FAVerifyIdentityTypeComponentState();
}

class FAVerifyIdentityTypeComponentState extends State<FAVerifyIdentityTypeComponent> {
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
          Text(
            "Let's get you verified!",
            style: boldTextStyle(),
          ).paddingOnly(top: 16, right: 16, left: 16),
          8.height,
          Text(
            'Which photo ID would you like to use?',
            style: secondaryTextStyle(),
          ).paddingOnly(right: 16, left: 16),
          8.height,
          SettingItemWidget(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
            leading: verifyIdentityCircleWidget(
              color1: Color(0xFF1761C5),
              color2: Color(0xFF0BB8E4),
              icon: fa_driving_license,
            ),
            title: "Driver's License",
            trailing: Icon(Icons.navigate_next_outlined),
            onTap: () {
              finish(context);
              FAReserveCardScreen().launch(context);
            },
          ),
          Divider().paddingOnly(left: 16, right: 16),
          SettingItemWidget(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
            leading: verifyIdentityCircleWidget(
              color1: Color(0xFF004932),
              color2: Color(0xFF00b167),
              icon: fa_card,
            ),
            title: "National Identity Card",
            trailing: Icon(Icons.navigate_next_outlined),
            onTap: () {
              finish(context);
              FAReserveCardScreen().launch(context);
            },
          ),
          Divider().paddingOnly(left: 16, right: 16),
          SettingItemWidget(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
            leading: verifyIdentityCircleWidget(
              color1: Color(0xFFde3524),
              color2: Color(0xFFF26333),
              icon: fa_passport,
            ),
            title: "Passport",
            trailing: Row(
              children: [
                Text('Recommended', style: boldTextStyle(color: fa_color_secondary, size: 12)),
                4.width,
                Icon(Icons.navigate_next_outlined),
              ],
            ),
            onTap: () {
              finish(context);
              FAReserveCardScreen().launch(context);
            },
          ),
        ],
      ).paddingOnly(top: 16, bottom: 16),
    );
  }
}
