import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDReviewScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMyOrderHistoryListComponent extends StatefulWidget {
  static String tag = '/FDMyOrderHistoryListComponent';

  @override
  FDMyOrderHistoryListComponentState createState() => FDMyOrderHistoryListComponentState();
}

class FDMyOrderHistoryListComponentState extends State<FDMyOrderHistoryListComponent> {
  List<FDMyOrderHistoryItemModel> myOrderHistoryItems = fdGetMyOrderHistoryItems();

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
    return ListView.builder(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: boxDecorationRoundedWithShadow(8),
          child: Row(
            children: [
              Expanded(flex: 2, child: Image.asset(myOrderHistoryItems[index].image, fit: BoxFit.cover, height: context.width() * 0.25)),
              4.width,
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(myOrderHistoryItems[index].name, style: primaryTextStyle(size: 14)),
                    4.height,
                    Text(
                      '\$${myOrderHistoryItems[index].dollarPrice.toString()}',
                      style: boldTextStyle(),
                    ),
                    4.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButton(
                          child: Text('Review', style: boldTextStyle(size: 14)),
                          onTap: () {
                            FDReviewScreen(item: myOrderHistoryItems[index]).launch(context);
                          },
                          elevation: 0,
                          padding: EdgeInsets.only(top: 0, bottom: 0),
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          color: grey.withOpacity(0.1),
                        ),
                        AppButton(
                          child: Text('Reorder', style: boldTextStyle(size: 14)),
                          onTap: () {
                            FDDashBoardScreen().launch((context));
                          },
                          elevation: 0,
                          padding: EdgeInsets.only(top: 0, bottom: 0),
                          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          color: grey.withOpacity(0.1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).paddingOnly(bottom: 16);
      },
      itemCount: myOrderHistoryItems.length,
      scrollDirection: Axis.vertical,
    );
  }
}
