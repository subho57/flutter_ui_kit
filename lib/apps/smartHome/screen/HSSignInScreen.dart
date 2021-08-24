import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSForgotPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSMainScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSSignInScreen extends StatefulWidget {
  static String tag = '/HSSignUpScreen';

  @override
  HSSignInScreenState createState() => HSSignInScreenState();
}

class HSSignInScreenState extends State<HSSignInScreen> {
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 22, bottom: 22),
            child: Form(
              key: signInFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Text("Sign In", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
                  20.height,
                  Text(
                    "Sign in by your ID to use our services and  other feature.",
                    style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? HS_colorPrimary : textSecondaryColorGlobal),
                    textAlign: TextAlign.center,
                  ).paddingOnly(left: 22, right: 22),
                  40.height,
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : HS_colorPrimary, boxShadow: appStore.isDarkModeOn ? [] : defaultBoxShadow()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextField(
                          controller: nameController,
                          textFieldType: TextFieldType.NAME,
                          focus: nameFocusNode,
                          nextFocus: emailFocusNode,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixStyle: TextStyle(color: Colors.white),
                            hintText: "Name",
                            hintStyle: TextStyle(color: textSecondaryColorGlobal),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                        Divider(color: appStore.isDarkModeOn ? white : Colors.grey),
                        AppTextField(
                          controller: emailController,
                          focus: emailFocusNode,
                          textFieldType: TextFieldType.EMAIL,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: textSecondaryColorGlobal),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                        //formWidget("Email", emailController, TextFieldType.EMAIL, "Compulsory"),
                      ],
                    ),
                  ),
                  16.height,
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: primaryTextStyle(size: 14, color: hsColorAccent, weight: FontWeight.bold),
                    ).onTap(() {
                      HSForgotPasswordScreen().launch(context);
                    }),
                  ).paddingOnly(right: 16),
                  40.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(HS_facebook_img, height: 40, width: 40).onTap(() {
                        HSMainScreen().launch(context);
                      }),
                      16.width,
                      Image.asset(HS_google_img, height: 40, width: 40),
                      16.width,
                      Image.asset(HS_twitter_img, height: 40, width: 40),
                    ],
                  ),
                  20.height,
                  Text("Or you can sign in with this account.", style: primaryTextStyle(size: 14)).paddingOnly(left: 22, right: 22),
                  Text("Connect to start with us.", style: primaryTextStyle(size: 14)).paddingOnly(left: 22, right: 22),
                  4.height,
                  AppButton(
                    width: context.width(),
                    onTap: () {
                      if (signInFormKey.currentState.validate()) {
                        finish(context);
                        finish(context);
                        HSMainScreen().launch(context);
                      }
                    },
                    color: hsColorAccent,
                    child: Text("Log In", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ).paddingOnly(left: 16, right: 16),
                  12.height,
                  Text(
                    "Don't you have an account?",
                    style: primaryTextStyle(size: 14, color: hsColorAccent, weight: FontWeight.bold),
                  ).onTap(() {
                    HSSignUpScreen().launch(context);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
