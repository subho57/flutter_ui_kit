import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNDataProvider.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNFeedbackAndSupportScreen extends StatefulWidget {
  static String tag = '/VPNFeedbackAndSupport';

  @override
  VPNFeedbackAndSupportScreenState createState() => VPNFeedbackAndSupportScreenState();
}

class VPNFeedbackAndSupportScreenState extends State<VPNFeedbackAndSupportScreen> {
  var getFeedbackAndSupportData = getFeedbackAndSupportList();

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
        body: Container(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        finish(context);
                      },
                      child: commonActionButton(icon: Icons.arrow_back_ios_rounded)),
                  Text("Feedback And Support", style: boldTextStyle(color: commonColorWhite, size: 26), textAlign: TextAlign.center).expand(),
                ],
              ).paddingAll(16),
              Column(
                children: getFeedbackAndSupportData.map((e) {
                  return Container(
                    decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [IconButton(icon: e.icon, onPressed: null), Text(e.title, style: TextStyle(fontSize: textSize, color: commonColorWhite), overflow: TextOverflow.ellipsis).expand()],
                    ).paddingAll(8).onTap(() {
                      //
                    }),
                  ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
