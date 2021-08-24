import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMCreateNewPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMEmailVerificationScreen extends StatefulWidget {
  static String tag = '/HMEmailVerificationScreen';

  @override
  HMEmailVerificationScreenState createState() => HMEmailVerificationScreenState();
}

class HMEmailVerificationScreenState extends State<HMEmailVerificationScreen> {
  FocusNode pin1FocusNode;
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          elevation: 0,
          leading: Icon(Icons.arrow_back).onTap(() {
            finish(context);
          }),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Email Verification", style: boldTextStyle(size: HMHeadingFontSize.toInt())),
                    Text(
                      "We send the OTP Code to your email, \nplease check it and enter below",
                      style: TextStyle(color: HMFontColor600, fontSize: HMFontSize),
                      textAlign: TextAlign.center,
                    ).paddingTop(18.0),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 60,
                            height: 55,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                              focusNode: pin1FocusNode,
                              style: secondaryTextStyle(size: 24),
                              textAlign: TextAlign.center,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                              onChanged: (value) {
                                nextField(value: value, focusNode: pin2FocusNode);
                                if (value.isEmpty) pin1FocusNode.unfocus();
                              },
                            ),
                          ).cornerRadiusWithClipRRect(HMCornerRadius),
                          Container(
                            width: 60,
                            height: 55,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                              focusNode: pin2FocusNode,
                              style: secondaryTextStyle(size: 24),
                              textAlign: TextAlign.center,
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                              onChanged: (value) {
                                nextField(value: value, focusNode: pin3FocusNode);
                                if (value.isEmpty) pin1FocusNode.requestFocus();
                              },
                            ),
                          ).cornerRadiusWithClipRRect(HMCornerRadius),
                          Container(
                            width: 60,
                            height: 55,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                                focusNode: pin3FocusNode,
                                style: secondaryTextStyle(size: 24),
                                textAlign: TextAlign.center,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                                onChanged: (value) {
                                  nextField(value: value, focusNode: pin4FocusNode);
                                  if (value.isEmpty) pin2FocusNode.requestFocus();
                                }),
                          ).cornerRadiusWithClipRRect(HMCornerRadius),
                          Container(
                            width: 60,
                            height: 55,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: TextFormField(
                              focusNode: pin4FocusNode,
                              style: secondaryTextStyle(size: 24),
                              textAlign: TextAlign.center,
                              autofocus: false,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                              onChanged: (value) {
                                pin4FocusNode.unfocus();
                                if (value.isEmpty) pin3FocusNode.requestFocus();
                              },
                            ),
                          ).cornerRadiusWithClipRRect(HMCornerRadius),
                        ],
                      ).paddingTop(16),
                    ),
                  ],
                ),
              ),
              CommonButton("Send").onTap(() {
                finish(context);
                HMCreateNewPasswordScreen().launch(context);
              }),
            ],
          ),
        ).paddingAll(HMAppPadding),
      ),
    );
  }
}
