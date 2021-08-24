import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGNewPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EGVerificationScreen extends StatefulWidget {
  static String tag = '/EGVerificationScreen';

  @override
  EGVerificationScreenState createState() => EGVerificationScreenState();
}

class EGVerificationScreenState extends State<EGVerificationScreen> {
  bool isPinBtnEnable = false;
  bool hasError = false;
  String currentText = "";

  // ignore: close_sinks
  StreamController<ErrorAnimationType> errorController;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("", elevation: 0, color: appStore.cardColor),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(alignment: Alignment.centerLeft, child: Text("Recovery", style: boldTextStyle(size: 32)).paddingOnly(top: 16, right: 16, left: 16)),
              8.height,
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "We've sent you recovery code",
                  style: secondaryTextStyle(),
                ),
              ).paddingSymmetric(horizontal: 16),
              40.height,
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                length: 5,
                showCursor: false,
                animationType: AnimationType.fade,
                errorTextSpace: 30,
                validator: (v) {
                  if (v.length < 3) {
                    return "Pin is not correct.please try again.";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeFillColor: Colors.transparent,
                  inactiveFillColor: Colors.transparent,
                  selectedFillColor: Colors.transparent,
                  selectedColor: Colors.grey,
                  inactiveColor: appPrimaryColor,
                ),
                animationDuration: Duration(milliseconds: 300),
                textStyle: primaryTextStyle(size: 20),
                backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.transparent,
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
              100.height,
              Text(
                "Make sure you already confirmed your email. By pressing button below, you'll get an email with recovery code. Input this code on the next page to reset to your password",
                style: secondaryTextStyle(),
                textAlign: TextAlign.center,
              ).paddingSymmetric(horizontal: 16),
              32.height,
              roundedButtonWithFillColor(
                context: context,
                btnText: "Reset Password",
                isEnable: isPinBtnEnable,
              ).paddingSymmetric(horizontal: 12).onTap(() {
                EGNewPasswordScreen().launch(context);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
