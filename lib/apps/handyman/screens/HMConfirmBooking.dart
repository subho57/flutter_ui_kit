import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMAddPaymentMethod.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class HMConfirmBookingScreen extends StatefulWidget {
  static String tag = '/HMConfirmBookingScreen';

  @override
  HMConfirmBookingScreenState createState() => HMConfirmBookingScreenState();
}

class HMConfirmBookingScreenState extends State<HMConfirmBookingScreen> {
  int cardIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                finish(context);
              }),
          centerTitle: true,
          title: Text("Confirm Appointment", style: boldTextStyle(size: 16)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Text("Confirm Appointment", style: boldTextStyle(size: 22)),
                16.height,
                Text(
                  "Please check the information below again and don't forgot edit if you have any mistake.",
                  textAlign: TextAlign.center,
                  style: secondaryTextStyle(),
                ),
                16.height,
                Container(
                  decoration: BoxDecoration(color: HMColorWhite),
                  child: CommonSinglePersonDetail(title: "Confirm Appointment", widgets: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(child: commonCacheImageWidget(hm_person2, 80, width: 80, fit: BoxFit.cover)).cornerRadiusWithClipRRect(
                              HMCornerRadius,
                            ),
                            16.width,
                            Text("Full Serv,ice Lawn Care", style: boldTextStyle(size: 18))
                          ],
                        ),
                        Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                        Row(
                          children: [
                            Text("Time", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                            Text("04:30PM,Aug 14 2020", style: boldTextStyle(color: hmColorPrimary)),
                          ],
                        ),
                        Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                        Row(
                          children: [
                            Text("Places", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                            Text("Commercial", style: boldTextStyle()),
                          ],
                        ),
                        Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                        Row(
                          children: [
                            Text("Type", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                            Text("Large(5,000-10,000 sq ft)", style: boldTextStyle()),
                          ],
                        ),
                        Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                        Row(
                          children: [
                            Text("Status Lawn", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(),
                            Text("Once a week", style: boldTextStyle()),
                          ],
                        ),
                        Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                        Row(
                          children: [Text("Options", style: TextStyle(fontSize: 18, color: HMFontColor400)).expand(), Text("Moving, trimming & edging\nFertilizing and overseeding", style: boldTextStyle())],
                        ),
                        Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                        Row(
                          children: [
                            Text("Total Price", style: primaryTextStyle(size: 18)).expand(),
                            Text("\$325", style: boldTextStyle(color: hmColorPrimary)),
                          ],
                        ),
                      ],
                    )
                  ]),
                ).cornerRadiusWithClipRRect(HMCornerRadius),
                16.height,
                Container(
                  decoration: BoxDecoration(color: appStore.cardColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Payment Methods", style: boldTextStyle(size: 22)).paddingOnly(left: 16, top: 8, bottom: 8).expand(),
                          Text("Add new method", style: TextStyle(color: hmColorPrimary)).paddingRight(8).onTap(
                            () async {
                              await HMAddPaymentMethod().launch(context);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Divider(thickness: 1, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark, height: 0),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: cardData.length,
                          itemBuilder: (context, index) {
                            return CommonCardDetail(
                              mainIndex: index,
                              selectedIndex: cardIndex,
                              cardNumber: cardData[index].cardNumber,
                              cardImage: cardData[index].cardImage,
                              isBorder: true,
                            ).onTap(() {
                              cardIndex = index;
                              setState(() {});
                            }).paddingOnly(left: 16, right: 16, bottom: 16);
                          })
                    ],
                  ),
                ).cornerRadiusWithClipRRect(HMCornerRadius),
                16.height,
                CommonButton("Confirm Booking").onTap(() {
                  finish(context);
                  toast("Booking Appointment successfully");
                })
              ],
            ),
          ).paddingAll(HMAppPadding),
        ),
      ),
    );
  }
}
