import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Widget faAppButtonWidget(BuildContext context, {String title, Function onTap, bool isHome}) {
  return AppButton(
    width: context.width(),
    color: isHome ? Colors.grey[300] : fa_color_secondary,
    child: Text(title, style: boldTextStyle(color: isHome ? Colors.grey : white)),
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    onTap: onTap,
  );
}

Widget phoneWithCountryPickerAppTextFiled({TextEditingController controller, focus, TextFieldType textFieldType}) {
  return Container(
    decoration: boxDecorationWithRoundedCorners(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
      borderRadius: radius(12),
    ),
    child: Row(
      children: <Widget>[
        CountryCodePicker(
          padding: EdgeInsets.only(left: 16),
          onChanged: (value) {},
          backgroundColor: Colors.transparent,
          showFlag: false,
          showDropDownButton: true,
          dialogBackgroundColor: Colors.white,
          boxDecoration: boxDecorationWithRoundedCorners(borderRadius: radius(4), backgroundColor: Colors.white),
          textStyle: primaryTextStyle(),
        ),
        Container(height: 24, child: VerticalDivider()),
        AppTextField(
          controller: controller,
          textFieldType: textFieldType,
          autoFocus: false,
          maxLines: 1,
          maxLength: 10,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16),
            hintText: "Enter phone number",
            hintStyle: secondaryTextStyle(),
            counter: Offstage(),
            border: InputBorder.none,
          ),
        ).expand()
      ],
    ),
  );
}

Widget faAppbarWidget(BuildContext context, {String title, List<Widget> actions, backgroundColor, iconColor, textColor}) {
  return appBarWidget(
    title,
    showBack: true,
    color: backgroundColor,
    textColor: textColor,
    elevation: 0,
    actions: actions,
    backWidget: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: iconColor),
        onPressed: () {
          finish(context);
        }),
  );
}

Widget pinCodeTextFieldWidget(BuildContext context, {StreamController errorController, TextEditingController controller, Function onChanged}) {
  return PinCodeTextField(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    appContext: context,
    pastedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
    length: 4,
    obscureText: false,
    showCursor: false,
    animationType: AnimationType.fade,
    errorTextSpace: 30,
    validator: (v) {
      if (v.length < 3) {
        return "Pin is not correct.please try again.";
      } else {
        return null;
      }
    },
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      fieldHeight: 70,
      fieldWidth: 65,
      activeFillColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
      inactiveFillColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
      selectedFillColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
      inactiveColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
      selectedColor: fa_color_primary,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    animationDuration: Duration(milliseconds: 300),
    textStyle: TextStyle(
      fontSize: 20,
      height: 1.6,
      color: appStore.isDarkModeOn ? Colors.white : Colors.black,
    ),
    backgroundColor: Colors.transparent,
    enableActiveFill: true,
    errorAnimationController: errorController,
    controller: controller,
    keyboardType: TextInputType.number,
    onCompleted: (v) {},
    onChanged: onChanged,
    beforeTextPaste: (text) {
      return true;
    },
  );
}

InputDecoration faInputDecoration({String hint, Widget suffixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    counter: Offstage(),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide.none,
    ),
    fillColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
    hintText: hint,
    suffixIcon: suffixIcon,
    hintStyle: secondaryTextStyle(),
    filled: true,
  );
}

Widget verifyCard({String image, String title, String description, String iconHeadingText, String iconHeading}) {
  return Container(
    decoration: boxDecorationWithShadow(
      borderRadius: radius(16),
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
    ),
    padding: EdgeInsets.all(30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 80, width: 80, fit: BoxFit.fill),
        16.height,
        Text(title, style: boldTextStyle()),
        8.height,
        Text(description, style: primaryTextStyle(), textAlign: TextAlign.center),
        30.height,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconHeading, height: 24, width: 24, fit: BoxFit.fill),
            8.width,
            Text(iconHeadingText, style: boldTextStyle(color: fa_color_secondary)),
          ],
        )
      ],
    ),
  );
}

Widget createPasswordWidget({String title, Color iconColor}) {
  return Row(
    children: [
      Image.asset(fa_check_icon, height: 16, color: iconColor),
      16.width,
      Text(title, style: secondaryTextStyle()),
    ],
  ).paddingOnly(bottom: 8);
}

InputDecoration faAddressInputDecoration({String hint}) {
  return InputDecoration(
    counter: Offstage(),
    hintText: hint,
    hintStyle: secondaryTextStyle(),
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  );
}

