import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSNewSceneDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class AddAccessoryScreen extends StatefulWidget {
  static String tag = '/AddAccessoryScreen';

  final deviceName;

  AddAccessoryScreen({this.deviceName});

  @override
  AddAccessoryScreenState createState() => AddAccessoryScreenState();
}

class AddAccessoryScreenState extends State<AddAccessoryScreen> {
  List<HSNewSceneModel> newSceneList = newSceneDeviceLst();
  List<HSNewSceneModel> newSendData = [];

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
            Icon(Icons.arrow_back_ios_outlined, size: 20),
            8.width,
            Text("Back", style: boldTextStyle(color: hsColorAccent, size: 16)),
          ],
        ).onTap(() {
          finish(context);
        }),
      ),
      body: Stack(
        children: [
          Positioned(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Scene", style: boldTextStyle(size: 28)),
                  50.height,
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: newSceneList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        HSNewSceneModel mData = newSceneList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              mData.isOn = !mData.isOn;
                            });
                          },
                          onLongPress: () {},
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 5),
                            decoration: boxDecorationWithRoundedCorners(
                                borderRadius: radius(10),
                                backgroundColor: appStore.isDarkModeOn
                                    ? mData.isOn
                                        ? appStore.cardColor
                                        : appSecondaryBackgroundColor.withOpacity(0.3)
                                    : mData.isOn
                                        ? hsColorAccent
                                        : HS_colorPrimary,
                                boxShadow: defaultBoxShadow()),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mData.deviceName,
                                  overflow: TextOverflow.ellipsis,
                                  style: primaryTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? mData.isOn
                                            ? white
                                            : textPrimaryColorGlobal
                                        : mData.isOn
                                            ? HS_colorPrimary
                                            : Colors.black,
                                    size: 13,
                                    weight: mData.isOn ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ).expand(),
                                5.height,
                                mData.isOn
                                    ? Text(
                                        "On",
                                        style: secondaryTextStyle(size: 14, color: mData.isOn ? gray : textSecondaryColorGlobal),
                                      )
                                    : Text(
                                        "Off",
                                        style: secondaryTextStyle(size: 14, color: mData.isOn ? hsColorOrange : textSecondaryColorGlobal),
                                      ).expand(),
                                5.height,
                                AppButton(
                                  onTap: () {
                                    setState(() {
                                      mData.isAdd = !mData.isAdd;
                                    });
                                  },
                                  color: appStore.isDarkModeOn
                                      ? mData.isAdd
                                          ? HS_colorPrimary
                                          : hsColorAccent
                                      : mData.isOn
                                          ? HS_colorPrimary
                                          : hsColorAccent,
                                  child: Text("Add",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: mData.isAdd
                                            ? hsColorOrange
                                            : mData.isOn
                                                ? black
                                                : white,
                                      )),
                                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                width: context.width(),
                onTap: () {
                  setState(() {
                    var contain = newSceneList.where((element) => element.isAdd == true).toList();
                    if (contain.isNotEmpty) {
                      HSNewSceneDetailsScreen(deviceName: widget.deviceName, newSendData: contain).launch(context);
                    }
                  });
                },
                color: hsColorAccent,
                child: Text("Done", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ).paddingOnly(left: 60, right: 60),
            ),
          )
        ],
      ).paddingAll(16),
    );
  }
}
