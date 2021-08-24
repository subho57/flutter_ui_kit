import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGRecoveryScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGSignInScreen extends StatefulWidget {
  static String tag = '/EGSignInScreen';

  @override
  EGSignInScreenState createState() => EGSignInScreenState();
}

class EGSignInScreenState extends State<EGSignInScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isRememberMeCheck = false;
  bool isValidEmail = false;
  bool isPasswordVisible = true;
  bool isPasswordIconVisible = false;
  bool isSignInBtnEnable = false;

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  FocusNode emailFocus;
  FocusNode pwdFocus;

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    pwdFocus = FocusNode();
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: [
          Wrap(
            children: [
              roundedButtonWithFillColor(context: context, btnText: "Sign in", isEnable: isSignInBtnEnable).onTap(() {
                if (_formKey.currentState.validate()) {
                  finish(context);
                  EGDashboardScreen().launch(context);
                }
              }),
              orDivider(context),
              otherSignInOption(context),
            ],
          ),
        ],
        appBar: AppBar(
            backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
            elevation: 0,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                onPressed: () {
                  finish(context);
                })),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign in", style: boldTextStyle(size: 32)),
                8.height,
                createRichText(list: [
                  TextSpan(text: "Don't have an account? ", style: secondaryTextStyle()),
                  TextSpan(
                      text: "Sign up now!",
                      style: primaryTextStyle(color: egPrimaryColor1, size: 14),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          finish(context);
                          EGSignUpScreen().launch(context);
                        }),
                ]),
                40.height,
                TextFormField(
                  autofocus: true,
                  focusNode: emailFocus,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtrl,
                  textInputAction: TextInputAction.next,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Email",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    enabledBorder: isValidEmail ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    labelStyle: secondaryTextStyle(size: 16),
                    suffixIcon: isValidEmail ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    emailFocus.unfocus();
                    FocusScope.of(context).requestFocus(pwdFocus);
                  },
                  onChanged: (val) {
                    isValidEmail = val.validateEmail() ? true : false;
                    isSignInBtnEnable = emailCtrl.text.isEmptyOrNull || !isValidEmail || passCtrl.text.isEmptyOrNull ? false : true;
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
                  focusNode: pwdFocus,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passCtrl,
                  obscureText: isPasswordVisible ? true : false,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: secondaryTextStyle(size: 16),
                    enabledBorder: isPasswordIconVisible ? UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
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
                  },
                  onChanged: (val) {
                    isPasswordIconVisible = val.isEmptyOrNull ? false : true;
                    isSignInBtnEnable = emailCtrl.text.isEmptyOrNull || !isValidEmail || passCtrl.text.isEmptyOrNull ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter password";
                    }
                    return null;
                  },
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
                          ),
                          child: Checkbox(
                            visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                            activeColor: Colors.grey,
                            value: isRememberMeCheck,
                            onChanged: (bool value) {
                              setState(() {
                                isRememberMeCheck = value;
                              });
                            },
                          ),
                        ),
                        10.width,
                        Text("Remember me", style: secondaryTextStyle(color: isRememberMeCheck ? gray : grey)),
                      ],
                    ).onTap(() {
                      isRememberMeCheck = !isRememberMeCheck;
                      setState(() {});
                    }),
                    Text("Forgot Password?", style: secondaryTextStyle(weight: FontWeight.bold, color: grey)).onTap(() {
                      EGRecoveryScreen().launch(context);
                    }),
                  ],
                )
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
