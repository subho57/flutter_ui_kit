import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSignInScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class EGNewPasswordScreen extends StatefulWidget {
  static String tag = '/EGNewPasswordScreen';

  @override
  EGNewPasswordScreenState createState() => EGNewPasswordScreenState();
}

class EGNewPasswordScreenState extends State<EGNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordMatch = false;
  bool isPasswordVisible = true;
  bool isPasswordIconVisible = false;
  bool isCPasswordVisible = true;
  bool isCPasswordIconVisible = false;
  bool isConfirmBtnEnable = false;

  TextEditingController passCtrl = TextEditingController();
  TextEditingController cPassCtrl = TextEditingController();

  FocusNode pwdFocus;
  FocusNode cPwdFocus;

  @override
  void initState() {
    super.initState();
    pwdFocus = FocusNode();
    cPwdFocus = FocusNode();
    init();
  }

  init() async {}

  @override
  void dispose() {
    super.dispose();
    pwdFocus.dispose();
    cPwdFocus.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("", elevation: 0, color: appStore.cardColor),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Password", style: boldTextStyle(size: 32)).paddingOnly(top: 16, right: 16, left: 16),
                8.height,
                Text("Enter your new password", style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
                40.height,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passCtrl,
                  autofocus: true,
                  focusNode: pwdFocus,
                  textInputAction: TextInputAction.next,
                  obscureText: isPasswordVisible ? true : false,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: secondaryTextStyle(),
                    suffixIcon: isPasswordIconVisible
                        ? IconButton(
                            icon: isPasswordVisible ? Icon(Icons.visibility_off, color: egPrimaryColor1) : Icon(Icons.visibility, color: egPrimaryColor1),
                            onPressed: () {
                              isPasswordVisible = !isPasswordVisible;
                              setState(() {});
                            })
                        : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    pwdFocus.unfocus();
                    FocusScope.of(context).requestFocus(cPwdFocus);
                  },
                  onChanged: (val) {
                    isPasswordIconVisible = val.isEmptyOrNull ? false : true;
                    isConfirmBtnEnable = passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                32.height,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: cPassCtrl,
                  focusNode: cPwdFocus,
                  textInputAction: TextInputAction.done,
                  obscureText: isCPasswordVisible ? true : false,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isCPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: secondaryTextStyle(),
                    suffixIcon: isCPasswordIconVisible
                        ? IconButton(
                            icon: isCPasswordVisible
                                ? Icon(Icons.visibility_off, color: egPrimaryColor1)
                                : Icon(
                                    Icons.visibility,
                                    color: egPrimaryColor1,
                                  ),
                            onPressed: () {
                              isCPasswordVisible = !isCPasswordVisible;
                              setState(() {});
                            })
                        : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    cPwdFocus.unfocus();
                  },
                  onChanged: (val) {
                    isPasswordMatch = passCtrl.text == cPassCtrl.text ? true : false;
                    isCPasswordIconVisible = val.isEmptyOrNull ? false : true;
                    isConfirmBtnEnable = !isPasswordMatch || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter confirm password";
                    }
                    if (passCtrl.text != cPassCtrl.text) {
                      return "Password do not match";
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                140.height,
                roundedButtonWithFillColor(context: context, btnText: "Confirm", isEnable: isConfirmBtnEnable)
                    .paddingSymmetric(
                  horizontal: 12,
                )
                    .onTap(() {
                  EGSignInScreen().launch(context);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
