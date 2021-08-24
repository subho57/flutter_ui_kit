import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNSettingScreen extends StatefulWidget {
  static String tag = '/VPNSettingScreen';

  @override
  VPNSettingScreenState createState() => VPNSettingScreenState();
}

class VPNSettingScreenState extends State<VPNSettingScreen> {
  bool _switchOn = false;

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          finish(context);
                        },
                        child: commonActionButton(icon: Icons.arrow_back_ios_rounded)),
                    Text("Setting", style: boldTextStyle(color: commonColorWhite, size: 26), textAlign: TextAlign.center).expand(),
                  ],
                ).paddingAll(16),
                Container(
                  decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      IconButton(icon: Icon(Icons.notifications, color: commonColorWhite, size: 26), onPressed: null),
                      Text('Notification', style: TextStyle(fontSize: 16, color: commonColorWhite), overflow: TextOverflow.ellipsis).expand(),
                      CupertinoSwitch(
                          activeColor: commonButtonColor,
                          value: _switchOn,
                          onChanged: (value) {
                            setState(() {
                              _switchOn = value;
                            });
                          })
                    ],
                  ).paddingAll(8).onTap(() {
                    setState(() {
                      _switchOn = !_switchOn;
                    });
                  }),
                ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(border: Border.all(color: commonBackBorderColor), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(icon: Icon(Icons.star, size: 26, color: commonColorWhite), onPressed: null),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Premium Features", style: boldTextStyle(size: 20, color: commonColorWhite)),
                          4.height,
                          Text("You must to a Premium member, to access other settings.", style: TextStyle(fontSize: textSize, color: commonColorWhite)),
                        ],
                      ).expand()
                    ],
                  ),
                ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16),
                AppButton(
                        width: context.width(),
                        height: 50,
                        color: commonButtonColor,
                        child: Text("Upgrade", style: boldTextStyle(color: commonColorWhite), textAlign: TextAlign.center),
                        onTap: () {
                          //
                        })
                    .paddingOnly(left: 16, right: 16, bottom: 16, top: 8)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
