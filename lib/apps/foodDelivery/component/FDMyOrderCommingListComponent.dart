import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDShippingDetailScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMyOrderCommingListComponent extends StatefulWidget {
  static String tag = '/FDMyOrderCommingListComponent';

  @override
  FDMyOrderCommingListComponentState createState() => FDMyOrderCommingListComponentState();
}

class FDMyOrderCommingListComponentState extends State<FDMyOrderCommingListComponent> {
  List<FDMyOrderCommingItemModel> myOrderCommingItems = fdGetMyOrderCommingItems();

  Widget returnText(int i) {
    if (myOrderCommingItems[i].flag == 0) {
      return Row(
        children: [
          Text('Request accepted', style: secondaryTextStyle(color: Colors.red)),
          4.width,
          Container(decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red), width: 6, height: 6),
        ],
      );
    } else if (myOrderCommingItems[i].flag == 1) {
      return Row(
        children: [
          Text('Send Request', style: secondaryTextStyle(color: Colors.green)),
          4.width,
          Container(decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.green), width: 6, height: 6),
        ],
      );
    } else if (myOrderCommingItems[i].flag == 2) {
      return Row(
        children: [
          Text('Picked up', style: secondaryTextStyle(color: Colors.purple)),
          4.width,
          Container(decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.purple), width: 6, height: 6),
        ],
      );
    }
    return Text('');
  }

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
    if (myOrderCommingItems.length != 0) {
      return ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        itemBuilder: (context, index) {
          return Container(
            decoration: boxDecorationRoundedWithShadow(8),
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset(myOrderCommingItems[index].image, fit: BoxFit.cover, height: context.width() * 0.25)),
                4.width,
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          returnText(index),
                          4.width,
                          Text(myOrderCommingItems[index].time, style: secondaryTextStyle()),
                        ],
                      ),
                      4.height,
                      Text(myOrderCommingItems[index].name, style: primaryTextStyle(size: 14)),
                      4.height,
                      Text(
                        '\$${myOrderCommingItems[index].dollarPrice.toString()}',
                        style: boldTextStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).paddingOnly(bottom: 16).onTap(() {
            FDShippingDetailScreen(data: myOrderCommingItems[index]).launch(context);
          });
        },
        itemCount: myOrderCommingItems.length,
        scrollDirection: Axis.vertical,
      );
    }
    return Center(child: Text('No order yet', style: boldTextStyle()));
  }
}
