import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MBVerifyAccountScreen extends StatefulWidget {
  @override
  MBVerifyAccountScreenState createState() => MBVerifyAccountScreenState();
}

class MBVerifyAccountScreenState extends State<MBVerifyAccountScreen> {
  int _counter = 60;
  Timer _timer;
  var onTapRecognizer;
  String currentText = "";

  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController;

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
    init();
  }

  init() async {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        finish(context);
      };
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AppButton(
          text: MBBtnContinue,
          elevation: 12.0,
          onTap: () {
            finish(context);
            MBDashBoardScreen().launch(context);
          },
          color: appPrimaryColor,
          width: context.width(),
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        ).paddingAll(24),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MBVerifyTitleText, style: boldTextStyle(size: 26)),
              24.height,
              Text(MBVerifySubTitleText, style: secondaryTextStyle(size: 16)),
              8.height,
              Text(MBCodeText, style: secondaryTextStyle(size: 16, color: Colors.blue, decoration: TextDecoration.underline)),
              44.height,
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                length: 4,
                showCursor: false,
                animationType: AnimationType.fade,
                errorTextSpace: 30,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  inactiveColor: appStore.isDarkModeOn ? appBarBackgroundColor : appPrimaryColor,
                  activeColor: appStore.isDarkModeOn ? appBarBackgroundColor : appPrimaryColor,
                  selectedFillColor: Colors.transparent,
                  selectedColor: appPrimaryColor,
                ),
                animationDuration: Duration(milliseconds: 300),
                textStyle: TextStyle(fontSize: 20, height: 1.6),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                onCompleted: (v) {},
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  return true;
                },
              ),
              34.height,
              Text.rich(
                TextSpan(
                  text: "This season will end in  $_counter seconds.\nDid't get code? ",
                  style: secondaryTextStyle(size: 16),
                  children: <TextSpan>[
                    TextSpan(text: "Resend Code", style: boldTextStyle(color: Colors.blue, size: 16, decoration: TextDecoration.underline)),
                  ],
                ),
              ).onTap(() {
                _startTimer();
              }),
              16.height,
            ],
          ).paddingOnly(right: 16, left: 16, bottom: 44, top: 44),
        ),
      ),
    );
  }
}
