import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNImages.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNSignUpScreen extends StatefulWidget {
  static String tag = '/VPNSignUpScreen';

  @override
  VPNSignUpScreenState createState() => VPNSignUpScreenState();
}

class VPNSignUpScreenState extends State<VPNSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email;
  TextEditingController password;
  TextEditingController confirmPassword;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    email?.dispose();
    password?.dispose();
    confirmPassword?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: vpnBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(vpnLogo, 200).center().paddingOnly(top: 50, bottom: 50),
                Text("Create an account", style: boldTextStyle(size: 32, color: commonColorWhite)).paddingAll(16),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        style: TextStyle(fontSize: 18, color: commonColorWhite),
                        decoration:
                            InputDecoration(enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: commonColorWhite)), labelStyle: boldTextStyle(color: commonColorWhite, size: 18), labelText: "Email Address"),
                        validator: (value) {
                          if (email == null) {
                            return 'Enter some value';
                          }
                          return null;
                        },
                      ),
                      16.height,
                      TextFormField(
                        controller: password,
                        style: TextStyle(fontSize: 18, color: commonColorWhite),
                        obscureText: isVisible ? false : true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: commonColorWhite),
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                }),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: commonColorWhite)),
                            labelStyle: boldTextStyle(color: commonColorWhite, size: 18),
                            labelText: "Create Password"),
                        validator: (value) {
                          if (password == null) {
                            return 'Enter some value';
                          }
                          return null;
                        },
                      ),
                      16.height,
                      TextFormField(
                          controller: confirmPassword,
                          style: TextStyle(fontSize: 18, color: commonColorWhite),
                          obscureText: true,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: commonColorWhite)), labelStyle: boldTextStyle(color: commonColorWhite, size: 18), labelText: "Confirm Password"),
                          validator: (value) {
                            if (confirmPassword == null) {
                              return 'Enter some value';
                            }
                            return null;
                          }),
                    ],
                  ),
                ).paddingAll(16),
                16.height,
                AppButton(
                  width: context.width(),
                  height: 50,
                  color: appPrimaryColor,
                  child: Text("Sign Up", style: boldTextStyle(color: commonColorWhite), textAlign: TextAlign.center),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      finish(context);
                    }
                  },
                ).paddingOnly(left: 16, right: 16, bottom: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
