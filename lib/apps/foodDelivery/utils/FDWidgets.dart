import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDConstants.dart';
import 'package:nb_utils/nb_utils.dart';

Widget fdAppButton(Color color, Function onTap, BuildContext context, String text) {
  return AppButton(
    width: context.width(),
    color: color,
    child: Text(
      text,
      style: primaryTextStyle(color: white),
    ),
    onTap: onTap,
  );
}

Widget fdTitleWidget({title1, title2, Function onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title1,
        style: boldTextStyle(size: 16),
      ),
      Text(
        title2,
        style: primaryTextStyle(color: FDSelectedTextColor),
      ).onTap(onTap),
    ],
  ).paddingOnly(left: 16, right: 16);
}

Widget fdCreateRichText(String text1, String text2, Color text1Color) {
  return createRichText(
    list: [
      TextSpan(
        text: text1,
        style: boldTextStyle(color: text1Color, size: FDHeadingFontSize),
      ),
      TextSpan(
        text: text2,
        style: boldTextStyle(color: FDSecondaryColor, size: FDHeadingFontSize),
      ),
    ],
  );
}

Widget fdAppTextField(TextEditingController controller, TextFieldType textFieldType, {focus, nextFocus}) {
  return AppTextField(
    controller: controller,
    textFieldType: textFieldType,
    focus: focus,
    autoFocus: false,
    nextFocus: nextFocus,
    textStyle: secondaryTextStyle(color: black),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16.0),
      fillColor: grey.withOpacity(0.1),
      filled: true,
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(style: BorderStyle.none)),
    ),
  ).cornerRadiusWithClipRRect(12);
}

Widget fdAppBarWidget({BuildContext context, String title, List<Widget> actions, double elevation}) {
  return AppBar(
    elevation: elevation,
    title: Text(
      title,
      style: boldTextStyle(size: 20),
    ),
    leading: Icon(Icons.arrow_back_ios_outlined).onTap(
      () {
        finish(context);
      },
    ),
    toolbarHeight: 70,
    actions: actions,
  );
}
