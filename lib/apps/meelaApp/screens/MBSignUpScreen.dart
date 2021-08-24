import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBPhoneRegistrationScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSignInScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSignUpScreen extends StatefulWidget {
  @override
  MBSignUpScreenState createState() => MBSignUpScreenState();
}

class MBSignUpScreenState extends State<MBSignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  FocusNode focusNodeFullName = FocusNode();
  FocusNode focusNodeEmail = FocusNode();
  FocusNode focusNodePhoneNum = FocusNode();

  bool rememberMe = false;

  @override
  void dispose() {
    super.dispose();
    focusNodeFullName.dispose();
    focusNodeEmail.dispose();
    focusNodePhoneNum.dispose();
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
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(MBSignUpTitle, style: boldTextStyle(size: 26)),
              24.height,
              Text(MBSignUpSubTitle, style: secondaryTextStyle(size: 14), textAlign: TextAlign.center),
              44.height,
              textFieldWidget(
                hintText: 'Full Name',
                controller: fullNameController,
                textFieldType: TextFieldType.NAME,
                focusNode: focusNodeFullName,
                nextFocusNode: focusNodeEmail,
              ),
              8.height,
              textFieldWidget(
                hintText: 'Email Address',
                controller: emailController,
                textFieldType: TextFieldType.EMAIL,
                focusNode: focusNodeEmail,
                nextFocusNode: focusNodePhoneNum,
              ),
              8.height,
              textFieldWidget(
                hintText: 'Phone Number',
                controller: phoneNumberController,
                textFieldType: TextFieldType.PHONE,
                focusNode: focusNodePhoneNum,
              ),
              16.height,
              Theme(
                data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.grey),
                child: CheckboxListTile(
                  title: Text(MBCheckBoxText, style: secondaryTextStyle(size: 14)),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  value: rememberMe,
                  onChanged: (newValue) {
                    setState(() {
                      rememberMe = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ),
              16.height,
              AppButton(
                text: MBBtnText,
                onTap: () {
                  finish(context);
                  MBPhoneRegistrationScreen().launch(context);
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
              24.height,
              Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    text: MBAccountText,
                    style: primaryTextStyle(size: 14),
                    children: <TextSpan>[TextSpan(text: MBTextSignIn, style: secondaryTextStyle(size: 14))],
                  ),
                ).onTap(() {
                  MBSignInScreen().launch(context);
                }),
              ),
            ],
          ).paddingOnly(left: 16, right: 16, top: 40, bottom: 16),
        ),
      ),
    );
  }
}
