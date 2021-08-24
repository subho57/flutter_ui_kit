import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAVerifyIdentityTypeComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FAScanDocumentScreen.dart';

class FAVerifyIdentityScreen extends StatefulWidget {
  static String tag = '/FAVerifyIdentityScreen';

  @override
  FAVerifyIdentityScreenState createState() => FAVerifyIdentityScreenState();
}

class FAVerifyIdentityScreenState extends State<FAVerifyIdentityScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isHome = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
      appBar: faAppbarWidget(
        context,
        title: "Verify identity",
        iconColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
        textColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        child: Text("Verify my identity", style: boldTextStyle(color: white)),
        shapeBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        color: fa_color_secondary,
        onTap: () {
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            builder: (context) {
              return FAVerifyIdentityTypeComponent();
            },
          );
        },
      ).paddingOnly(left: 16, right: 16, bottom: 16),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verifyCard(
              image: fa_gov_id_proof_image,
              title: "Government ID",
              description: fa_government_id,
              iconHeading: fa_camera_icon,
              iconHeadingText: "Take a photo",
            ).onTap(() {
              FAScanDocumentScreen().launch(context);
            }),
            16.height,
            verifyCard(
              image: fa_user_image,
              title: "Selfie Photo",
              description: fa_selfie_photo,
              iconHeading: fa_selfie_icon,
              iconHeadingText: "Take a photo",
            ).onTap(() {
              FAScanDocumentScreen().launch(context);
            }),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
