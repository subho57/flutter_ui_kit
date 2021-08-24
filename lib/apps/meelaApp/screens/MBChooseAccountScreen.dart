import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBTransferSuccessFullScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBChooseAccountScreen extends StatefulWidget {
  static String tag = '/MBChooseAccountScreen';

  @override
  MBChooseAccountScreenState createState() => MBChooseAccountScreenState();
}

class MBChooseAccountScreenState extends State<MBChooseAccountScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AppButton(
              color: appPrimaryColor,
              elevation: 12.0,
              width: 130,
              onTap: () {
                MBTransferSuccessFullScreen().launch(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text('Confirm', style: boldTextStyle(color: white)),
            ),
            AppButton(
              width: 130,
              color: appStore.cardColor,
              onTap: () {
                finish(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text('Take me back', style: boldTextStyle()),
            ),
          ],
        ).paddingOnly(top: 16, bottom: 16),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              28.height,
              Text('Choose Account', style: boldTextStyle(size: 28)),
              16.height,
              Text('Please select account from which you want \n to transfer money.', style: secondaryTextStyle(size: 16)),
              16.height,
              Text('From Card', style: boldTextStyle()),
              16.height,
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                margin: EdgeInsets.all(4),
                decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                child: Row(
                  children: [
                    Image.asset(mb_visaCard_logo, fit: BoxFit.cover, height: 60, width: 60),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Visa MasterCard', style: boldTextStyle()),
                        4.height,
                        Text('**** **** **** 1425', style: primaryTextStyle()),
                      ],
                    )
                  ],
                ).paddingOnly(left: 8),
              ).cornerRadiusWithClipRRect(10),
              16.height,
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                margin: EdgeInsets.all(4),
                decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                child: Row(
                  children: [
                    Image.asset(mb_master1_logo, fit: BoxFit.cover, height: 60, width: 60),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MasterCard Gold', style: boldTextStyle()),
                        4.height,
                        Text('**** **** **** 1425', style: primaryTextStyle()),
                      ],
                    )
                  ],
                ).paddingOnly(left: 8),
              ).cornerRadiusWithClipRRect(10),
              16.height,
              Text('From Bank or ATM', style: boldTextStyle()),
              16.height,
              Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                margin: EdgeInsets.all(4),
                decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                child: Row(
                  children: [
                    Image.asset(mb_home_logo, fit: BoxFit.cover, height: 60, width: 60),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Account Name', style: boldTextStyle()),
                        4.height,
                        Text('**** **** **** 1425', style: primaryTextStyle()),
                      ],
                    )
                  ],
                ).paddingOnly(left: 8),
              ).cornerRadiusWithClipRRect(10),
            ],
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ),
      ),
    );
  }
}
