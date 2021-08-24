import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSettingCommonCard.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBColors.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBCardScreen extends StatefulWidget {
  static String tag = '/MBWatchTutorialScreen';

  @override
  MBCardScreenState createState() => MBCardScreenState();
}

class MBCardScreenState extends State<MBCardScreen> {
  bool status = true;
  bool statusValue = true;

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              28.height,
              Text('Your Cards', style: boldTextStyle(size: 26)).paddingOnly(left: 16),
              8.height,
              Text('2 Physical 1 virtual debit card', style: primaryTextStyle()).paddingOnly(left: 16),
              16.height,
              Row(
                children: [
                  16.width,
                  AppButton(
                    child: Text('Physical Card', textAlign: TextAlign.center, style: primaryTextStyle(color: Colors.white)),
                    color: appPrimaryColor,
                    onTap: () {},
                    width: 120,
                  ),
                  16.width,
                  AppButton(
                    child: Text('Virtual Card', textAlign: TextAlign.center, style: primaryTextStyle(color: appStore.isDarkModeOn ? white : scaffoldColorDark)),
                    // color: MBVirtualCardColor,
                    color: appStore.isDarkModeOn ? appStore.cardColor : MBVirtualCardColor,
                    onTap: () {},
                    width: 120,
                  ),
                ],
              ).paddingOnly(left: 8),
              16.height,
              Container(
                height: 220,
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return mastercardWidget(width: context.width() * 0.85).paddingOnly(right: 8, left: 8);
                    }),
              ),
              16.height,
              Text('Card Settings', style: boldTextStyle()).paddingOnly(left: 16),
              16.height,
              Container(
                decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                child: Row(
                  children: [
                    8.width,
                    Icon(Icons.contactless_outlined, color: appPrimaryColor),
                    8.width,
                    Text('ContactLess payments', style: primaryTextStyle()).expand(),
                    Switch(
                      activeColor: Colors.green,
                      activeTrackColor: Colors.grey,
                      inactiveTrackColor: Colors.grey,
                      value: statusValue,
                      onChanged: (value) {
                        statusValue = value;
                        setState(() {});
                      },
                    )
                  ],
                ).paddingSymmetric(horizontal: 8),
              ),
              8.height,
              MBSettingCommonCard(name: 'Online payments', icon: Icons.wallet_giftcard_rounded),
              8.height,
              MBSettingCommonCard(name: 'ATM Withdraw', icon: Icons.local_atm_sharp),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
