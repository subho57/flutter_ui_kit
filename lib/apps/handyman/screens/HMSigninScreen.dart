import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMDashBoard.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMForgotPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HMSignInScreen extends StatefulWidget {
  static String tag = '/HMSignInScreen';

  @override
  HMSignInScreenState createState() => HMSignInScreenState();
}

class HMSignInScreenState extends State<HMSignInScreen> {
  bool showPassword = false;

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //setStatusBarColor(hmColorPrimary);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(color: hmColorPrimary),
                      ).cornerRadiusWithClipRRect(16).paddingTop(50),
                      8.height,
                      Text(HMAppName, style: boldTextStyle(size: HMHeadingFontSize.toInt())),
                    ],
                  ),
                ),
                Container(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            focusNode: emailNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            style: secondaryTextStyle(),
                            onFieldSubmitted: (term) {
                              emailNode.unfocus();
                              FocusScope.of(context).requestFocus(passwordNode);
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or Phone number",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius),
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            focusNode: passwordNode,
                            autofocus: false,
                            obscureText: showPassword ? false : true,
                            keyboardType: TextInputType.emailAddress,
                            style: secondaryTextStyle(),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  showPassword = !showPassword;
                                  setState(() {});
                                },
                                child: Icon(showPassword ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                              ),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16, bottom: 16),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Text("Forgot Password?", style: boldTextStyle(color: hmColorPrimary)),
                        ).onTap(() {
                          HMForgotPasswordScreen().launch(context);
                        }),
                      ],
                    ),
                  ),
                ).paddingTop(32),
                Container(
                  child: Column(
                    children: [
                      CommonButton("Sign In").paddingOnly(top: 16, bottom: 16).onTap(() {
                        finish(context);
                        HMDashBoard().launch(context);
                      }),
                      Container(
                        width: context.width(),
                        color: appStore.cardColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(hm_google_logo, width: 25, height: 25),
                            Text("Connect with google", style: TextStyle(color: HMFontColor600, fontSize: HMFontSize)).paddingAll(16),
                          ],
                        ),
                      ).cornerRadiusWithClipRRect(HMCornerRadius),
                    ],
                  ),
                ).paddingTop(32),
                Container(
                  child: createRichText(list: [
                    TextSpan(text: "You don't have an account?", style: TextStyle(color: HMFontColor600)),
                    TextSpan(text: "Sign Up", style: boldTextStyle(color: hmColorPrimary)),
                  ]).onTap(() {
                    HMSignUpScreen().launch(context);
                    setState(() {});
                  }),
                ).paddingOnly(top: 32, bottom: 32)
              ],
            ),
          ),
        ).paddingOnly(top: HMAppPadding, left: HMAppPadding, right: HMAppPadding),
      ),
    );
  }
}
