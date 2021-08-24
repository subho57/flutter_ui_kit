import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFoodDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMoreFoodsComponent extends StatefulWidget {
  static String tag = '/FDMoreFoodsComponent';

  @override
  FDMoreFoodsComponentState createState() => FDMoreFoodsComponentState();
}

class FDMoreFoodsComponentState extends State<FDMoreFoodsComponent> {
  List<FDPopularItemModel> popularItems = fdGetPopularItems();

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
    return Container(
      height: 100,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
        itemCount: popularItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          FDPopularItemModel mData = popularItems[index];
          return Container(
            decoration: boxDecorationRoundedWithShadow(8),
            padding: EdgeInsets.all(8),
            width: 160,
            child: Row(
              children: [
                Image.asset(mData.image).expand(),
                4.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mData.name, style: boldTextStyle(), softWrap: true, maxLines: 1),
                    Text('\$${mData.price}', style: secondaryTextStyle()),
                  ],
                ).expand(),
              ],
            ),
          ).paddingRight(16).onTap(() {
            FDFoodDetailsScreen(data: mData).launch(context);
          });
        },
      ),
    );
  }
}
