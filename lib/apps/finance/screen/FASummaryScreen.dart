import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/component/FASummaryComponent.dart';
import 'package:mighty_ui_kit/apps/finance/component/FASummaryTopComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FASummaryScreen extends StatefulWidget {
  static String tag = '/FASummaryScreen';

  @override
  FASummaryScreenState createState() => FASummaryScreenState();
}

class FASummaryScreenState extends State<FASummaryScreen> {
  double progressValue = 0;
  double secondaryProgressValue = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: faGradientBoxDecoration(),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                    8.width,
                    Text('Summary', style: boldTextStyle(color: Colors.white, size: 16)).center(),
                  ],
                ).paddingBottom(16),
                expandedHeight: context.height() * 0.6,
                floating: false,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                backgroundColor: innerBoxIsScrolled
                    ? fa_color_primary
                    : appStore.isDarkModeOn
                        ? scaffoldColorDark
                        : Colors.white,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: FASummaryTopComponent(),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              decoration: boxDecorationWithShadow(
                backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
                boxShadow: defaultBoxShadow(),
              ),
              height: context.height(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  Text('Top expense', style: boldTextStyle(size: 18)).paddingOnly(left: 16, right: 16),
                  8.height,
                  FASummaryComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
