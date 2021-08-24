import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHForgotPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHMainScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHSignInScreen extends StatefulWidget {
  static String tag = '/RHSignInScreen';

  @override
  RHSignInScreenState createState() => RHSignInScreenState();
}

class RHSignInScreenState extends State<RHSignInScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  bool showPassword = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appPrimaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopCallback,
      child: SafeArea(
        key: scaffoldKey,
        child: Scaffold(
          backgroundColor: appPrimaryColor,
          body: Stack(
            children: <Widget>[
              Container(
                height: 200,
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 45),
                child: Text("Sign In", style: boldTextStyle(size: 22, color: white)),
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(top: 120),
                    height: context.height(),
                    width: context.width(),
                    padding: EdgeInsets.only(left: 16, right: 16, top: 30),
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: radiusOnly(topRight: 24, topLeft: 24),
                      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
                    ),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(26),
                                  backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100],
                                ),
                                child: AppTextField(
                                  controller: emailController,
                                  textFieldType: TextFieldType.EMAIL,
                                  focus: emailNode,
                                  autoFocus: false,
                                  nextFocus: passwordNode,
                                  textStyle: secondaryTextStyle(),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email or Phone number",
                                    hintStyle: secondaryTextStyle(size: 14),
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              16.height,
                              Container(
                                padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                                decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(26),
                                  backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100],
                                ),
                                child: TextFormField(
                                  focusNode: passwordNode,
                                  autofocus: false,
                                  obscureText: showPassword ? false : true,
                                  style: secondaryTextStyle(),
                                  onFieldSubmitted: (term) {
                                    passwordNode.unfocus();
                                    FocusScope.of(context).requestFocus(confirmPasswordNode);
                                  },
                                  keyboardType: TextInputType.text,
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
                                    hintStyle: secondaryTextStyle(size: 14),
                                  ),
                                ),
                              ),
                              16.height,
                              Text("Forgot Password?", style: boldTextStyle(size: 14)).onTap(() {
                                RHForgotPasswordScreen().launch(context);
                              }),
                              50.height,
                              AppButton(
                                color: appPrimaryColor,
                                width: context.width(),
                                child: Text('Sign In', style: boldTextStyle(size: 14, color: white)),
                                onTap: () {
                                  finish(context);
                                  RHMainScreen().launch(context);
                                },
                                shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
                              ),
                              30.height,
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 60.0, right: 16.0),
                                      child: Divider(color: Colors.grey),
                                    ),
                                  ),
                                  Text("Or", style: secondaryTextStyle()),
                                  Expanded(
                                    child: Container(margin: EdgeInsets.only(left: 16.0, right: 60.0), child: Divider(color: Colors.grey)),
                                  ),
                                ],
                              ),
                              30.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(RH_fb_icon, height: 40, width: 40),
                                  12.width,
                                  Image.asset(RH_twitter_icon, height: 40, width: 40),
                                  12.width,
                                  Image.asset(RH_google_plus_icon, height: 40, width: 40),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: createRichText(list: [
                        TextSpan(text: "Don't have an account?", style: primaryTextStyle()),
                        TextSpan(text: " Sign Up", style: boldTextStyle(color: appPrimaryColor)),
                      ]).onTap(() {
                        RHSignUpScreen().launch(context);
                      }),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> willPopCallback() async {
    finish(context);
    return true;
  }
}
