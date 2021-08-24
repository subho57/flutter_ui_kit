import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class FAProfileScreen extends StatefulWidget {
  static String tag = '/FAProfileScreen';

  @override
  FAProfileScreenState createState() => FAProfileScreenState();
}

class FAProfileScreenState extends State<FAProfileScreen> {
  PickedFile profileImage;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Future getImage() async {
    profileImage = await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 100);
    print(profileImage.path);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: fa_color_primary,
              height: context.height() * 0.4,
              width: context.width(),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      profileImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.file(
                                File(profileImage.path),
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(profileImage != null ? profileImage : fa_user1),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          child: Center(child: Icon(Icons.edit_outlined, color: fa_color_primary, size: 18)),
                        ),
                      )
                    ],
                  ).onTap(() {
                    setState(() {});
                    getImage();
                  }),
                  16.height,
                  Text('William', style: boldTextStyle(color: Colors.white)),
                  Text('@willam', style: primaryTextStyle(color: Colors.white)),
                ],
              ),
            ).paddingTop(8),
            Container(
              color: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
              height: context.height(),
              child: Column(
                children: [
                  SettingItemWidget(
                    title: "Account",
                    titleTextStyle: primaryTextStyle(),
                    leading: Icon(Icons.account_circle_rounded),
                    trailing: Icon(Icons.navigate_next_rounded),
                    onTap: () {},
                  ),
                  SettingItemWidget(
                    title: "Notification",
                    titleTextStyle: primaryTextStyle(),
                    leading: Icon(Icons.notifications),
                    trailing: Icon(Icons.navigate_next_rounded),
                    onTap: () {},
                  ),
                  SettingItemWidget(
                    title: "Privacy & Security",
                    titleTextStyle: primaryTextStyle(),
                    leading: Icon(Icons.lock),
                    trailing: Icon(Icons.navigate_next_rounded),
                    onTap: () {},
                  ),
                  SettingItemWidget(
                    title: "Help and Support",
                    titleTextStyle: primaryTextStyle(),
                    leading: Icon(Icons.help),
                    trailing: Icon(Icons.navigate_next_rounded),
                    onTap: () {},
                  ),
                  SettingItemWidget(
                    title: "About",
                    titleTextStyle: primaryTextStyle(),
                    leading: Icon(Icons.info),
                    trailing: Icon(Icons.navigate_next_rounded),
                    onTap: () {},
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
