import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:seekbar/seekbar.dart';

class HSWalkThroughFourthScreen extends StatefulWidget {
  static String tag = '/HSWalkThroughFourthComponent';

  @override
  HSWalkThroughFourthScreenState createState() => HSWalkThroughFourthScreenState();
}

class HSWalkThroughFourthScreenState extends State<HSWalkThroughFourthScreen> {
  var isLight = true;
  var isLamp = true;
  double seekBarValue = 0.0;
  double secondValue = 0.0;
  Timer progressTimer;
  bool done = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  Widget smartControlWidget(String icon, String title, String status, Widget cupertinoSwitch, {bool isTrue = false, bool isSizeBox = false}) {
    return Container(
      padding: EdgeInsets.all(14),
      margin: EdgeInsets.only(left: 2, right: 2),
      alignment: Alignment.center,
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: radius(10),
        backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : HS_colorPrimary,
        boxShadow: appStore.isDarkModeOn ? [] : defaultBoxShadow(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                icon,
                height: 26,
                width: 26,
              ),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: primaryTextStyle(size: 14, weight: FontWeight.bold),
                  ),
                  Text(
                    status,
                    style: secondaryTextStyle(size: 14, color: Colors.grey),
                  ),
                ],
              ).expand(),
              60.width,
              cupertinoSwitch
            ],
          ),
          SizedBox(height: 40).visible(isSizeBox == true),
          SeekBar(
            value: seekBarValue,
            secondValue: secondValue,
            thumbRadius: 18,
            thumbColor: appStore.isDarkModeOn ? HS_colorPrimary : hsColorAccent,
            progressColor: hsColorAccent,
            barColor: appStore.isDarkModeOn ? Colors.grey : Colors.grey,
            onStartTrackingTouch: () {
              if (!done) {
                progressTimer?.cancel();
              }
            },
            onProgressChanged: (value) {
              seekBarValue = value;
            },
            onStopTrackingTouch: () {
              if (!done) {}
            },
          ).visible(isTrue == true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("FEATURE 3/3", style: primaryTextStyle(size: 12, color: textSecondaryColorGlobal)),
        5.height,
        Text("Smart Control", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
        12.height,
        Text("You control all our Smart Home and enjoy Smart life", style: primaryTextStyle(size: 16, color: textSecondaryColorGlobal)),
        60.height,
        smartControlWidget(
          HS_notification,
          "Living room lamp",
          "60%",
          CupertinoSwitch(
            value: isLight,
            activeColor: appPrimaryColor,
            trackColor: gray,
            onChanged: (bool value) {
              setState(() {
                isLight = value;
              });
            },
          ).onTap(() {
            setState(() {
              isLight = !isLight;
            });
          }),
          isTrue: true,
          isSizeBox: true,
        ),
        18.height,
        smartControlWidget(
          HS_like_icon,
          "Living room lamp",
          "Off",
          CupertinoSwitch(
            value: isLamp,
            activeColor: appPrimaryColor,
            trackColor: gray,
            onChanged: (bool value) {
              setState(() {
                isLamp = value;
              });
            },
          ).onTap(() {
            setState(() {
              isLamp = !isLamp;
            });
          }),
          isTrue: false,
          isSizeBox: false,
        ),
      ],
    );
  }
}
