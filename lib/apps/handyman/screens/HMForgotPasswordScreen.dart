import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMEmailVerificationScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMForgotPasswordScreen extends StatefulWidget {
  static String tag = '/HMForgotPasswordScreen';

  @override
  HMForgotPasswordScreenState createState() => HMForgotPasswordScreenState();
}

class HMForgotPasswordScreenState extends State<HMForgotPasswordScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Forgot Password", style: boldTextStyle(size: HMHeadingFontSize.toInt())),
                    Text(
                      "Please enter your email below and we will \nsend you the OTP code",
                      style: TextStyle(color: HMFontColor600, fontSize: HMFontSize),
                      textAlign: TextAlign.center,
                    ).paddingTop(18.0),
                    Container(
                      decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                      child: TextFormField(
                        autofocus: false,
                        style: secondaryTextStyle(),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(border: InputBorder.none, hintText: "Email", hintStyle: secondaryTextStyle(size: 16)),
                      ).paddingOnly(left: 8, top: 2),
                    ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16, bottom: 8)
                  ],
                ),
              ),
              20.height,
              CommonButton("Send").onTap(() {
                finish(context);
                HMEmailVerificationScreen().launch(context);
              })
            ],
          ).paddingAll(HMAppPadding),
        ),
      ),
    );
  }
}
