import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGNotificationScreen extends StatefulWidget {
  static String tag = '/EGNotificationScreen';

  @override
  EGNotificationScreenState createState() => EGNotificationScreenState();
}

class EGNotificationScreenState extends State<EGNotificationScreen> {
  double _currentWaterSliderValue = 30;
  double _currentLightSliderValue = 20;

  bool isAllowNotification = true;
  bool isDehydrated = true;
  bool isLight = true;
  bool isDaily = true;
  bool isWeekly = true;
  bool isMonthly = false;
  bool isEmail = false;

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
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Notification", center: true, elevation: 0, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    12.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Allow Notifications", style: boldTextStyle(size: 20)),
                        2.height,
                        Text(
                          "Get notifications about what is \ncoming up with your gardens",
                          maxLines: 2,
                          style: secondaryTextStyle(size: 14, color: Colors.grey),
                        ),
                      ],
                    ).expand(),
                    Transform.scale(
                      alignment: Alignment.topCenter,
                      scale: 0.75,
                      child: CupertinoSwitch(
                        onChanged: (val) {
                          isAllowNotification = val;
                          setState(() {});
                        },
                        value: isAllowNotification,
                        activeColor: egPrimaryColor1,
                      ),
                    ),
                  ],
                ),
              ),
              16.height,
              Column(
                children: [
                  Card(
                    child: Container(
                      color: appStore.cardColor,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Dehydrated", style: primaryTextStyle(size: 18)),
                                  4.height,
                                  Text(
                                    "Water below (${_currentWaterSliderValue.toStringAsFixed(1)}%):",
                                    style: primaryTextStyle(size: 14),
                                  ).visible(isDehydrated),
                                ],
                              ).expand(),
                              Transform.scale(
                                alignment: Alignment.topCenter,
                                scale: 0.75,
                                child: CupertinoSwitch(
                                  onChanged: (val) {
                                    isDehydrated = val;
                                    setState(() {});
                                  },
                                  value: isDehydrated,
                                  activeColor: egPrimaryColor1,
                                ),
                              ),
                            ],
                          ),
                          12.height,
                          Slider(
                            min: 0,
                            activeColor: egPrimaryColor1,
                            inactiveColor: Colors.grey[200],
                            max: 100,
                            value: _currentWaterSliderValue,
                            divisions: 100,
                            onChanged: (val) {
                              setState(() {
                                _currentWaterSliderValue = val;
                              });
                            },
                          ).visible(isDehydrated),
                        ],
                      ),
                    ),
                  ),
                  16.height,
                  Card(
                    child: Container(
                      color: appStore.cardColor,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Light Required", style: primaryTextStyle(size: 18)),
                                  4.height,
                                  Text(
                                    "Light time below (${_currentLightSliderValue.toStringAsFixed(1)}%):",
                                    style: primaryTextStyle(size: 14),
                                  ).visible(isLight),
                                ],
                              ).expand(),
                              Transform.scale(
                                alignment: Alignment.topCenter,
                                scale: 0.75,
                                child: CupertinoSwitch(
                                  onChanged: (val) {
                                    isLight = val;
                                    setState(() {});
                                  },
                                  value: isLight,
                                  activeColor: egPrimaryColor1,
                                ),
                              ),
                            ],
                          ),
                          12.height,
                          Slider(
                            min: 0,
                            activeColor: EGSemanticColor2,
                            inactiveColor: Colors.grey[200],
                            max: 100,
                            value: _currentLightSliderValue,
                            divisions: 100,
                            onChanged: (val) {
                              setState(() {
                                _currentLightSliderValue = val;
                              });
                            },
                          ).visible(isLight),
                        ],
                      ),
                    ),
                  ),
                  16.height,
                  Card(
                    child: Container(
                        color: appStore.cardColor,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Daily Report", style: primaryTextStyle(size: 18)),
                                Transform.scale(
                                  scale: 0.75,
                                  child: CupertinoSwitch(
                                    onChanged: (val) {
                                      isDaily = val;
                                      setState(() {});
                                    },
                                    value: isDaily,
                                    activeColor: egPrimaryColor1,
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Weekly Report", style: primaryTextStyle(size: 18)),
                                Transform.scale(
                                  scale: 0.75,
                                  child: CupertinoSwitch(
                                    onChanged: (val) {
                                      isWeekly = val;
                                      setState(() {});
                                    },
                                    value: isWeekly,
                                    activeColor: egPrimaryColor1,
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Monthly Report", style: primaryTextStyle(size: 18)),
                                Transform.scale(
                                  scale: 0.75,
                                  child: CupertinoSwitch(
                                    onChanged: (val) {
                                      isMonthly = val;
                                      setState(() {});
                                    },
                                    value: isMonthly,
                                    activeColor: egPrimaryColor1,
                                  ),
                                ),
                              ],
                            ),
                            8.height,
                            Text("Easily keep an eye on your \ngarden", maxLines: 2, style: secondaryTextStyle(size: 14, color: Colors.grey)),
                          ],
                        )),
                  ),
                  16.height,
                  Card(
                    child: Container(
                        color: appStore.cardColor,
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Email Notification", style: primaryTextStyle(size: 18)),
                                Transform.scale(
                                  scale: 0.75,
                                  child: CupertinoSwitch(
                                    onChanged: (val) {
                                      isEmail = val;
                                      setState(() {});
                                    },
                                    value: isEmail,
                                    activeColor: egPrimaryColor1,
                                  ),
                                ),
                              ],
                            ),
                            8.height,
                            Text("Get notifications via email", maxLines: 2, style: secondaryTextStyle(size: 14, color: Colors.grey)),
                          ],
                        )),
                  ),
                ],
              ).visible(isAllowNotification).paddingSymmetric(horizontal: 8),
            ],
          ).paddingAll(8),
        ),
      ),
    );
  }
}
