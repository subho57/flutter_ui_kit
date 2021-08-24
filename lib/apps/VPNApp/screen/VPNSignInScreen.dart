import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNImages.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNSignInScreen extends StatefulWidget {
  static String tag = '/VPNSignInScreen';

  @override
  VPNSignInScreenState createState() => VPNSignInScreenState();
}

class VPNSignInScreenState extends State<VPNSignInScreen> {
  TextEditingController email;
  TextEditingController pwd;
  bool isShowPwd = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    email = TextEditingController();
    pwd = TextEditingController();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    email?.dispose();
    pwd?.dispose();
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
                          if (email.text == null) {
                            return 'Enter some value';
                          }
                          return null;
                        },
                      ),
                      16.height,
                      TextFormField(
                        controller: pwd,
                        style: TextStyle(fontSize: 18, color: commonColorWhite),
                        obscureText: isShowPwd ? false : true,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(isShowPwd ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: commonColorWhite),
                                onPressed: () {
                                  setState(() {
                                    isShowPwd = !isShowPwd;
                                  });
                                }),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: commonColorWhite)),
                            labelStyle: boldTextStyle(color: commonColorWhite, size: 18),
                            labelText: "Create Password"),
                        validator: (value) {
                          if (pwd.text == null) {
                            return 'Enter some value';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ).paddingAll(16),
                16.height,
                AppButton(
                  width: context.width(),
                  height: 50,
                  color: appPrimaryColor,
                  child: Text("Sign In", style: boldTextStyle(color: commonColorWhite), textAlign: TextAlign.center),
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      finish(context);
                      VPNDashboardScreen().launch(context);
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
