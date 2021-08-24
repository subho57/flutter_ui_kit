import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSRoomDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSRoomsListScreen extends StatefulWidget {
  @override
  _HSRoomsListScreenState createState() => _HSRoomsListScreenState();
}

class _HSRoomsListScreenState extends State<HSRoomsListScreen> {
  List<HSRoomListModel> roomDataList = getRoomList();
  int checkedIndex = 0;
  var roomController = TextEditingController();
  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              headerWidget(),
              40.height,
              roomDataList.length != null && roomDataList.isNotEmpty
                  ? GridView.builder(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.vertical,
                      itemCount: roomDataList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.9,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        HSRoomListModel mData = roomDataList[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              checkedIndex = index;
                            });
                            HSRoomDetailsScreen(roomName: mData.roomName).launch(context);
                          },
                          child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 4, right: 4, bottom: 5, top: 5),
                              decoration: boxDecorationWithRoundedCorners(
                                  borderRadius: radius(10),
                                  backgroundColor: appStore.isDarkModeOn
                                      ? isEdit
                                          ? appSecondaryBackgroundColor
                                          : appStore.cardColor
                                      : isEdit
                                          ? hsColorAccent
                                          : Colors.white,
                                  boxShadow: defaultBoxShadow()),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      mData.roomName,
                                      style: primaryTextStyle(
                                        color: appStore.isDarkModeOn
                                            ? isEdit
                                                ? Colors.white
                                                : textPrimaryColorGlobal
                                            : isEdit
                                                ? HS_colorPrimary
                                                : textPrimaryColorGlobal,
                                        size: 14,
                                        weight: isEdit ? FontWeight.bold : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.close, color: hsColorOrange).onTap(() {
                                    setState(() {
                                      if (roomDataList != null) {
                                        roomDataList.removeAt(index);
                                      }
                                    });
                                  }).visible(isEdit)
                                ],
                              )),
                        );
                      },
                    )
                  : Center(child: Text("No Data Found")),
            ],
          ),
        ),
      ),
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
            Text("Rooms", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
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
            ).onTap(() {
              addDialog();
            }),
          ],
        )
      ],
    ).paddingOnly(left: 16, right: 16);
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
                      if (roomDataList != null) {
                        roomDataList.add(HSRoomListModel(roomName: roomController.text, status: "", isOn: false));
                        finish(context);
                        roomController.clear();
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
