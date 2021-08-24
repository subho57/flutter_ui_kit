import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNDataProvider.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNFAQScreen extends StatefulWidget {
  static String tag = '/VPNFAQScreen';

  @override
  VPNFAQScreenState createState() => VPNFAQScreenState();
}

class VPNFAQScreenState extends State<VPNFAQScreen> {
  var getFAQListData = getFAQList();

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
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          finish(context);
                        },
                        child: commonActionButton(icon: Icons.arrow_back_ios_rounded)),
                    Text("FAQ", style: boldTextStyle(color: commonColorWhite, size: 26), textAlign: TextAlign.center).expand(),
                  ],
                ).paddingAll(16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(icon: Icon(Icons.my_library_books_rounded, size: 26, color: commonColorWhite), onPressed: null),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Why i need VPN", style: boldTextStyle(size: 20, color: commonColorWhite)),
                          4.height,
                          Text("VPN is virtual private network. It allows you to stay private, stay secure and Access any online context you want - no matter where you are",
                              style: TextStyle(fontSize: textSize, color: commonColorWhite)),
                        ],
                      ).expand()
                    ],
                  ),
                ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
                Column(
                  children: getFAQListData.map((e) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [IconButton(icon: e.icon, onPressed: null), Text(e.title, style: TextStyle(fontSize: textSize, color: commonColorWhite)).expand()],
                      ),
                    ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
