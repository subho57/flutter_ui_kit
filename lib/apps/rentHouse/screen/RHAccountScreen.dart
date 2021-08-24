import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHAccountScreen extends StatefulWidget {
  static String tag = '/RHAccountScreen';

  @override
  RHAccountScreenState createState() => RHAccountScreenState();
}

class RHAccountScreenState extends State<RHAccountScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File profileImage;

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
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.grey),
          onPressed: () {
            finish(context);
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Account", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                profileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.file(
                          profileImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill,
                        ),
                      )
                    : CircleAvatar(radius: 50, backgroundImage: AssetImage(profileImage != null ? profileImage : RH_user)),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: appPrimaryColor),
                    child: Center(child: Icon(Icons.edit_outlined, color: white, size: 18)),
                  ),
                )
              ],
            ).onTap(() {
              dialogWidget(context);
            }).center(),
            50.height,
            settingWidget(RH_location_icon, "Address", "Chicago", () {}),
            10.height,
            divider(context),
            10.height,
            settingWidget(RH_internet_icon, "Language", "English", () {}),
            10.height,
            divider(context),
            10.height,
            settingWidget(RH_currency_icon, "Currency", "USD", () {}),
            10.height,
            divider(context),
            10.height,
            settingWidget(RH_aboutme_icon, "About me", "", () {}),
            10.height,
            divider(context),
            10.height,
            settingWidget(RH_logout_icon, "Logout", "", () {}),
            10.height,
            divider(context),
          ],
        ).paddingAll(16),
      ),
    );
  }

  settingWidget(String icon, String title, String address, Function onPressed) {
    return Row(
      children: [
        Image.asset(icon, height: 20, width: 20, color: Colors.grey),
        8.width,
        Text(title, style: secondaryTextStyle(size: 14)).expand(),
        Text(address, style: boldTextStyle(size: 14)),
        IconButton(icon: Icon(Icons.navigate_next_outlined, color: Colors.grey), onPressed: onPressed)
      ],
    );
  }

  dialogWidget(dialogContext) {
    return showDialog(
      barrierDismissible: true,
      context: dialogContext,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Set profile photo',
            style: primaryTextStyle(color: black, size: 20, weight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Take photo', style: primaryTextStyle(size: 16, color: black)).onTap(() {
                pickFromCamera();
                finish(context);
              }),
              20.height,
              Text('Choose photo', style: primaryTextStyle(size: 16, color: black)).onTap(() {
                pickFromGallery();
                finish(context);
              }),
            ],
          ),
        );
      },
    );
  }

  pickFromCamera() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 50)).path);
    setState(() {
      profileImage = image;
    });
  }

  pickFromGallery() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 50)).path);
    setState(() {
      profileImage = image;
    });
  }
}
