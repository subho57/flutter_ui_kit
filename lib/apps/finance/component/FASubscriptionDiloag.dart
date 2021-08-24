import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FASubscriptionDialog extends StatefulWidget {
  static String tag = '/SubscriptionDialog';

  final FASubscriptionModel subscriptionData;

  FASubscriptionDialog({this.subscriptionData});

  @override
  FASubscriptionDialogState createState() => FASubscriptionDialogState();
}

class FASubscriptionDialogState extends State<FASubscriptionDialog> {
  var isRecurring = true;

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
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingItemWidget(
            padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
            leading: Image.asset(widget.subscriptionData.image, height: 50, width: 50, fit: BoxFit.fill),
            title: widget.subscriptionData.name,
            subTitle: "***123456",
          ),
          Divider().paddingOnly(left: 16, right: 16),
          8.height,
          Text('Amount', style: primaryTextStyle()).paddingOnly(left: 16, right: 16),
          8.height,
          Text(widget.subscriptionData.price, style: boldTextStyle(size: 28)).paddingOnly(left: 16, right: 16),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date & time', style: secondaryTextStyle()),
              Text(DateFormat('EEEE - MMM dd, yyyy').format(DateTime.now()), style: boldTextStyle(size: 14)),
            ],
          ).paddingOnly(left: 16, right: 16),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Category', style: secondaryTextStyle()),
              Spacer(),
              Text('Bills & Utilities', style: boldTextStyle(size: 14)),
              4.width,
              Icon(Icons.navigate_next_outlined, color: Colors.grey),
            ],
          ).paddingOnly(left: 16, right: 16),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recurring', style: secondaryTextStyle()),
              CupertinoSwitch(
                value: isRecurring,
                activeColor: fa_color_secondary,
                trackColor: gray,
                onChanged: (bool value) {
                  setState(() {
                    isRecurring = value;
                  });
                },
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Checking *6811', style: secondaryTextStyle()),
              Spacer(),
              Text('Bills & Utilities', style: boldTextStyle(size: 14)),
              4.width,
              Icon(Icons.navigate_next_outlined, color: Colors.grey),
            ],
          ).paddingOnly(left: 16, right: 16),
          32.height,
          AppButton(
            width: context.width(),
            child: Text("See history (10)", style: boldTextStyle(color: white)),
            color: fa_color_secondary,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
            onTap: () {
              finish(context);
            },
          ).paddingOnly(left: 16, right: 16)
        ],
      ).paddingOnly(top: 16, bottom: 16),
    );
  }
}
