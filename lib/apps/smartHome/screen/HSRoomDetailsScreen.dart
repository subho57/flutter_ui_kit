import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/smartHome/components/HSAirConditionerComponent.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSBrightnessScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSConstant.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSRoomDetailsScreen extends StatefulWidget {
  static String tag = '/HSRoomDetailsScreen';
  final String roomName;

  HSRoomDetailsScreen({this.roomName});

  @override
  _HSRoomDetailsScreenState createState() => _HSRoomDetailsScreenState();
}

class _HSRoomDetailsScreenState extends State<HSRoomDetailsScreen> {
  var deviceController = TextEditingController();
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

  List<HSDeviceModel> deviceList = getDeviceList();

  int checkedIndex = 0;
  String roomName;
  bool isEdit = false;
  String selectIcon;
  Item selectedUser;

  List<Item> users = <Item>[
    Item(HS_notification),
    Item(HS_world_icon),
    Item(HS_home_icon),
    Item(HS_fan_icon),
    Item(HS_lamp_icon),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: globalScaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              headerWidget(),
              40.height,
              GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: deviceList.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (BuildContext context, int index) => buildCard(index, deviceList[index]),
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            BackButton(),
            4.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat('d EEE, MMM').format(DateTime.now()), style: primaryTextStyle(size: 14)).fit(),
                5.height,
                Text(widget.roomName.validate(), style: primaryTextStyle(size: 28, weight: FontWeight.bold)).fit(),
              ],
            ).expand(),
          ],
        ).expand(),
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
                  borderRadius: radius(24)),
              child: Text(isEdit ? "Done" : "Edit", style: primaryTextStyle(size: 14, color: HS_colorPrimary)),
            ).onTap(() {
              setState(() {
                isEdit = !isEdit;
              });
            }),
            10.width,
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.isDarkModeOn ? Hs_color_grey_background : hsColorAccent),
              child: Icon(Icons.add, color: HS_colorPrimary),
            ).onTap(() async {
              addDialog();
              hideKeyboard(context);
            }),
          ],
        ).paddingLeft(4)
      ],
    ).paddingOnly(right: 4);
  }

  Widget buildCard(int index, HSDeviceModel mData) {
    return GestureDetector(
        onTap: () {
          setState(() {
            checkedIndex = index;
            mData.isOn = !mData.isOn;
          });
        },
        onLongPress: () {
          if (mData.deviceId == DeviceTypeAc) {
            HSAirConditionerComponent().launch(context);
          } else {
            HSBrightnessScreen(deviceData: mData).launch(context);
          }
        },
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(left: 4, right: 4, bottom: 10, top: 12),
          decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(10),
              backgroundColor: appStore.isDarkModeOn
                  ? mData.isOn || isEdit
                      ? appStore.cardColor
                      : appSecondaryBackgroundColor
                  : mData.isOn || isEdit
                      ? hsColorAccent
                      : HS_colorPrimary),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      mData.deviceIcon.validate(),
                      height: 26,
                      width: 26,
                      color: appStore.isDarkModeOn
                          ? mData.isOn || isEdit
                              ? white
                              : hsColorAccent
                          : mData.isOn || isEdit
                              ? HS_colorPrimary
                              : hsColorAccent,
                    ),
                    16.height,
                    Text(
                      mData.deviceName,
                      overflow: TextOverflow.ellipsis,
                      style: primaryTextStyle(
                        color: appStore.isDarkModeOn
                            ? mData.isOn || isEdit
                                ? white
                                : textPrimaryColorGlobal
                            : mData.isOn || isEdit
                                ? HS_colorPrimary
                                : textPrimaryColorGlobal,
                        size: 14,
                        weight: mData.isOn || isEdit ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    mData.isOn
                        ? Text("On", style: secondaryTextStyle(size: 14, color: mData.isOn || isEdit ? Colors.grey : textSecondaryColorGlobal))
                        : Text("Off", style: secondaryTextStyle(size: 14, color: mData.isOn || isEdit ? Colors.grey : textSecondaryColorGlobal)),
                  ],
                ),
              ),
              Icon(Icons.close, color: hsColorOrange).onTap(() {
                setState(() {
                  if (deviceList != null) {
                    deviceList.removeAt(index);
                  }
                });
              }).visible(isEdit)
            ],
          ),
        ));
  }

  addDialog() async {
    await showDialog<String>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Add Device", style: boldTextStyle(size: 16, color: hsColorAccent)),
              contentPadding: EdgeInsets.all(16.0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AppTextField(
                          controller: deviceController,
                          textFieldType: TextFieldType.NAME,
                          textAlign: TextAlign.start,
                          autoFocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixStyle: TextStyle(color: Colors.white),
                            hintText: "Device Name",
                            hintStyle: TextStyle(color: textSecondaryColorGlobal),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: textSecondaryColorGlobal)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: textSecondaryColorGlobal)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.height,
                  Container(
                    width: 300.0,
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        child: Theme(
                          data: Theme.of(context).copyWith(canvasColor: appStore.cardColor),
                          child: DropdownButton<Item>(
                            isExpanded: true,
                            hint: Text("Select icon", style: primaryTextStyle()),
                            value: selectedUser,
                            onChanged: (Item value) {
                              hideKeyboard(context);
                              setState(() {
                                selectedUser = value;
                                selectIcon = value.icon;
                              });
                            },
                            items: users.map((Item user) {
                              return DropdownMenuItem<Item>(
                                value: user,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Image.asset(user.icon),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('CANCEL', style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('ADD', style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      if (deviceList != null && deviceList.isNotEmpty) {
                        deviceList.add(HSDeviceModel(deviceName: deviceController.text, deviceIcon: selectIcon, status: "", isOn: false));
                        finish(context);
                        deviceController.clear();
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

class Item {
  const Item(this.icon);

  final String icon;
}
