import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHListYourSpaceScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class RHRoomDetailsScreen extends StatefulWidget {
  static String tag = '/RHRoomDetailsScreen';
  final String image;

  RHRoomDetailsScreen({this.image});

  @override
  RHRoomDetailsScreenState createState() => RHRoomDetailsScreenState();
}

class RHRoomDetailsScreenState extends State<RHRoomDetailsScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String phone = '+91544545645';

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
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.grey),
          onPressed: () {
            finish(context);
          },
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Room Details", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.image, fit: BoxFit.fill, height: 240, width: context.width()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('House. 2', style: primaryTextStyle(color: Colors.grey)),
                    8.width,
                    Image.asset(RH_male_icon, color: Colors.grey[300], height: 20, width: 20),
                    4.width,
                    Text("/", style: primaryTextStyle(color: Colors.grey[300])),
                    4.width,
                    Image.asset(RH_female_icon, color: Colors.grey[300], height: 20, width: 20),
                  ],
                ),
                16.height,
                Text("House Leaving Area", style: boldTextStyle(size: 16)),
                24.height,
                Text("430.522 USD/unit", style: boldTextStyle(color: appPrimaryColor, size: 14)),
                8.height,
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.grey[300]),
                    6.width,
                    Text("Louisiana", style: secondaryTextStyle()),
                  ],
                ),
                40.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    avalibilityWidget("Available", "0/3"),
                    avalibilityWidget("Size", "40m"),
                    avalibilityWidget("Deposit", "550.60"),
                  ],
                ),
                30.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    settingAvailabilityWidget(RH_brightness_icon, "0.14", Colors.pink),
                    settingAvailabilityWidget(RH_water_drop_icon, "1.54", Colors.blue),
                    settingAvailabilityWidget(RH_delivery_bike, "Free", Colors.greenAccent),
                    settingAvailabilityWidget(RH_wifi_icon, "5.1", Colors.orangeAccent),
                  ],
                ),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    settingAvailabilityWidget(RH_watchman_icon, "Free", Colors.purple),
                    settingAvailabilityWidget(RH_fridge_icon, "1.8", Colors.yellowAccent),
                    settingAvailabilityWidget(RH_tv_icon, "Free", Colors.grey),
                    settingAvailabilityWidget(RH_ait_conditioner_icon, "6.1", Colors.deepOrangeAccent),
                  ],
                ),
                8.height,
              ],
            ).paddingOnly(left: 30, right: 30, top: 30, bottom: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.chat, color: Colors.grey),
                4.width,
                Text("Chat", style: secondaryTextStyle(size: 16)),
              ],
            ),
            8.width,
            AppButton(
              padding: EdgeInsets.only(left: 30, right: 30, top: 16, bottom: 16),
              color: appPrimaryColor,
              child: Text('Book now', style: boldTextStyle(size: 14, color: white)),
              onTap: () {
                RHListYourSpaceScreen().launch(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
            ),
            8.width,
            Row(
              children: [
                Icon(Icons.phone_android_outlined, color: Colors.grey),
                4.width,
                Text("Call", style: secondaryTextStyle(size: 16)).onTap(() {
                  launchURL('tel:$phone');
                }),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }

  Widget avalibilityWidget(String title, String data) {
    return Column(
      children: [
        Text(title, style: secondaryTextStyle()),
        6.height,
        Text(data, style: boldTextStyle(color: appPrimaryColor)),
      ],
    );
  }

  Widget settingAvailabilityWidget(String image, String title, Color color) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          padding: EdgeInsets.all(10),
          decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), backgroundColor: color),
          child: Image.asset(image, height: 24, width: 24, color: white),
        ),
        12.height,
        Text(title, style: secondaryTextStyle(), textAlign: TextAlign.center)
      ],
    );
  }

  Future<void> launchURL(String url, {bool forceWebView = false}) async {
    await launch(url, enableJavaScript: true, forceWebView: forceWebView).catchError((e) {
      throw '$url is not valid';
    });
  }
}
