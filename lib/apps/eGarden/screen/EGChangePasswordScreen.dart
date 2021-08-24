import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGChangePasswordScreen extends StatefulWidget {
  static String tag = '/EGChangePasswordScreen';

  @override
  EGNewPasswordScreenState createState() => EGNewPasswordScreenState();
}

class EGNewPasswordScreenState extends State<EGChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isPasswordMatch = false;
  bool isPasswordVisible = true;
  bool isPasswordIconVisible = false;
  bool isOPasswordVisible = true;
  bool isOPasswordIconVisible = false;
  bool isCPasswordVisible = true;
  bool isCPasswordIconVisible = false;
  bool isConfirmBtnEnable = false;

  TextEditingController passCtrl = TextEditingController();
  TextEditingController cPassCtrl = TextEditingController();
  TextEditingController oPassCtrl = TextEditingController();

  FocusNode pwdFocus;
  FocusNode cPwdFocus;
  FocusNode oPwdFocus;

  @override
  void initState() {
    super.initState();
    pwdFocus = FocusNode();
    cPwdFocus = FocusNode();
    oPwdFocus = FocusNode();
    init();
  }

  init() async {}

  @override
  void dispose() {
    super.dispose();
    pwdFocus.dispose();
    cPwdFocus.dispose();
    oPwdFocus.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("", elevation: 0, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Change Password", style: boldTextStyle(size: 32)).paddingOnly(top: 16, right: 16, left: 16),
                8.height,
                Text("Change your password", style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
                40.height,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: oPassCtrl,
                  autofocus: true,
                  focusNode: oPwdFocus,
                  textInputAction: TextInputAction.next,
                  obscureText: isOPasswordVisible ? true : false,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Old Password",
                    hintStyle: secondaryTextStyle(),
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isOPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: isOPasswordIconVisible
                        ? IconButton(
                            icon: isOPasswordVisible ? Icon(Icons.visibility_off, color: egPrimaryColor1) : Icon(Icons.visibility, color: egPrimaryColor1),
                            onPressed: () {
                              isOPasswordVisible = !isOPasswordVisible;
                              setState(() {});
                            })
                        : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    oPwdFocus.unfocus();
                    FocusScope.of(context).requestFocus(pwdFocus);
                  },
                  onChanged: (val) {
                    isOPasswordIconVisible = val.isEmptyOrNull ? false : true;
                    isConfirmBtnEnable = oPassCtrl.text.isEmptyOrNull || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter old password";
                    }
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                32.height,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passCtrl,
                  focusNode: pwdFocus,
                  textInputAction: TextInputAction.next,
                  obscureText: isPasswordVisible ? true : false,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "New Password",
                    hintStyle: secondaryTextStyle(),
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: isPasswordIconVisible
                        ? IconButton(
                            icon: isPasswordVisible
                                ? Icon(Icons.visibility_off, color: egPrimaryColor1)
                                : Icon(
                                    Icons.visibility,
                                    color: egPrimaryColor1,
                                  ),
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
                    isConfirmBtnEnable = oPassCtrl.text.isEmptyOrNull || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter new password";
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
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isCPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
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
                    isConfirmBtnEnable = oPassCtrl.text.isEmptyOrNull || !isPasswordMatch || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
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
                  buildCommonDialog(context, "Your password is successfully changed! ");
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
