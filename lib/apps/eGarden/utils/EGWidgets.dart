import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/eGarden/model/EGModel.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGPlantDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGStoreDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGConstants.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

Widget displayPlantInGridView({List<EGModel> plantList}) {
  return GridView.builder(
      padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
      itemCount: EGMaxItemCount,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.68, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemBuilder: (context, index) {
        EGModel dataModel = plantList[index % plantList.length];
        return Container(
          color: dataModel.darkColor,
          height: 260,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(height: 60, color: dataModel.lightColor.withOpacity(0.4)),
              commonCacheImageWidget(dataModel.image, 130).paddingSymmetric(vertical: 20),
              Column(
                children: [
                  6.height,
                  Text(dataModel.title.toUpperCase(), style: boldTextStyle(color: dataModel.textColor)),
                  2.height,
                  Text(dataModel.subtitle.toUpperCase(), style: boldTextStyle(color: white)),
                ],
              ).paddingAll(10)
            ],
          ),
        ).onTap(() {
          EGPlantDetailsScreen(dataModel: dataModel).launch(context);
        }).cornerRadiusWithClipRRect(defaultRadius);
      });
}

Widget displayPlantPriceInGridView({List<EGModel> plantList}) {
  return GridView.builder(
    padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
    itemCount: EGMaxItemCount,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.70, crossAxisSpacing: 12, mainAxisSpacing: 12),
    itemBuilder: (context, index) {
      EGModel dataModel = plantList[index % plantList.length];

      return Container(
        height: 260,
        color: dataModel.darkColor,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Transform.rotate(
              alignment: Alignment.centerLeft,
              angle: 2.0,
              child: Container(height: 150, color: dataModel.lightColor.withOpacity(0.3)),
            ),
            Align(alignment: Alignment.topCenter, child: commonCacheImageWidget(dataModel.image, 130).paddingSymmetric(vertical: 24)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                6.height,
                Text(dataModel.title, style: boldTextStyle(color: dataModel.textColor)),
                2.height,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: white),
                  child: Text("\$${dataModel.price}", style: boldTextStyle(size: 12, color: dataModel.darkColor)),
                ),
              ],
            ).paddingAll(12),
          ],
        ),
      ).cornerRadiusWithClipRRect(defaultRadius).onTap(() {
        EGStoreDetailsScreen(dataModel: dataModel).launch(context);
      });
    },
  );
}

Widget roundedButtonWithoutFillColor({BuildContext context, String btnText}) {
  return Container(
    margin: EdgeInsets.all(4),
    height: 40,
    width: context.width(),
    alignment: Alignment.center,
    decoration: boxDecorationWithRoundedCorners(border: Border.all(color: egPrimaryColor1), backgroundColor: transparentColor),
    child: Text(btnText, style: primaryTextStyle(color: egPrimaryColor1, size: 18)),
  );
}

Widget roundedButtonWithFillColor({BuildContext context, String btnText, bool isEnable = true}) {
  return Container(
    margin: EdgeInsets.all(4),
    height: 40,
    width: context.width(),
    alignment: Alignment.center,
    decoration: boxDecorationWithRoundedCorners(backgroundColor: isEnable ? egPrimaryColor1 : appPrimaryColor),
    child: Text(btnText, style: primaryTextStyle(color: white, size: 18)),
  );
}

Widget orDivider(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: Container(
      width: 120,
      margin: EdgeInsets.all(4),
      child: Row(
        children: [
          Divider(color: grey.withOpacity(0.5), thickness: 1.5).expand(),
          8.width,
          Text("OR", style: primaryTextStyle(color: grey, size: 14)),
          8.width,
          Divider(color: grey.withOpacity(0.5), thickness: 1.5).expand(),
        ],
      ),
    ),
  );
}

Widget otherSignInOption(BuildContext context) {
  double _iconSize = 32;
  return Align(
    alignment: Alignment.center,
    child: Container(
      width: 180,
      margin: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [commonCacheImageWidget(EGIconGoogle, _iconSize, width: _iconSize), commonCacheImageWidget(EGIconFB, _iconSize, width: _iconSize), commonCacheImageWidget(EGIconTwitter, _iconSize, width: _iconSize)],
      ),
    ),
  );
}

