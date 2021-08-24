import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAChooseDeliveryTimeScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class FAReserveCardComponent extends StatefulWidget {
  static String tag = '/FAReserveCardComponent';

  @override
  FAReserveCardComponentState createState() => FAReserveCardComponentState();
}

class FAReserveCardComponentState extends State<FAReserveCardComponent> {
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
      width: context.width(),
      height: context.height() * 0.5,
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: radius(12),
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reserve your card & get the benefits.', style: boldTextStyle(size: 22)),
            16.height,
            createPasswordWidget(title: "No monthly fees or minimum balance.", iconColor: fa_color_secondary),
            createPasswordWidget(title: "Pay bills earlier, sleep better.", iconColor: fa_color_secondary),
            createPasswordWidget(title: "Send money instantly.", iconColor: fa_color_secondary),
            30.height,
            AppButton(
              width: context.width(),
              color: fa_color_secondary,
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Text("Start", style: boldTextStyle(color: white)),
              onTap: () {
                FAChooseDeliveryTimeScreen().launch(context);
              },
            ),
            16.height,
            Text("Skip, I'll open account later", style: secondaryTextStyle()),
          ],
        ),
      ),
    );
  }
}
