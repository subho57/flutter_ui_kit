import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHForgotPasswordScreen extends StatefulWidget {
  static String tag = '/RHForgotPasswordScreen';

  @override
  RHForgotPasswordScreenState createState() => RHForgotPasswordScreenState();
}

class RHForgotPasswordScreenState extends State<RHForgotPasswordScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  FocusNode emailNode = FocusNode();
  var emailController = TextEditingController();

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
              child: Text("Forgot Password", style: boldTextStyle(size: 22, color: white)),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 120),
              height: context.height(),
              width: context.width(),
              padding: EdgeInsets.only(left: 16, right: 16, top: 30),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radiusOnly(topRight: 24, topLeft: 24), backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
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
                  50.height,
                  AppButton(
                    color: appPrimaryColor,
                    width: context.width(),
                    child: Text('Submit', style: boldTextStyle(size: 14, color: white)),
                    onTap: () {
                      setState(() {
                        finish(context);
                      });
                    },
                    shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
