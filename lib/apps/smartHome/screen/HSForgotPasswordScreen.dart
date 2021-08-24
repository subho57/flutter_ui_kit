import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSForgotPasswordScreen extends StatefulWidget {
  static String tag = '/HSForgotPasswordComponent';

  @override
  HSForgotPasswordScreenState createState() => HSForgotPasswordScreenState();
}

class HSForgotPasswordScreenState extends State<HSForgotPasswordScreen> {
  final GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

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
            padding: EdgeInsets.only(top: 60, bottom: 30, right: 16, left: 16),
            height: context.height(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: forgotPasswordFormKey,
                  child: Column(
                    children: [
                      Text("Forgot", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
                      Text("Password", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
                      20.height,
                      Text(
                        "Please enter your information to find your password.",
                        style: primaryTextStyle(size: 16, color: appStore.isDarkModeOn ? HS_colorPrimary : textSecondaryColorGlobal),
                        textAlign: TextAlign.center,
                      ),
                      40.height,
                      Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : HS_colorPrimary, boxShadow: appStore.isDarkModeOn ? [] : defaultBoxShadow()),
                        child: Column(
                          children: [
                            AppTextField(
                              controller: nameController,
                              textFieldType: TextFieldType.NAME,
                              textAlign: TextAlign.start,
                              focus: nameFocusNode,
                              nextFocus: emailFocusNode,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AppButton(
                  width: context.width(),
                  onTap: () {
                    finish(context);
                  },
                  color: hsColorAccent,
                  child: Text("Submit", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ).paddingAll(24),
          ),
        ),
      ),
    );
  }
}
