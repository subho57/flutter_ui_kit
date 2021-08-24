import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNSignInScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNImages.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main/utils/AppWidget.dart';

class VPNLoginOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: vpnBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonCacheImageWidget(vpnLogo, 32, width: 32, fit: BoxFit.cover),
                    16.width,
                    Text("VPN APP", style: boldTextStyle(color: white, size: 32)),
                  ],
                ),
                32.height,
                Text(
                  "Login now to access faster internet more than 120+ location",
                  style: boldTextStyle(color: white),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(horizontal: 16),
              ],
            ),
            Column(
              children: [
                commonEmailButton(context, "Sign In with Email").onTap(() {
                  finish(context);
                  VPNSignInScreen().launch(context);
                }),
                16.height,
                commonFacebookButton(context, "Sign In with Facebook"),
                16.height,
                commonGoogleButton(context, "Sign In with Google"),
                16.height,
                createRichText(list: [
                  TextSpan(text: "Don't have an account? ", style: primaryTextStyle(color: white, size: 16)),
                  TextSpan(
                    text: "Signup",
                    style: boldTextStyle(color: white, size: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        VPNSignUpScreen().launch(context);
                      },
                  ),
                ]),
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
