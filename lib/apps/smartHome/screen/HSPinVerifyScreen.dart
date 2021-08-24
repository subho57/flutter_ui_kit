import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSDicoverScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class HSPinVerifyScreen extends StatefulWidget {
  static String tag = '/HSPinVerifyScreen';

  @override
  HSPinVerifyScreenState createState() => HSPinVerifyScreenState();
}

class HSPinVerifyScreenState extends State<HSPinVerifyScreen> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appStore.cardColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined, color: appStore.isDarkModeOn ? HS_colorPrimary : Colors.black),
            onPressed: () {
              finish(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 60, right: 24, left: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Verification Code", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
                  20.height,
                  Text(
                    "Enter the OTP send to  verification@mail.com & +91544545645",
                    style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? HS_colorPrimary : textSecondaryColorGlobal),
                    textAlign: TextAlign.center,
                  ),
                  40.height,
                  PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    length: 6,
                    obscureText: true,
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Resend",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary),
                    ),
                  ),
                  80.height,
                  AppButton(
                    width: context.width(),
                    onTap: () {
                      formKey.currentState.validate();
                      if (currentText.length != 6) {
                        hasError = false;
                        scaffoldKey.currentState.showSnackBar(SnackBar(
                          backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.black,
                          content: Text("Pin is not correct"),
                          duration: Duration(seconds: 2),
                        ));
                      } else {
                        setState(() {
                          errorController.add(ErrorAnimationType.shake); // Triggering error shake animation
                          setState(() {
                            hasError = true;
                            HSDiscoverScreen().launch(context);
                          });
                        });
                      }
                    },
                    color: hsColorAccent,
                    child: Text("Verify", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
