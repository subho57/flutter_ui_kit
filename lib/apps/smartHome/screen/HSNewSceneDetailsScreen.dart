import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSMainScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSNewSceneDetailsScreen extends StatefulWidget {
  static String tag = '/HSNewSceneDetailsScreen';
  final String deviceName;
  final List<HSNewSceneModel> newSendData;

  HSNewSceneDetailsScreen({this.deviceName, this.newSendData});

  @override
  HSNewSceneDetailsScreenState createState() => HSNewSceneDetailsScreenState();
}

class HSNewSceneDetailsScreenState extends State<HSNewSceneDetailsScreen> {
  List<HSNewSceneModel> newSceneList = newSceneDeviceLst();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    print("Length" + widget.newSendData.length.toString());
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
        automaticallyImplyLeading: false,
        backgroundColor: appStore.cardColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios_outlined, color: hsColorAccent),
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
                  Text("New Scene", style: boldTextStyle(size: 28)).paddingOnly(left: 16, right: 16),
                  30.height,
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: appStore.isDarkModeOn ? Hs_color_grey_background : HS_colorPrimary,
                      boxShadow: appStore.isDarkModeOn ? [] : defaultBoxShadow(),
                      borderRadius: radius(0),
                    ),
                    child: Row(
                      children: [
                        Text("Name", style: boldTextStyle(size: 14)),
                        30.width,
                        Text(widget.deviceName.validate(), style: primaryTextStyle(color: textSecondaryColorGlobal)),
                      ],
                    ),
                  ),
                  30.height,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Accessories", style: boldTextStyle(size: 14)),
                  ).paddingLeft(16),
                  30.height,
                  SizedBox(
                    height: 130,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.newSendData.length,
                        itemBuilder: (context, index) {
                          HSNewSceneModel mData = widget.newSendData[index];
                          return Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(40),
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(10),
                              boxShadow: defaultBoxShadow(),
                              backgroundColor: mData.isOn ? Colors.white : appSecondaryBackgroundColor.withOpacity(0.3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mData.deviceName,
                                  style: primaryTextStyle(
                                    color: mData.isOn ? Colors.black : textPrimaryColorGlobal,
                                    size: 14,
                                    weight: mData.isOn ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                5.height,
                                mData.isOn
                                    ? Text(
                                        "On",
                                        style: secondaryTextStyle(size: 14, color: mData.isOn ? hsColorOrange : textSecondaryColorGlobal),
                                      )
                                    : Text(
                                        "Off",
                                        style: secondaryTextStyle(size: 14, color: mData.isOn ? hsColorOrange : textSecondaryColorGlobal),
                                      ).expand(),
                              ],
                            ),
                          ).paddingOnly(left: 8, right: 8);
                        }),
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  30.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Test this scene",
                        style: boldTextStyle(size: 16, color: hsColorAccent),
                      ),
                      Icon(Icons.navigate_next_outlined, color: hsColorAccent),
                    ],
                  ).paddingOnly(left: 16, right: 16),
                  12.height,
                  divider(context),
                  12.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Accessories",
                        style: boldTextStyle(size: 16, color: hsColorAccent),
                      ),
                      Icon(Icons.navigate_next_outlined, color: hsColorAccent),
                    ],
                  ).paddingOnly(left: 16, right: 16),
                  12.height,
                  divider(context),
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                onTap: () {
                  HSMainScreen().launch(context);
                },
                height: 50,
                width: context.width(),
                color: hsColorAccent,
                child: Text("Done", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ).paddingOnly(left: 60, right: 60, bottom: 16),
            ),
          )
        ],
      ),
    );
  }
}
