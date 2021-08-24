import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSettingCommonCard extends StatefulWidget {
  static String tag = '/MBSettingCommonCard';

  final String name;
  final IconData icon;

  MBSettingCommonCard({this.name, this.icon});

  @override
  MBSettingCommonCardState createState() => MBSettingCommonCardState();
}

class MBSettingCommonCardState extends State<MBSettingCommonCard> {
  bool statusValue = false;

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
    return Container(
      decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
      child: Row(
        children: [
          8.width,
          Icon(widget.icon, color: appPrimaryColor),
          8.width,
          Text(widget.name, style: primaryTextStyle()).expand(),
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
    );
  }
}
