import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDDriveReviewComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDFoodReviewComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FDReviewScreen extends StatefulWidget {
  static String tag = '/FDReviewScreen';
  final FDMyOrderHistoryItemModel item;

  FDReviewScreen({this.item});

  @override
  FDReviewScreenState createState() => FDReviewScreenState();
}

class FDReviewScreenState extends State<FDReviewScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: FDPrimaryColor,
        body: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: 'Drive'),
                  Tab(text: 'Food'),
                ],
                indicator: BoxDecoration(),
                labelStyle: boldTextStyle(),
                unselectedLabelStyle: primaryTextStyle(),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: white,
                unselectedLabelColor: Colors.white60,
              ).paddingAll(16),
              TabBarView(
                children: [
                  FDDriveReviewComponent(),
                  FDFoodReviewComponent(widget.item),
                ],
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
