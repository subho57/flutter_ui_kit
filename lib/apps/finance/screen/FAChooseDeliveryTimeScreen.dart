import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAChooseDeliveryComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FASentCardRequestScreen.dart';

class FAChooseDeliveryTimeScreen extends StatefulWidget {
  static String tag = '/FAChooseDeliveryTimeScreen';

  @override
  FAChooseDeliveryTimeScreenState createState() => FAChooseDeliveryTimeScreenState();
}

class FAChooseDeliveryTimeScreenState extends State<FAChooseDeliveryTimeScreen> {
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
    return Scaffold(
      body: Container(
        width: context.width(),
        decoration: faGradientBoxDecoration(),
        child: Stack(
          children: [
            faAppbarWidget(
              context,
              backgroundColor: Colors.transparent,
              title: "Choose delivery time",
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  16.height,
                  Image.asset(fa_credit_card_two, height: 160, width: 160, fit: BoxFit.fill).paddingAll(16),
                  30.height,
                  FAChooseDeliveryComponent(),
                ],
              ),
            ).paddingOnly(top: 64, bottom: 64),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: AppButton(
                color: fa_color_secondary,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Text("Request a card", style: boldTextStyle(color: white)),
                onTap: () {
                  FASentCardRequestScreen().launch(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
