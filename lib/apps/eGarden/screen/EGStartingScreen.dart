import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSignInScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class EGStartingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        persistentFooterButtons: [
          Wrap(
            children: [
              roundedButtonWithFillColor(context: context, btnText: "Sign in").onTap(() {
                finish(context);
                EGSignInScreen().launch(context);
              }),
              roundedButtonWithoutFillColor(context: context, btnText: "Create new account").onTap(() {
                EGSignUpScreen().launch(context);
              })
            ],
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.height,
              Card(
                color: white,
                elevation: 5,
                shadowColor: grey,
                borderOnForeground: false,
                child: Image.asset(EGStartScreenImage, height: 80, width: 80),
              ),
              32.height,
              Text("Everyone should \nlive with a little \nmore green", style: boldTextStyle(size: 32))
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
