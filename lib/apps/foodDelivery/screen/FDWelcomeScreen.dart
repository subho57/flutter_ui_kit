import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSignInScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDConstants.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:nb_utils/nb_utils.dart';

class FDWelcomeScreen extends StatefulWidget {
  static String tag = '/FDWelcomeScreen';

  @override
  FDWelcomeScreenState createState() => FDWelcomeScreenState();
}

class FDWelcomeScreenState extends State<FDWelcomeScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.yellow, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FDPrimaryColor,
      body: Container(
        width: context.width(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.height,
                Text('WELCOME!', style: boldTextStyle(color: FDSecondaryColor, size: FDHeadingFontSize)),
                8.height,
                Text('Fooddoor satisfies your food cravings \nwith your favourite food delivered to \nwherever you are', style: secondaryTextStyle(color: white)),
                16.height,
                AppButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text('Get Started', style: primaryTextStyle(color: white)),
                  color: FDSecondaryColor,
                  onTap: () {
                    finish(context);
                    FDSignInScreen().launch(context);
                  },
                )
              ],
            ).paddingLeft(20),
            Positioned(bottom: 0, child: Image.asset(FDWelcomeScreenImage, width: context.width(), height: context.height() / 2, fit: BoxFit.fill)),
          ],
        ),
      ),
    );
  }
}
