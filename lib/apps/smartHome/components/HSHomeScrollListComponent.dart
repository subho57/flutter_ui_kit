import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSSplashScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSHomeScrollListComponent extends StatefulWidget {
  static String tag = '/HSHomeScrollListComponent';
  final bool isEdit;

  HSHomeScrollListComponent({this.isEdit});

  @override
  HSHomeScrollListComponentState createState() => HSHomeScrollListComponentState();
}

class HSHomeScrollListComponentState extends State<HSHomeScrollListComponent> {
  // List<HSRoomListModel> deviceList = getDashBoardList();

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
    return Stack(
      overflow: Overflow.visible,
      children: [
        Image.asset(
          HS_kitchen_bg,
          fit: BoxFit.cover,
          width: context.width(),
          height: 210,
        ).cornerRadiusWithClipRRect(defaultRadius).paddingOnly(left: 16, right: 16),
        Positioned(
          left: 0,
          right: 0,
          bottom: -50,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 16),
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: getDashBoardList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  HSRoomListModel mData = getDashBoardList[index];
                  return GestureDetector(
                    onTap: () async {
                      setState(() {
                        mData.isOn = !mData.isOn;
                      });
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Positioned(
                          child: Container(
                            margin: EdgeInsets.all(12),
                            padding: EdgeInsets.all(12),
                            width: 300,
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: appStore.isDarkModeOn
                                  ? mData.isOn || widget.isEdit
                                      ? appStore.cardColor
                                      : Hs_color_grey_background.withOpacity(1)
                                  : mData.isOn || widget.isEdit
                                      ? appStore.cardColor
                                      : HS_colorPrimary,
                              boxShadow: defaultBoxShadow(),
                              borderRadius: radius(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mData.roomName,
                                  style: primaryTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? mData.isOn || widget.isEdit
                                            ? gray
                                            : textPrimaryColorGlobal
                                        : mData.isOn || widget.isEdit
                                            ? gray
                                            : textPrimaryColorGlobal,
                                    size: 14,
                                    weight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                4.height,
                                mData.isOn
                                    ? Text(
                                        "On",
                                        style: secondaryTextStyle(size: 14, color: mData.isOn || widget.isEdit ? hsColorOrange : textSecondaryColorGlobal),
                                      )
                                    : Text(
                                        "Off",
                                        style: secondaryTextStyle(size: 14, color: mData.isOn || widget.isEdit ? hsColorOrange : textSecondaryColorGlobal),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Container(child: Icon(Icons.close, color: hsColorOrange))
                            .onTap(() {
                              setState(() {
                                if (getDashBoardList != null) {
                                  getDashBoardList.removeAt(index);
                                }
                              });
                            })
                            .visible(widget.isEdit)
                            .paddingOnly(top: 20, right: 20)
                      ],
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}
