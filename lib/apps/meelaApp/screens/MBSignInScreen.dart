import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBTransferSuccessFullScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSignInScreen extends StatefulWidget {
  @override
  MBSignInScreenState createState() => MBSignInScreenState();
}

class MBSignInScreenState extends State<MBSignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePassWord = FocusNode();

  @override
  void dispose() {
    super.dispose();
    focusNodeEmail.dispose();
    passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MBTextSignInTittle, style: boldTextStyle(size: 26)),
              24.height,
              Text(MBSignInSubTitle, style: secondaryTextStyle(size: 14)),
              44.height,
              textFieldWidget(
                hintText: 'Username or email',
                controller: emailController,
                textFieldType: TextFieldType.EMAIL,
                focusNode: focusNodeEmail,
                nextFocusNode: focusNodePassWord,
              ),
              8.height,
              textFieldWidget(
                hintText: 'password',
                controller: passwordController,
                textFieldType: TextFieldType.NAME,
                focusNode: focusNodePassWord,
              ),
              16.height,
              AppButton(
                text: MBBtnText,
                onTap: () {
                  MBTransferSuccessFullScreen().launch(context);
                },
                color: appPrimaryColor,
                width: context.width(),
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              8.height,
              AppButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(mb_apple_logo, width: 20, height: 20, color: white),
                    8.width,
                    Text(MBBtnAppleText, style: boldTextStyle(size: 16, color: white)),
                  ],
                ),
                onTap: () {},
                color: black,
                width: context.width(),
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
              20.height,
              Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    text: MBTextAccountTitle,
                    style: primaryTextStyle(size: 14),
                    children: <TextSpan>[TextSpan(text: MBTextSignUp, style: secondaryTextStyle(size: 14))],
                  ),
                ).onTap(() {
                  finish(context);
                }),
              ),
            ],
          ).paddingOnly(top: 44, left: 16, right: 16, bottom: 16),
        ),
      ),
    );
  }
}
