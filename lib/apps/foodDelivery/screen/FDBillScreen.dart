import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDBillScreen extends StatefulWidget {
  static String tag = '/FDBillScreen';

  @override
  FDBillScreenState createState() => FDBillScreenState();
}

class FDBillScreenState extends State<FDBillScreen> {
  List<FDFavouriteStoreProductsModel> items = fdGetFavouriteStoreProductsItems();

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
    return Scaffold(
      appBar: fdAppBarWidget(title: 'Bill #1212', context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: boxDecorationWithShadow(),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total (Inc Shipping fee)', style: primaryTextStyle(size: 14)),
                      Text('\$190.00', style: boldTextStyle()),
                    ],
                  ),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status', style: primaryTextStyle(size: 14)),
                      Text('Completed', style: boldTextStyle(color: FDSelectedTextColor, size: 14)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(items.length, (index) {
                  FDFavouriteStoreProductsModel mData = items[index];
                  return Container(
                    width: (context.width() - (3 * 16)) * 0.5,
                    decoration: boxDecorationRoundedWithShadow(8),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mData.name, style: boldTextStyle(size: 14)),
                        Text(mData.quantityPerPrice, style: secondaryTextStyle()),
                        Image.asset(mData.image, height: context.width() * 0.4),
                        Text('\$${mData.price}', style: boldTextStyle()),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: fdAppButton(
        FDPrimaryColor,
        () {
          FDDashBoardScreen().launch(context);
        },
        context,
        'Reorder',
      ).paddingAll(16),
    );
  }
}
