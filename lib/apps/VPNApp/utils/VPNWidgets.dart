import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

Widget commonButton({BuildContext context, String title}) {
  return Container(
    height: 50,
    alignment: Alignment.center,
    width: context.width() * 0.8,
    decoration: boxDecorationWithRoundedCorners(
      backgroundColor: commonButtonColor,
      borderRadius: BorderRadius.circular(24),
    ),
    child: Text(title, style: boldTextStyle(color: white)),
  );
}

Widget commonGoogleButton(BuildContext context, String title) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(
      backgroundColor: white,
      borderRadius: BorderRadius.circular(24),
    ),
    padding: EdgeInsets.all(8),
    height: 50,
    width: context.width() * 0.8,
    child: Row(
      children: [
        Icon(AntDesign.google, color: vpnPrimaryColor, size: 32).paddingLeft(4),
        Text(title, style: boldTextStyle(color: black, size: 16)).center().expand(),
      ],
    ),
  );
}

Widget commonFacebookButton(BuildContext context, String title) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(
      backgroundColor: appPrimaryColor,
      borderRadius: BorderRadius.circular(24),
    ),
    padding: EdgeInsets.all(8),
    height: 50,
    width: context.width() * 0.8,
    child: Row(
      children: [
        Icon(Entypo.facebook_with_circle, color: white, size: 32).paddingLeft(4),
        Text(title, style: boldTextStyle(color: white, size: 16)).center().expand(),
      ],
    ),
  );
}

Widget commonEmailButton(BuildContext context, String title) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(
      backgroundColor: transparentColor,
      border: Border.all(color: commonButtonColor),
      borderRadius: BorderRadius.circular(24),
    ),
    padding: EdgeInsets.all(8),
    height: 50,
    width: context.width() * 0.8,
    child: Row(
      children: [
        CircleAvatar(
          child: Icon(Icons.mail),
          backgroundColor: white,
        ),
        Text(title, style: boldTextStyle(color: white, size: 16)).center().expand(),
      ],
    ),
  );
}

Widget commonActionButton({IconData icon}) {
  return Container(decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: commonColorWhite, size: iconSize).paddingAll(8));
}

Widget commonDataList({String title, Icon icon, Widget data}) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [
        if (icon != null) IconButton(icon: icon, onPressed: null),
        Text(title, style: boldTextStyle(size: textSize.toInt(), color: commonColorWhite), overflow: TextOverflow.ellipsis).paddingAll(8).expand(),
        if (data != null) data
      ],
    ).paddingAll(8).onTap(() {
      //
    }),
  ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
}

Widget commonListTile({Icon icon, String title}) {
  return Container(
    decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
    child: Row(
      children: [IconButton(icon: icon, onPressed: null), Text(title, style: TextStyle(fontSize: textSize, color: commonColorWhite), overflow: TextOverflow.ellipsis).expand()],
    ).paddingAll(8).onTap(() {
      //
    }),
  ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
}
