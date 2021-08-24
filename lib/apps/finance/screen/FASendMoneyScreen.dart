import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAContactComponent.dart';
import 'package:mighty_ui_kit/apps/finance/component/FASendAgainComponent.dart';
import 'package:mighty_ui_kit/apps/finance/component/FASendMoneyTopComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class FASendMoneyScreen extends StatefulWidget {
  static String tag = '/FASendMoneyScreen';

  @override
  FASendMoneyScreenState createState() => FASendMoneyScreenState();
}

class FASendMoneyScreenState extends State<FASendMoneyScreen> {
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
    return Scaffold(
      backgroundColor: fa_color_primary,
      body: Container(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: fa_color_primary,
                expandedHeight: context.height() * 0.4,
                floating: false,
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: FASendMoneyTopComponent(),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_outlined, color: white).onTap(() {
                      finish(context);
                    }),
                    Icon(Icons.search, color: white)
                  ],
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              height: context.height(),
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
                borderRadius: radiusOnly(topLeft: 12, topRight: 12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Send again', style: boldTextStyle()).paddingOnly(top: 16, left: 16),
                  FASendAgainComponent(),
                  Divider().paddingOnly(left: 16, right: 16),
                  Text('All contacts', style: boldTextStyle()).paddingOnly(top: 16, left: 16),
                  FAContactComponent()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
