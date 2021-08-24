import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSignInScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGSignUpScreen extends StatefulWidget {
  static String tag = '/EGSignUpScreen';

  @override
  EGSignUpScreenState createState() => EGSignUpScreenState();
}

class EGSignUpScreenState extends State<EGSignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isRememberMeCheck = false;
  bool isValidEmail = false;
  bool isPasswordVisible = true;
  bool isPasswordIconVisible = false;
  bool isCPasswordVisible = true;
  bool isCPasswordIconVisible = false;
  bool isSignUpBtnEnable = false;
  bool isPasswordMatch = false;

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController cPassCtrl = TextEditingController();

  FocusNode emailFocus;
  FocusNode pwdFocus;
  FocusNode cPwdFocus;

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    pwdFocus = FocusNode();
    cPwdFocus = FocusNode();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    emailFocus.dispose();
    pwdFocus.dispose();
    cPwdFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: [
          Wrap(
            children: [
              roundedButtonWithFillColor(context: context, btnText: "Create new account", isEnable: isSignUpBtnEnable).onTap(() {
                if (_formKey.currentState.validate()) {
                  EGDashboardScreen().launch(context);
                }
              }),
              orDivider(context),
              otherSignInOption(context),
            ],
          ),
        ],
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          elevation: 0,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              finish(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign up", style: boldTextStyle(size: 32)),
                8.height,
                createRichText(list: [
                  TextSpan(text: "Enter your email and password for sign up or ", style: secondaryTextStyle()),
                  TextSpan(
                      text: "Already have an account?",
                      style: primaryTextStyle(color: egPrimaryColor1, size: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          finish(context);
                          EGSignInScreen().launch(context);
                        }),
                ], overflow: TextOverflow.clip)
                    .paddingRight(16),
                40.height,
                TextFormField(
                  autofocus: true,
                  focusNode: emailFocus,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtrl,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Email",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    enabledBorder: isValidEmail ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: secondaryTextStyle(),
                    labelStyle: secondaryTextStyle(size: 16),
                    suffixIcon: isValidEmail
                        ? IconButton(
                            icon: Icon(Icons.check, color: egPrimaryColor1),
                            onPressed: () {},
                          )
                        : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    emailFocus.unfocus();
                    FocusScope.of(context).requestFocus(pwdFocus);
                  },
                  onChanged: (val) {
                    isValidEmail = val.validateEmail() ? true : false;
                    isSignUpBtnEnable = emailCtrl.text.isEmptyOrNull || !isValidEmail || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter email id";
                    }
                    if (!val.validateEmail()) {
                      return "Please enter valid email id";
                    }
                    isValidEmail = true;
                    return null;
                  },
                ),
                32.height,
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passCtrl,
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
                    isSignUpBtnEnable = emailCtrl.text.isEmptyOrNull || !isValidEmail || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ),
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
                    hintStyle: secondaryTextStyle(),
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isCPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    suffixIcon: isCPasswordIconVisible
                        ? IconButton(
                            icon: isCPasswordVisible ? Icon(Icons.visibility_off, color: egPrimaryColor1) : Icon(Icons.visibility, color: egPrimaryColor1),
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
                    isSignUpBtnEnable = emailCtrl.text.isEmptyOrNull || !isPasswordMatch || !isValidEmail || passCtrl.text.isEmptyOrNull || cPassCtrl.text.isEmptyOrNull ? false : true;
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
                ),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
