import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAReserveCardComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FAReserveCardScreen extends StatefulWidget {
  static String tag = '/FAReserveCardScreen';

  @override
  FAReserveCardScreenState createState() => FAReserveCardScreenState();
}

class FAReserveCardScreenState extends State<FAReserveCardScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_primary,
      statusBarIconBrightness: Brightness.dark,
    );
  }

  @override
  void dispose() {
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
      statusBarIconBrightness: Brightness.dark,
    );
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              width: context.width(),
              height: context.height() * 0.5,
              decoration: faGradientBoxDecoration(),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ).paddingOnly(left: 16, top: 16).onTap(() {
                    finish(context);
                  }),
                  Image.asset(fa_credit_card_one, width: 240, height: 240, fit: BoxFit.fill).center(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FittedBox(child: FAReserveCardComponent()),
            ),
          ],
        ),
      ),
    );
  }
}
