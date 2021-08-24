import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNDataProvider.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNPremiumFragment extends StatefulWidget {
  static String tag = '/VPNPremiumFragment';

  @override
  VPNPremiumFragmentState createState() => VPNPremiumFragmentState();
}

class VPNPremiumFragmentState extends State<VPNPremiumFragment> {
  var getPremiumListData = getPremiumList();

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
        backgroundColor: vpnBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("premium", style: boldTextStyle(color: commonColorWhite, size: 26)).center().paddingAll(16),
              Column(
                children: getPremiumListData.map((e) => commonListTile(title: e.title, icon: e.icon)).toList(),
              ),
              Container(
                      decoration: BoxDecoration(color: commonBackBorderColor),
                      child: Row(
                        children: [
                          Text("1 Month", style: boldTextStyle(size: textSize.toInt(), color: commonColorWhite), overflow: TextOverflow.ellipsis).expand(),
                          Text("\$10/month", style: boldTextStyle(size: textSize.toInt(), color: commonColorWhite), overflow: TextOverflow.ellipsis)
                        ],
                      ).paddingAll(16))
                  .paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
              Container(
                      decoration: BoxDecoration(color: commonBackBorderColor),
                      child: Row(
                        children: [
                          Text("1 Year", style: boldTextStyle(size: textSize.toInt(), color: commonColorWhite), overflow: TextOverflow.ellipsis).expand(),
                          Text("\$75/year", style: boldTextStyle(size: textSize.toInt(), color: commonColorWhite), overflow: TextOverflow.ellipsis)
                        ],
                      ).paddingAll(16))
                  .paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
              AppButton(
                width: context.width(),
                height: 50,
                color: appPrimaryColor,
                child: Text("Get Premium", style: boldTextStyle(color: commonColorWhite), textAlign: TextAlign.center),
                onTap: () {
                  //
                },
              ).paddingOnly(left: 16, right: 16, bottom: 8, top: 8),
            ],
          ),
        ),
      ),
    );
  }
}
