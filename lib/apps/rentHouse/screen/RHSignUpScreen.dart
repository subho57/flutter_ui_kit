import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHMainScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHSignUpScreen extends StatefulWidget {
  static String tag = '/RHSignUpScreen';

  @override
  RHSignUpScreenState createState() => RHSignUpScreenState();
}

class RHSignUpScreenState extends State<RHSignUpScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool showPassword = false;
  bool isAgree = false;

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
    setStatusBarColor(appPrimaryColor, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: appPrimaryColor,
        body: Stack(
          children: [
            Container(
              height: 200,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 45),
              child: Text("Sign Up", style: boldTextStyle(size: 22, color: white)),
            ),
            Stack(
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
                            decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                            child: AppTextField(
                              controller: emailController,
                              textFieldType: TextFieldType.EMAIL,
                              focus: emailNode,
                              autoFocus: false,
                              textStyle: secondaryTextStyle(),
                              nextFocus: passwordNode,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email or Phone number",
                                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
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
                            decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                            child: TextFormField(
                              focusNode: passwordNode,
                              autofocus: false,
                              style: secondaryTextStyle(),
                              obscureText: showPassword ? false : true,
                              onFieldSubmitted: (term) {
                                passwordNode.unfocus();
                                FocusScope.of(context).requestFocus(confirmPasswordNode);
                              },
                              keyboardType: TextInputType.emailAddress,
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
                                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ),
                          16.height,
                          Row(
                            children: <Widget>[
                              Icon(
                                isAgree ? Icons.check_box : Icons.check_box_outline_blank,
                                size: 30,
                                color: isAgree ? appPrimaryColor : Colors.grey,
                              ),
                              10.width,
                              RichText(
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(text: "By creating an account your agree to our", style: primaryTextStyle(size: 14)),
                                    TextSpan(text: "\nTerms and Conditions", style: secondaryTextStyle(color: appPrimaryColor)),
                                  ],
                                ),
                              ).expand()
                            ],
                          ).onTap(() {
                            setState(() {
                              isAgree = !isAgree;
                            });
                          }),
                          50.height,
                          AppButton(
                            color: appPrimaryColor,
                            width: context.width(),
                            child: Text('Sign Up', style: boldTextStyle(size: 14, color: white)),
                            onTap: () {
                              RHMainScreen().launch(context);
                            },
                            shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
                          ),
                          30.height,
                          Row(
                            children: <Widget>[
                              Container(margin: EdgeInsets.only(left: 60.0, right: 16.0), child: Divider(color: Colors.grey)).expand(),
                              Text("Or", style: secondaryTextStyle()),
                              Container(margin: EdgeInsets.only(left: 16.0, right: 60.0), child: Divider(color: Colors.grey)).expand(),
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
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: createRichText(list: [
                        TextSpan(text: "Already have account?", style: primaryTextStyle()),
                        TextSpan(text: " Sign In", style: boldTextStyle(color: appPrimaryColor)),
                      ]).onTap(() {
                        finish(context);
                      }),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
