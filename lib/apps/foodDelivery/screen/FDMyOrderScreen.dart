import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDMyOrderCommingListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDMyOrderHistoryListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMyOrderScreen extends StatefulWidget {
  static String tag = '/FDMyOrderScreen';

  @override
  FDMyOrderScreenState createState() => FDMyOrderScreenState();
}

class FDMyOrderScreenState extends State<FDMyOrderScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: fdCreateRichText('My ', 'Order', FDPrimaryColor),
        automaticallyImplyLeading: false,
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: [
            Container(
              decoration: boxDecorationWithShadow(),
              padding: EdgeInsets.all(16),
              child: TabBar(
                tabs: [
                  Tab(text: 'On Way'),
                  Tab(text: 'History'),
                  Tab(text: 'Draft'),
                ],
                indicator: BoxDecoration(
                  color: FDSelectedTextColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                labelStyle: boldTextStyle(),
                unselectedLabelStyle: secondaryTextStyle(),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: FDSelectedTextColor,
                unselectedLabelColor: grey,
              ),
            ),
            TabBarView(
              children: [
                FDMyOrderCommingListComponent(),
                FDMyOrderHistoryListComponent(),
                Center(child: Text('Draft')),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
