import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/smartHome/components/HSAirConditionerComponent.dart';
import 'package:mighty_ui_kit/apps/smartHome/components/HSHomeScrollListComponent.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSConstant.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'HSBrightnessScreen.dart';
import 'HSSplashScreen.dart';

class HSDashBoardScreen extends StatefulWidget {
  static String tag = '/HSDashBoardScreen';

  @override
  HSDashBoardScreenState createState() => HSDashBoardScreenState();
}

class HSDashBoardScreenState extends State<HSDashBoardScreen> {
  List<HSRoomListModel> deviceList = getRoomList();
  bool isEdit = false;
  var roomController = TextEditingController();

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          headerWidget(),
          40.height,
          HSHomeScrollListComponent(isEdit: isEdit),
          60.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Favorite Accessories", style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
              /*Text("See all", style: primaryTextStyle(size: 14, weight: FontWeight.bold, color: HS_colorAccent)).onTap(() {
                //HSHomeFavAllListComponent().launch(context);
              }),*/
            ],
          ).paddingOnly(left: 16, right: 16),
          20.height,
          Observer(
            builder: (_) => appStore.favDeviceList.length != null && appStore.favDeviceList.isNotEmpty
                ? GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: appStore.favDeviceList.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 8, right: 8),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, int index) => buildCard(appStore.favDeviceList[index]),
                  )
                : Container(
                    margin: EdgeInsets.all(context.width() * 0.3),
                    child: Text("No Data Found", style: primaryTextStyle(weight: FontWeight.bold, size: 16, color: appStore.isDarkModeOn ? HS_colorPrimary : Colors.black)),
                  ),
          ),
        ],
      ).paddingOnly(top: 50, bottom: 20, right: 0, left: 0),
    );
  }

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('d EEE, MMM').format(DateTime.now()), style: primaryTextStyle(size: 14)),
            5.height,
            Text("HOME", style: boldTextStyle(size: 28)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(left: 26, right: 26, top: 6, bottom: 6),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: appStore.isDarkModeOn
                    ? isEdit
                        ? hsColorOrange
                        : Hs_color_grey_background
                    : isEdit
                        ? hsColorOrange
                        : hsColorAccent,
                borderRadius: radius(24),
              ),
              child: Text(isEdit ? "Done" : "Edit", style: primaryTextStyle(size: 14)),
            ).onTap(() {
              isEdit = !isEdit;
              setState(() {});
            }),
            10.width,
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.isDarkModeOn ? Hs_color_grey_background : hsColorAccent),
              child: Icon(Icons.add, color: HS_colorPrimary),
            ).onTap(() {
              addDialog();
            }),
          ],
        )
      ],
    ).paddingOnly(left: 16, right: 16);
  }

  Widget buildCard(HSDeviceModel mData) {
    return GestureDetector(
      onTap: () {
        mData.isOn = !mData.isOn;
        setState(() {});
      },
      onLongPress: () {
        if (mData.deviceId == DeviceTypeAc) {
          HSAirConditionerComponent().launch(context);
        } else {
          HSBrightnessScreen(deviceData: mData).launch(context);
        }
      },
      child: appStore.isDarkModeOn
          ? Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(10),
                backgroundColor: mData.isOn ? Colors.white : appSecondaryBackgroundColor,
                boxShadow: defaultBoxShadow(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(mData.deviceIcon, height: 26, width: 26, color: mData.isOn ? hsColorOrange : hsColorAccent),
                  16.height,
                  Text(
                    mData.deviceName,
                    style: primaryTextStyle(color: mData.isOn ? Colors.black : textPrimaryColorGlobal, size: 12, weight: mData.isOn ? FontWeight.bold : FontWeight.normal),
                  ),
                  Text(mData.isOn ? 'On' : 'Off', style: secondaryTextStyle(size: 14, color: mData.isOn ? Colors.grey : textSecondaryColorGlobal)),
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 8, right: 2, bottom: 10, top: 8),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(10),
                boxShadow: defaultBoxShadow(),
                backgroundColor: mData.isOn ? hsColorAccent : HS_colorPrimary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(mData.deviceIcon, height: 26, width: 26, color: mData.isOn ? HS_colorPrimary : hsColorAccent),
                  16.height,
                  Text(
                    mData.deviceName,
                    style: primaryTextStyle(color: mData.isOn ? HS_colorPrimary : textPrimaryColorGlobal, size: 14, weight: mData.isOn ? FontWeight.bold : FontWeight.normal),
                  ),
                  Text(mData.status, style: secondaryTextStyle(size: 14, color: mData.isOn ? Colors.grey : textSecondaryColorGlobal)),
                ],
              ),
            ),
    );
  }

  addDialog() async {
    await showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Add Room", style: boldTextStyle(size: 16, color: hsColorAccent)),
              contentPadding: EdgeInsets.all(16.0),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: AppTextField(
                      controller: roomController,
                      textFieldType: TextFieldType.NAME,
                      textAlign: TextAlign.start,
                      autoFocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixStyle: TextStyle(color: Colors.white),
                        hintText: "Room Name",
                        hintStyle: TextStyle(color: textSecondaryColorGlobal),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: textSecondaryColorGlobal)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: textSecondaryColorGlobal)),
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                AppButton(
                  color: appStore.cardColor,
                  child: Text('CANCEL', style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                AppButton(
                  color: appStore.cardColor,
                  child: Text('ADD', style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
                  onTap: () {
                    setState(() {
                      if (getDashBoardList != null) {
                        getDashBoardList.add(HSRoomListModel(roomName: roomController.text, status: "", isOn: false));
                        roomController.clear();
                        finish(context);
                      }
                    });
                  },
                )
              ],
            );
          },
        );
      },
    );
  }
}
