import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FAMainScreen.dart';

class FASentCardRequestScreen extends StatefulWidget {
  static String tag = '/FASentCardRequestScreen';

  @override
  FASentCardRequestScreenState createState() => FASentCardRequestScreenState();
}

class FASentCardRequestScreenState extends State<FASentCardRequestScreen> {
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
        decoration: faGradientBoxDecoration(),
        child: Stack(
          children: [
            faAppbarWidget(
              context,
              backgroundColor: Colors.transparent,
              title: "",
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(fa_send_request, height: 140, width: 140, fit: BoxFit.fill),
                32.height,
                Text('Request sent', style: boldTextStyle(color: Colors.white, size: 20)),
                16.height,
                Text(
                  fa_send_request_text,
                  style: secondaryTextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                32.height,
                Container(
                  padding: EdgeInsets.only(top: 32, bottom: 32),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                    borderRadius: radius(12),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Estimated time arrival",
                        style: primaryTextStyle(size: 12),
                        textAlign: TextAlign.center,
                      ),
                      8.height,
                      Text(
                        DateFormat('EEEE - MMM dd, yyyy').format(DateTime.now()),
                        style: boldTextStyle(size: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ).paddingOnly(left: 32, right: 32)
              ],
            ).paddingOnly(top: 64, bottom: 64, right: 16, left: 16),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: AppButton(
                width: context.width(),
                child: Text("Got it", style: boldTextStyle(color: white)),
                color: fa_color_secondary,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                onTap: () {
                  FAMainScreen().launch(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
