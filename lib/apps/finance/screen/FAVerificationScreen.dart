import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAPersonalInfoScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../main.dart';

class FAVerificationScreen extends StatefulWidget {
  static String tag = '/FAVerificationScreen';

  @override
  FAVerificationScreenState createState() => FAVerificationScreenState();
}

class FAVerificationScreenState extends State<FAVerificationScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  TextEditingController pinController = TextEditingController();

  String currentText = "";

  Timer timer;
  int counter = 60;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (counter < 1) {
            timer.cancel();
          } else {
            counter = counter - 1;
          }
        },
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : fa_color_background,
      appBar: faAppbarWidget(
        context,
        title: '',
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
        iconColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        child: Text("Continue", style: boldTextStyle(color: white)),
        color: fa_color_secondary,
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        onTap: () {
          FAPersonalInfoScreen().launch(context);
        },
      ).paddingOnly(left: 16, right: 16, bottom: 16),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(fa_app_logo, height: 120, width: 120, fit: BoxFit.fill).center(),
            30.height,
            Text('Confirm', style: boldTextStyle(size: 30)),
            8.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fa_verify_code, style: primaryTextStyle()),
                Text('+1 (562) 859-4936', style: boldTextStyle(size: 14)),
              ],
            ),
            30.height,
            pinCodeTextFieldWidget(context, errorController: errorController, controller: pinController, onChanged: (value) {
              setState(() {
                currentText = value;
              });
            }),
            8.height,
            counter == 0
                ? Text("Resend", style: boldTextStyle(color: fa_color_primary, size: 14)).onTap(() {
                    startTimer();
                    counter = 60;
                    setState(() {});
                  })
                : Text("Resend code in $counter s", style: primaryTextStyle(size: 14, color: fa_color_primary)),
          ],
        ).center().paddingAll(16),
      ),
    );
  }
}
