import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMCreateNewPasswordScreen extends StatefulWidget {
  static String tag = '/HMCreateNewPasswordScreen';

  @override
  HMCreateNewPasswordScreenState createState() => HMCreateNewPasswordScreenState();
}

class HMCreateNewPasswordScreenState extends State<HMCreateNewPasswordScreen> {
  bool _isNewPass1 = false;
  bool _isNewPass2 = false;

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
        persistentFooterButtons: [
          Container(
            width: context.width(),
            height: 50,
            child: CommonButton("Send").onTap(() {
              finish(context);
              toast("new password created");
            }),
          )
        ],
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          elevation: 0,
          leading: Icon(Icons.arrow_back).onTap(() {
            finish(context);
          }),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Text("Create New Password", style: boldTextStyle(size: HMHeadingFontSize.toInt())),
                    Text(
                      "And now, you can create the new \npassword and confirm it",
                      style: TextStyle(color: HMFontColor600, fontSize: HMFontSize),
                      textAlign: TextAlign.center,
                    ).paddingTop(18.0),
                    Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                            child: TextFormField(
                              autofocus: true,
                              obscureText: _isNewPass1 ? false : true,
                              keyboardType: TextInputType.text,
                              style: secondaryTextStyle(size: 16),
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _isNewPass1 = !_isNewPass1;
                                      setState(() {});
                                    },
                                    child: Icon(_isNewPass1 ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "New password",
                                  hintStyle: secondaryTextStyle(size: 16)),
                            ).paddingOnly(left: 8, top: 2),
                          ).cornerRadiusWithClipRRect(HMCornerRadius),
                          16.height,
                          Container(
                            decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                            child: TextFormField(
                              autofocus: false,
                              obscureText: _isNewPass2 ? false : true,
                              keyboardType: TextInputType.text,
                              style: secondaryTextStyle(size: 16),
                              decoration: InputDecoration(
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      _isNewPass2 = !_isNewPass2;
                                      setState(() {});
                                    },
                                    child: Icon(_isNewPass2 ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Confirm password",
                                  hintStyle: secondaryTextStyle(size: 16)),
                            ).paddingOnly(left: 8, top: 2),
                          ).cornerRadiusWithClipRRect(HMCornerRadius)
                        ],
                      ).paddingTop(16),
                    )
                  ],
                ),
              ),
              20.height,
            ],
          ).paddingAll(HMAppPadding),
        ),
      ),
    );
  }
}