Widget verifyIdentityCircleWidget({Color color1, Color color2, icon}) {
  return Container(
      height: 60,
      width: 60,
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: radius(30),
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      padding: EdgeInsets.all(8),
      child: Image.asset(
        icon,
        height: 16,
        width: 16,
        fit: BoxFit.cover,
        color: Colors.white,
      ));
}

BoxDecoration faGradientBoxDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [Color(0xFF1761C5), Color(0xFF0BB8E4)],
      begin: FractionalOffset(0.0, 1.0),
      end: FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp,
    ),
  );
}

Widget homeWidget({String icon, String title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 50,
        width: 50,
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(30),
          gradient: LinearGradient(
            colors: [Color(0xFF1761C5), Color(0xFF0BB8E4)],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        padding: EdgeInsets.all(12),
        child: Image.asset(
          icon,
          height: 16,
          width: 16,
          fit: BoxFit.fill,
          color: Colors.white,
        ),
      ),
      4.height,
      Text(title, style: primaryTextStyle(size: 12)),
    ],
  );
}

Widget sendMoneyUserWidget({String image, String name, String type}) {
  return Row(
    children: [
      Image.asset(image, height: 50, width: 50, fit: BoxFit.fill).cornerRadiusWithClipRRect(30),
      16.width,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: boldTextStyle()),
          8.width,
          Text(type, style: secondaryTextStyle()),
        ],
      ),
      Spacer(),
      faNextCircleWidget()
    ],
  );
}

InputDecoration faAmountInputDecoration({String hint, String prefixIcon}) {
  return InputDecoration(
    hintText: hint,
    counter: Offstage(),
    prefixIcon: Image.asset(
      prefixIcon,
      height: 10,
      width: 10,
      color: Colors.white,
    ).paddingAll(8),
    hintStyle: secondaryTextStyle(color: Colors.white70),
    border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
    disabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
    focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.transparent)),
  );
}

Widget faTitleWidget({String title, Color titleColor, TextStyle subTitleStyle, String subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: secondaryTextStyle(size: 14, color: titleColor)),
      Text(subTitle, style: subTitleStyle),
    ],
  );
}

Widget activityTabBar(BuildContext context, {TabController tabController}) {
  return Container(
    height: 40,
    margin: EdgeInsets.only(left: context.width() * 0.1, right: context.width() * 0.1),
    decoration: BoxDecoration(
      color: fa_color_secondary.withOpacity(0.3),
      borderRadius: BorderRadius.circular(25.0),
    ),
    child: TabBar(
      labelPadding: EdgeInsets.all(0),
      indicatorPadding: EdgeInsets.all(0),
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      labelColor: fa_color_primary,
      unselectedLabelColor: Colors.white,
      tabs: [
        Tab(text: 'Reports'),
        Tab(text: 'Transactions'),
      ],
    ),
  ).paddingOnly(left: 0, right: 0, top: 16);
}

Widget faNextCircleWidget() {
  return Container(
    height: 40,
    width: 40,
    decoration: boxDecorationWithRoundedCorners(
      borderRadius: radius(40),
      backgroundColor: Colors.grey[200],
    ),
    child: Icon(Icons.navigate_next_outlined, color: Colors.grey),
  );
}

Widget faActivityIncomeWidget({String image, String title1, String title2}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Image.asset(
        image,
        height: 60,
        width: 60,
        fit: BoxFit.fill,
      ),
      16.width,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title1, style: boldTextStyle(size: 22)),
          Text(title2, style: primaryTextStyle()),
        ],
      ).expand(),
      Icon(Icons.navigate_next_outlined)
    ],
  );
}

Widget faCircularProgress() {
  return CircularPercentIndicator(
    radius: 180.0,
    animation: true,
    center: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('\$148.2', style: boldTextStyle(size: 24)),
        4.height,
        Text('left of \$2,744 budget', style: secondaryTextStyle()),
      ],
    ),
    animationDuration: 2000,
    lineWidth: 16.0,
    percent: 0.8,
    startAngle: 10,
    curve: Curves.easeIn,
    linearGradient: LinearGradient(
      colors: [Colors.deepOrange, Colors.yellow],
      tileMode: TileMode.clamp,
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: [1.0, 0.0],
    ),
    rotateLinearGradient: true,
    reverse: false,
    arcBackgroundColor: Colors.grey,
    arcType: ArcType.HALF,
    circularStrokeCap: CircularStrokeCap.round,
    backgroundColor: Colors.transparent,
  );
}
