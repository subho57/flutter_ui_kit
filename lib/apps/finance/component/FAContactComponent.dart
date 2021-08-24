import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FADataProvider.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FAContactComponent extends StatefulWidget {
  static String tag = '/FAContactComponent';

  @override
  FAContactComponentState createState() => FAContactComponentState();
}

class FAContactComponentState extends State<FAContactComponent> {
  List<FAContactModel> contactList = getContactList();

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
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
      itemCount: contactList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) {
        FAContactModel mData = contactList[index];
        return sendMoneyUserWidget(image: mData.profile, name: mData.name, type: mData.type).paddingRight(16);
      },
      separatorBuilder: (_, i) => Divider(),
    );
  }
}
