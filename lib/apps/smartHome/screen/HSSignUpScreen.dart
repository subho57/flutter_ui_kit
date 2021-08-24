import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSPinVerifyScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSSignUpScreen extends StatefulWidget {
  static String tag = '/HSSignUpComponent';

  @override
  HSSignUpScreenState createState() => HSSignUpScreenState();
}

class HSSignUpScreenState extends State<HSSignUpScreen> {
  final GlobalKey<FormState> signUpFormKey = new GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();

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
            height: context.height(),
            padding: EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: signUpFormKey,
                  child: Column(
                    children: [
                      Text("Sign Up", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
                      20.height,
                      Text(
                        "Sign up by your ID to use our services and  other feature.",
                        style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? HS_colorPrimary : textSecondaryColorGlobal),
                        textAlign: TextAlign.center,
                      ).paddingOnly(left: 22, right: 22),
                      40.height,
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : HS_colorPrimary, boxShadow: appStore.isDarkModeOn ? [] : defaultBoxShadow()),
                        child: Column(
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
                              textFieldType: TextFieldType.EMAIL,
                              focus: emailFocusNode,
                              nextFocus: passWordFocusNode,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixStyle: TextStyle(color: Colors.white),
                                hintText: "Email",
                                hintStyle: TextStyle(color: textSecondaryColorGlobal),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                            Divider(color: appStore.isDarkModeOn ? white : Colors.grey),
                            AppTextField(
                              controller: passWordController,
                              focus: passWordFocusNode,
                              nextFocus: phoneNumberFocusNode,
                              textFieldType: TextFieldType.PASSWORD,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixStyle: TextStyle(color: Colors.white),
                                hintText: "Password",
                                hintStyle: TextStyle(color: textSecondaryColorGlobal),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                            Divider(color: appStore.isDarkModeOn ? white : Colors.grey),
                            AppTextField(
                              controller: phoneNumberController,
                              textFieldType: TextFieldType.PHONE,
                              focus: phoneNumberFocusNode,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixStyle: TextStyle(color: Colors.white),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: textSecondaryColorGlobal),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    AppButton(
                      width: context.width(),
                      onTap: () {
                        if (signUpFormKey.currentState.validate()) {
                          HSPinVerifyScreen().launch(context);
                        }
                      },
                      color: hsColorAccent,
                      child: Text("Sign Up", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                      shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    12.height,
                    Text("Already have an account? Login", style: primaryTextStyle(size: 14, color: hsColorAccent, weight: FontWeight.bold)).onTap(() {
                      finish(context);
                    })
                  ],
                ).paddingOnly(left: 16, right: 16, bottom: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