Future buildLightCustomizeDialog(BuildContext context) {
  double _currentRedSliderValue = 30;
  double _currentBlueSliderValue = 10;
  double _currentYellowSliderValue = 50;
  bool isStartTime = false;
  bool isEndTime = false;
  bool isDefaultSetting = true;
  String startTime, endTime;
  final df = DateFormat('hh:mm a');
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              scrollable: true,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(24),
              titlePadding: EdgeInsets.only(top: 8, left: 12, right: 12),
              title: Row(
                children: [
                  Text("Light Customize", style: boldTextStyle(size: 20)).center().expand(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                      icon: Icon(Icons.close),
                      onPressed: () {
                        finish(context);
                      })
                ],
              ),
              content: Wrap(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Default Settings", style: boldTextStyle(size: 18)),
                          Text("Recommend settings for your plant mode. Turn off to customize", style: secondaryTextStyle(size: 12)),
                        ],
                      ).expand(),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoSwitch(
                            activeColor: egPrimaryColor1,
                            value: isDefaultSetting,
                            onChanged: (val) {
                              isDefaultSetting = val;
                              state(() {});
                            }),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.height,
                      Divider(thickness: 1),
                      8.height,
                      createRichText(list: [
                        TextSpan(text: "Set Timer ", style: boldTextStyle()),
                        TextSpan(text: "(hours/day)", style: secondaryTextStyle(size: 12)),
                      ]),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start"),
                          Row(
                            children: [
                              Text(startTime.isEmptyOrNull ? "${df.format(DateTime.now())} " : "$startTime "),
                              IconButton(
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                icon: isStartTime ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                                onPressed: () {
                                  isStartTime = !isStartTime;
                                  state(() {});
                                },
                              )
                            ],
                          ).onTap(() {
                            isStartTime = !isStartTime;
                            state(() {});
                          })
                        ],
                      ),
                      SizedBox(
                        height: 120,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
                          child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (dateTime) {
                                startTime = df.format(dateTime);
                                state(() {});
                              }),
                        ),
                      ).visible(isStartTime),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("End"),
                          Row(
                            children: [
                              Text(endTime.isEmptyOrNull ? "${df.format(DateTime.now())} " : "$endTime "),
                              IconButton(
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                icon: isEndTime ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                                onPressed: () {
                                  isEndTime = !isEndTime;
                                  state(() {});
                                },
                              )
                            ],
                          ).onTap(() {
                            isEndTime = !isEndTime;
                            state(() {});
                          })
                        ],
                      ),
                      SizedBox(
                        height: 120,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
                          child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (dateTime) {
                                endTime = df.format(dateTime);
                                state(() {});
                              }),
                        ),
                      ).visible(isEndTime),
                      16.height,
                      createRichText(list: [
                        TextSpan(text: "Spectrum ", style: boldTextStyle()),
                        TextSpan(text: "(nm)", style: secondaryTextStyle(size: 12)),
                      ]),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 50, child: Text("Red", style: boldTextStyle(size: 14))),
                          Slider(
                            min: 0,
                            activeColor: Colors.redAccent,
                            inactiveColor: Colors.grey[200],
                            max: 100,
                            value: _currentRedSliderValue,
                            divisions: 100,
                            onChanged: (val) {
                              state(() {
                                _currentRedSliderValue = val;
                              });
                            },
                          ).expand()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 50, child: Text("Blue", style: boldTextStyle(size: 14))),
                          Slider(
                            min: 0,
                            activeColor: Colors.blueAccent,
                            inactiveColor: Colors.grey[200],
                            max: 100,
                            value: _currentBlueSliderValue,
                            divisions: 100,
                            onChanged: (val) {
                              state(() {
                                _currentBlueSliderValue = val;
                              });
                            },
                          ).expand()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 50, child: Text("Yellow", style: boldTextStyle(size: 14))),
                          Slider(
                            min: 0,
                            activeColor: Colors.amber,
                            inactiveColor: Colors.grey[200],
                            max: 100,
                            value: _currentYellowSliderValue,
                            divisions: 100,
                            onChanged: (val) {
                              state(() {
                                _currentYellowSliderValue = val;
                              });
                            },
                          ).expand()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
                        child: Text("Save", style: primaryTextStyle(color: white, size: 18)),
                      ).onTap(() async {
                        bool isYes = await buildSureDialog(context);
                        if (isYes) {
                          finish(context);
                        }
                      })
                    ],
                  ).visible(!isDefaultSetting),
                ],
              ).paddingAll(16),
            );
          },
        );
      });
}

