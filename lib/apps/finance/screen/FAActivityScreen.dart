import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAActivityTabReportComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FAActivityScreen extends StatefulWidget {
  static String tag = '/FAActivityScreen';

  @override
  FAActivityScreenState createState() => FAActivityScreenState();
}

class FAActivityScreenState extends State<FAActivityScreen> with SingleTickerProviderStateMixin {
  TabController tabController;
  String selectedDays = 'Monthly';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: context.height() * 0.4,
              color: fa_color_primary,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                activityTabBar(context, tabController: tabController),
                TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(child: FAActivityTabReportComponent()),
                    SingleChildScrollView(child: FAActivityTabReportComponent()),
                  ],
                ).expand(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
