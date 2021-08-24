import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class FASendAgainComponent extends StatefulWidget {
  static String tag = '/FASendAgainComponent';

  @override
  FASendAgainComponentState createState() => FASendAgainComponentState();
}

class FASendAgainComponentState extends State<FASendAgainComponent> {
  List<FASendAgainUserModel> userList = getSendAgainUserList();

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
      height: 140,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
        itemCount: userList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          FASendAgainUserModel mData = userList[index];
          return Column(
            children: [
              Image.asset(
                mData.image,
                height: 70,
                width: 70,
                fit: BoxFit.fill,
              ).cornerRadiusWithClipRRect(40),
              8.height,
              Text(mData.name, style: boldTextStyle(size: 14)),
            ],
          ).paddingOnly(right: 16);
        },
      ),
    );
  }
}
