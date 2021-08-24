import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAHomeComponent.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAHomeTopComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class FAHomeScreen extends StatefulWidget {
  static String tag = '/FAHomeScreen';

  @override
  FAHomeScreenState createState() => FAHomeScreenState();
}

class FAHomeScreenState extends State<FAHomeScreen> {
  String selectedAmount = '*2563';

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
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: context.height() * 0.5,
                floating: false,
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                backgroundColor: innerBoxIsScrolled
                    ? fa_color_primary
                    : appStore.isDarkModeOn
                        ? scaffoldColorDark
                        : Colors.white,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Text('Finance', style: boldTextStyle(color: Colors.white, size: 22)).expand(),
                    Container(
                      height: 40,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radius(16),
                        backgroundColor: fa_color_secondary.withOpacity(0.2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedAmount,
                          dropdownColor: Colors.grey[600],
                          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                          items: <String>['*2563', '*4523', '*1236', '*6522'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: primaryTextStyle(color: Colors.white)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedAmount = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                    16.width,
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: FAHomeTopComponent(),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              height: context.height(),
              decoration: boxDecorationWithShadow(
                backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
                boxShadow: defaultBoxShadow(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  24.height,
                  Text('Upcoming', style: boldTextStyle(size: 18)).paddingOnly(left: 16, right: 16),
                  8.height,
                  Text(
                    'You have 6 upcoming subscriptions',
                    style: secondaryTextStyle(),
                  ).paddingOnly(left: 16, right: 16),
                  16.height,
                  FAHomeComponent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