Future buildWaterCustomizeDialog(BuildContext context) {
  double _currentSliderValue = 30;
  bool isDefaultSetting = true;
  int onCycle = 1;
  int restCycle = 1;
  bool isStartTime = false;
  String startTime;
  final df = DateFormat('hh:mm a');
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              scrollable: true,
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(24),
              titlePadding: EdgeInsets.only(top: 8, left: 12, right: 12),
              title: Row(
                children: [
                  Text("Water Customize", style: boldTextStyle(size: 20)).center().expand(),
                  IconButton(
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                      icon: Icon(Icons.close),
                      onPressed: () {
                        finish(context);
                      })
                ],
              ),
              content: Wrap(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Default Settings", style: boldTextStyle(size: 18)),
                          Text("Recommend settings for your plant mode. Turn off to customize", style: secondaryTextStyle(size: 12)),
                        ],
                      ).expand(),
                      Transform.scale(
                        scale: 0.7,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
                          child: CupertinoSwitch(
                              activeColor: egPrimaryColor1,
                              value: isDefaultSetting,
                              onChanged: (val) {
                                isDefaultSetting = val;
                                state(() {});
                              }),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.height,
                      Divider(thickness: 1),
                      8.height,
                      createRichText(list: [
                        TextSpan(text: "Pump Timer ", style: boldTextStyle()),
                        TextSpan(text: "(hours/day)", style: secondaryTextStyle(size: 12)),
                      ]),
                      4.height,
                      Slider(
                        min: 0,
                        activeColor: egPrimaryColor1,
                        inactiveColor: Colors.grey[200],
                        max: 100,
                        value: _currentSliderValue,
                        divisions: 100,
                        onChanged: (val) {
                          state(() {
                            _currentSliderValue = val;
                          });
                        },
                      ),
                      4.height,
                      createRichText(list: [
                        TextSpan(text: "Pump Cycle ", style: boldTextStyle()),
                      ]),
                      16.height,
                      Row(
                        children: [
                          Container(width: 100, child: Text("On")),
                          IconButton(
                              icon: Icon(AntDesign.minussquareo),
                              color: Colors.grey,
                              iconSize: 20,
                              onPressed: () {
                                if (onCycle != 1) {
                                  onCycle--;
                                  state(() {});
                                }
                              }),
                          Text(onCycle.toString()),
                          IconButton(
                              icon: Icon(AntDesign.plussquareo),
                              color: Colors.grey,
                              iconSize: 20,
                              onPressed: () {
                                onCycle++;
                                state(() {});
                              }),
                          Text("(min)", style: secondaryTextStyle(size: 14)),
                        ],
                      ),
                      Row(
                        children: [
                          Container(width: 100, child: Text("Rest")),
                          IconButton(
                              icon: Icon(AntDesign.minussquareo),
                              color: Colors.grey,
                              iconSize: 20,
                              onPressed: () {
                                if (restCycle != 1) {
                                  restCycle--;
                                  state(() {});
                                }
                              }),
                          Text(restCycle.toString()),
                          IconButton(
                              icon: Icon(AntDesign.plussquareo),
                              color: Colors.grey,
                              iconSize: 20,
                              onPressed: () {
                                restCycle++;
                                state(() {});
                              }),
                          Text("(hr)", style: secondaryTextStyle(size: 14))
                        ],
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start Time"),
                          Row(
                            children: [
                              Text(startTime.isEmptyOrNull ? "${df.format(DateTime.now())} " : "$startTime "),
                              IconButton(
                                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                                icon: isStartTime ? Icon(Icons.keyboard_arrow_up) : Icon(Icons.keyboard_arrow_down),
                                onPressed: () {
                                  isStartTime = !isStartTime;
                                  state(() {});
                                },
                              )
                            ],
                          ).onTap(() {
                            isStartTime = !isStartTime;
                            state(() {});
                          })
                        ],
                      ),
                      SizedBox(
                        height: 120,
                        child: CupertinoTheme(
                          data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
                          child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (dateTime) {
                                startTime = df.format(dateTime);
                                state(() {});
                              }),
                        ),
                      ).visible(isStartTime),
                      16.height,
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        height: 40,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
                        child: Text("Save", style: primaryTextStyle(color: white, size: 18)),
                      ).onTap(() async {
                        bool isYes = await buildSureDialog(context);
                        if (isYes) {
                          finish(context);
                        }
                      })
                    ],
                  ).visible(!isDefaultSetting),
                ],
              ).paddingAll(16),
            );
          },
        );
      });
}

