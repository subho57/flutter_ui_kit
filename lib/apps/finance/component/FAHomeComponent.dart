import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FADataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FASubscriptionDiloag.dart';

class FAHomeComponent extends StatefulWidget {
  static String tag = '/FAHomeComponent';

  @override
  FAHomeComponentState createState() => FAHomeComponentState();
}

class FAHomeComponentState extends State<FAHomeComponent> {
  List<FASubscriptionModel> subscriptionList = getSubscriptionList();

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
    return Container(
      height: 220,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, bottom: 16, top: 16, right: 8),
        itemCount: subscriptionList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          FASubscriptionModel mData = subscriptionList[index];
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 8),
            width: 175,
            decoration: boxDecorationRoundedWithShadow(
              8,
              backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  mData.image,
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                16.height,
                Text(mData.name, style: boldTextStyle(size: 14)),
                8.height,
                Text(mData.days, style: secondaryTextStyle()),
                8.height,
                Text(mData.price, style: boldTextStyle()),
              ],
            ),
          ).onTap(() async {
            await showInDialog(
              context,
              child: FASubscriptionDialog(subscriptionData: mData),
              shape: dialogShape(16),
              contentPadding: EdgeInsets.zero,
              barrierDismissible: true,
            );
          });
        },
      ),
    );
  }
}
