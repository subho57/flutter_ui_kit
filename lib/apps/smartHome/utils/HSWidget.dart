import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

Widget formWidget(String title, TextEditingController controller, TextFieldType textFieldType, String hintText) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(title, style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
      AppTextField(
        controller: controller,
        textFieldType: textFieldType,
        textAlign: TextAlign.center,
        autoFocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: textSecondaryColorGlobal),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ).expand()
    ],
  );
}

Widget divider(BuildContext context) {
  return Container(height: 2, width: context.width(), color: appStore.isDarkModeOn ? Hs_color_grey_background : Colors.grey[200]);
}
