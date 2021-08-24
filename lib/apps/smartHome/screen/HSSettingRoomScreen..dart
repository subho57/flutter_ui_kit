import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSSettingRoomScreen extends StatefulWidget {
  static String tag = '/SettingRoomScreen';

  @override
  HSSettingRoomScreenState createState() => HSSettingRoomScreenState();
}

class HSSettingRoomScreenState extends State<HSSettingRoomScreen> {
  bool isLivingRoom = false;
  bool isBedRoom = false;
  bool isCoffeeRoom = false;

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appStore.cardColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back_ios_outlined),
                8.width,
                Text("Back", style: boldTextStyle(color: hsColorAccent, size: 16)),
              ],
            ).onTap(() {
              finish(context);
            }),
          ],
        ),
      ),
      body: ListView(
        children: [
          Text("Setting Room", style: boldTextStyle(size: 28)).paddingOnly(left: 16, right: 16),
          30.height,
          Text("Choose Room", style: boldTextStyle(size: 14)).paddingOnly(left: 16, right: 16),
          30.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Living Room", style: boldTextStyle(size: 14)),
              CupertinoSwitch(
                value: isLivingRoom,
                activeColor: appPrimaryColor,
                trackColor: gray,
                onChanged: (bool value) {
                  setState(() {
                    isLivingRoom = value;
                  });
                },
              ).onTap(() {
                setState(() {
                  isLivingRoom = !isLivingRoom;
                });
              }),
            ],
          ).paddingOnly(left: 16, right: 16),
          divider(context),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Bed Room", style: boldTextStyle(size: 14)),
              CupertinoSwitch(
                activeColor: appPrimaryColor,
                value: isBedRoom,
                trackColor: gray,
                onChanged: (bool value) {
                  setState(() {
                    isBedRoom = value;
                  });
                },
              ).onTap(() {
                setState(() {
                  isBedRoom = !isBedRoom;
                });
              }),
            ],
          ).paddingOnly(left: 16, right: 16),
          divider(context),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Coffee Room", style: boldTextStyle(size: 14)),
              CupertinoSwitch(
                value: isCoffeeRoom,
                activeColor: appPrimaryColor,
                trackColor: gray,
                onChanged: (bool value) {
                  setState(() {
                    isCoffeeRoom = value;
                  });
                },
              ).onTap(() {
                setState(() {
                  isCoffeeRoom = !isCoffeeRoom;
                });
              }),
            ],
          ).paddingOnly(left: 16, right: 16),
          divider(context),
        ],
      ).paddingBottom(16),
    );
  }
}
