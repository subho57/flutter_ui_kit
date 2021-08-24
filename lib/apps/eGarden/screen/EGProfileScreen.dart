import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGMyInfoScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGMyOrdersScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGPaymentHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class EGProfileScreen extends StatefulWidget {
  static String tag = '/EGProfileScreen';

  @override
  EGProfileScreenState createState() => EGProfileScreenState();
}

class EGProfileScreenState extends State<EGProfileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile", style: boldTextStyle(size: 32)),
            16.height,
            Stack(
              children: [
                CircleAvatar(radius: 50, backgroundColor: egPrimaryColor1, child: Text("JD", style: boldTextStyle(size: 20, color: white))),
                Positioned(
                  bottom: 0,
                  right: 5,
                  child: CircleAvatar(
                    backgroundColor: EGPrimaryColor2,
                    radius: 15,
                    child: Icon(Icons.camera_alt_rounded, size: 20, color: egPrimaryColor1),
                  ).onTap(() async {
                    ImagePicker().getImage(source: ImageSource.gallery);
                  }),
                ),
              ],
            ).center(),
            16.height,
            Text("John Dae", style: boldTextStyle(size: 20)).center(),
            2.height,
            Text("UX Designer", style: secondaryTextStyle(size: 14)).center(),
            32.height,
            settingListWithBoldTitle(
              title: "My Info",
              subtitle: "Personal info, payment method",
              iconLeading: Icons.account_circle,
            ).onTap(() {
              EGMyInfoScreen().launch(context);
            }),
            16.height,
            settingListWithBoldTitle(
              title: "Payment History",
              subtitle: "Record of your monthly payment",
              iconLeading: Icons.payment,
            ).onTap(() {
              EGPaymentHistoryScreen().launch(context);
            }),
            16.height,
            settingListWithBoldTitle(
              title: "My Orders",
              subtitle: "See what you have ordered",
              iconLeading: Icons.shopping_cart_outlined,
            ).onTap(() {
              EGMyOrdersScreen().launch(context);
            })
          ],
        ).paddingAll(16),
      ),
    );
  }
}
