import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FAVerificationScreen.dart';

class FASignInScreen extends StatefulWidget {
  static String tag = '/FALoginScreen';

  @override
  FASignInScreenState createState() => FASignInScreenState();
}

class FASignInScreenState extends State<FASignInScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  var phoneController = TextEditingController();

  FocusNode phoneFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
      statusBarIconBrightness: Brightness.dark,
    );
  }

  @override
  void dispose() {
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : fa_color_background,
      appBar: faAppbarWidget(
        context,
        title: '',
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
        iconColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          createRichText(
            textAlign: TextAlign.center,
            maxLines: 3,
            list: [
              TextSpan(text: "By using our mobile app, you agree to our", style: primaryTextStyle()),
              TextSpan(text: " Terms of Use", style: boldTextStyle(decoration: TextDecoration.underline)),
              TextSpan(text: " and", style: primaryTextStyle()),
              TextSpan(text: " Privacy Policy", style: boldTextStyle(decoration: TextDecoration.underline)),
            ],
          ),
          16.height,
          AppButton(
            width: context.width(),
            color: fa_color_secondary,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Text("Continue", style: boldTextStyle(color: white)),
            onTap: () {
              FAVerificationScreen().launch(context);
            },
          )
        ],
      ).paddingOnly(left: 16, right: 16, bottom: 16),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(fa_app_logo, height: 120, width: 120, fit: BoxFit.fill),
            30.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text('Sign in', style: boldTextStyle(size: 30)),
            ),
            8.height,
            Align(
              alignment: Alignment.topLeft,
              child: Text(fa_create_account_to_login, style: secondaryTextStyle()),
            ),
            30.height,
            Form(
              key: formKey,
              child: Column(
                children: [
                  phoneWithCountryPickerAppTextFiled(
                    controller: phoneController,
                    textFieldType: TextFieldType.PHONE,
                    focus: phoneFocus,
                  ),
                ],
              ),
            )
          ],
        ).center().paddingAll(16),
      ),
    );
  }
}