Future buildSureDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          buttonPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(48),
          content: Wrap(
            children: [
              Text("Are you sure want to save your settings?"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: boxDecorationWithRoundedCorners(border: Border.all(color: egPrimaryColor1), backgroundColor: transparentColor),
                    child: Text("No", style: primaryTextStyle(color: egPrimaryColor1, size: 18)),
                  ).onTap(() {
                    finish(context, false);
                  }).expand(),
                  20.width,
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
                    child: Text("Yes", style: primaryTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    finish(context, true);
                  }).expand(),
                ],
              ).paddingTop(16),
            ],
          ).paddingAll(16),
        );
      });
}

Future buildRenameDialog(BuildContext context, TextEditingController controller) {
  String oldName = controller.text;
  bool isOldName = true;
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(48),
              titlePadding: EdgeInsets.only(top: 16),
              title: Text("Plant Name", style: boldTextStyle(size: 20)).center(),
              content: Wrap(
                children: [
                  TextField(
                    controller: controller,
                    textInputAction: TextInputAction.done,
                    style: secondaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: "Name",
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                      contentPadding: EdgeInsets.zero,
                      labelStyle: secondaryTextStyle(size: 16),
                      suffixIcon: isOldName ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                      suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                    ),
                    onChanged: (val) {
                      isOldName = oldName != val ? false : true;
                      state(() {});
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(border: Border.all(color: egPrimaryColor1), backgroundColor: transparentColor),
                        child: Text("Cancel", style: primaryTextStyle(color: egPrimaryColor1, size: 18)),
                      ).onTap(() {
                        finish(context, controller);
                      }).expand(),
                      20.width,
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
                        child: Text("Save", style: primaryTextStyle(color: white, size: 18)),
                      ).onTap(() {
                        finish(context, controller);
                      }).expand(),
                    ],
                  ).paddingTop(24),
                ],
              ).paddingAll(16),
            );
          },
        );
      });
}

Future buildDeleteDialog(BuildContext context, String title) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(48),
              titlePadding: EdgeInsets.only(top: 16),
              title: Text("Done Pot", style: boldTextStyle(size: 20)).center(),
              content: Wrap(
                children: [
                  Text("Your $title is still very young!", style: secondaryTextStyle(size: 14)),
                  Text("Are you sure want to finish plant?", style: secondaryTextStyle(size: 14)).paddingTop(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(border: Border.all(color: egPrimaryColor1), backgroundColor: transparentColor),
                        child: Text("Keep", style: primaryTextStyle(color: egPrimaryColor1, size: 18)),
                      ).onTap(() {
                        finish(context);
                      }).expand(),
                      20.width,
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
                        child: Text("Finish", style: primaryTextStyle(color: white, size: 18)),
                      ).onTap(() {
                        finish(context);
                      }).expand(),
                    ],
                  ).paddingTop(24),
                ],
              ).paddingAll(16),
            );
          },
        );
      });
}

Widget btnWithoutFillColor({String btnText}) {
  return Container(
    height: 40,
    padding: EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,
    decoration: boxDecorationWithRoundedCorners(border: Border.all(color: egPrimaryColor1), backgroundColor: transparentColor),
    child: Text(btnText, style: boldTextStyle(color: egPrimaryColor1, size: 18)),
  );
}

Widget btnWithFillColor({String btnText}) {
  return Container(
    height: 40,
    padding: EdgeInsets.symmetric(horizontal: 16),
    alignment: Alignment.center,
    decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
    child: Text(btnText, style: boldTextStyle(color: white, size: 18)),
  );
}

Widget settingList({IconData iconLeading, IconData iconTrailing, String title, String subtitle = ""}) {
  return Card(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: iconLeading == null ? 4 : 8),
      color: appStore.cardColor,
      child: Row(
        children: [
          iconLeading == null ? 12.width : IconButton(icon: Icon(iconLeading), iconSize: 22, color: egPrimaryColor1, onPressed: () {}),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: primaryTextStyle(size: 18)),
              2.height,
              subtitle.isEmptyOrNull ? 0.width : Text(subtitle, style: secondaryTextStyle(size: 14, color: Colors.grey[400])),
            ],
          ).expand(),
          iconTrailing == null ? 0.width : IconButton(icon: Icon(iconTrailing), iconSize: 28, color: egPrimaryColor1, onPressed: () {}),
        ],
      ),
    ),
  );
}

Widget settingListWithSwitch({Widget trailing, String title, String subtitle = ""}) {
  return Card(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: appStore.cardColor,
      child: Row(
        crossAxisAlignment: subtitle.isNotEmpty ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          12.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: primaryTextStyle(size: 18)),
              2.height,
              subtitle.isEmptyOrNull ? 0.width : Text(subtitle, maxLines: 2, style: secondaryTextStyle(size: 14, color: Colors.grey[400])),
            ],
          ).expand(),
          Transform.scale(alignment: subtitle.isNotEmpty ? Alignment.topCenter : Alignment.center, scale: 0.75, child: trailing),
        ],
      ),
    ),
  );
}

Widget settingListWithBoldTitle({IconData iconLeading, String title, String subtitle}) {
  return Card(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: appStore.cardColor,
      child: Row(
        children: [
          IconButton(icon: Icon(iconLeading), iconSize: 20, color: egPrimaryColor1, onPressed: () {}),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: boldTextStyle(size: 16)),
              2.height,
              subtitle.isEmptyOrNull ? 0.width : Text(subtitle, style: secondaryTextStyle(size: 14, color: Colors.grey[400])),
            ],
          ).expand(),
        ],
      ),
    ),
  );
}

Widget buildSearchBar({String hintText}) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: 8),
    decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.grey[200].withOpacity(0.4)),
    child: Row(
      children: [
        IconButton(
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          iconSize: 20,
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        10.width,
        TextField(
          decoration: InputDecoration(contentPadding: EdgeInsets.zero, border: InputBorder.none, hintText: hintText),
        ).expand(),
      ],
    ),
  );
}

class SliverAppBarDelegateDemo extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  SliverAppBarDelegateDemo(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: appStore.cardColor,
      width: double.infinity,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

Future buildCommonDialog(BuildContext context, String title) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, state) {
            return AlertDialog(
              buttonPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.all(48),
              titlePadding: EdgeInsets.only(top: 16),
              title: Text("Congratulations!", style: boldTextStyle(size: 20)).center(),
              content: Wrap(
                children: [
                  Text(title + "☺️", style: primaryTextStyle(size: 16)),
                  Container(
                    height: 40,
                    alignment: Alignment.center,
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: egPrimaryColor1),
                    child: Text("OK", style: primaryTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    finish(context);
                    finish(context);
                    EGDashboardScreen().launch(context);
                  }).paddingTop(24),
                ],
              ).paddingAll(16),
            );
          },
        );
      });
}
