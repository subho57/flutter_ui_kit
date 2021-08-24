import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFoodDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMarketPopularListComponent extends StatefulWidget {
  static String tag = '/FDMarketPopularListComponent';

  @override
  FDMarketPopularListComponentState createState() => FDMarketPopularListComponentState();
}

class FDMarketPopularListComponentState extends State<FDMarketPopularListComponent> {
  List<FDPopularItemModel> marketPopularItems = fdGetPopularItems();
  List<FDPopularItemModel> items = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    marketPopularItems.forEach((element) {
      if (!element.isFavourite) {
        items.add(element);
      }
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    /* return GridView.builder(
      itemCount: marketPopularItems.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: boxDecorationRoundedWithShadow(8),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.height,
                  Image.asset(marketPopularItems[index].image, width: 100, height: 100).center(),
                  4.height,
                  Text(marketPopularItems[index].name, style: primaryTextStyle(), maxLines: 1),
                  4.height,
                  Row(
                    children: [
                      Text('\$${marketPopularItems[index].dollarPrice.toString()}', style: boldTextStyle()),
                      4.width,
                      marketPopularItems[index].salePrice != null
                          ? Text(
                              '\$${marketPopularItems[index].salePrice.toString()}',
                              style: secondaryTextStyle(decoration: TextDecoration.lineThrough),
                            )
                          : Text(''),
                    ],
                  ),
                ],
              ).paddingOnly(left: 16, right: 16),
              Positioned(
                right: 0,
                left: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    marketPopularItems[index].discount != null
                        ? Container(
                            color: FDRedColor,
                            child: Text(
                              '${marketPopularItems[index].discount.toString()}%',
                              style: secondaryTextStyle(color: white),
                            ),
                            padding: EdgeInsets.only(left: 8, right: 8),
                          )
                        : Text(''),
                    marketPopularItems[index].isFavourite
                        ? IconButton(
                            icon: Icon(Icons.favorite),
                            color: Colors.red.withOpacity(0.5),
                            onPressed: () {
                              setState(() {
                                marketPopularItems[index].isFavourite = !marketPopularItems[index].isFavourite;
                              });
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.favorite_outline),
                            onPressed: () {
                              setState(() {
                                marketPopularItems[index].isFavourite = !marketPopularItems[index].isFavourite;
                              });
                            },
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );*/
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: List.generate(items.length, (index) {
          return Container(
            decoration: boxDecorationRoundedWithShadow(8),
            width: (context.width() - (2 * 16) - 16) * 0.50,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.height,
                    Image.asset(items[index].image, height: context.width() * 0.25, fit: BoxFit.cover).center(),
                    4.height,
                    Text(items[index].name, style: primaryTextStyle(), maxLines: 1),
                    4.height,
                    Row(
                      children: [
                        Text('\$${items[index].price.toString()}', style: boldTextStyle()),
                        4.width,
                        items[index].salePrice != null
                            ? Text(
                                '\$${items[index].salePrice.toString()}',
                                style: secondaryTextStyle(decoration: TextDecoration.lineThrough),
                              )
                            : Text(''),
                      ],
                    ),
                    4.height,
                  ],
                ).paddingOnly(left: 16, right: 16),
                Positioned(
                  right: 0,
                  left: 16,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      items[index].discount != null
                          ? Container(
                              color: FDRedColor,
                              child: Text(
                                '${items[index].discount.toString()}%',
                                style: secondaryTextStyle(color: white),
                              ),
                              padding: EdgeInsets.only(left: 8, right: 8),
                            )
                          : Text(''),
                      items[index].isFavourite
                          ? IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.red.withOpacity(0.5),
                              onPressed: () {
                                setState(() {
                                  items[index].isFavourite = !items[index].isFavourite;
                                });
                              },
                            )
                          : IconButton(
                              icon: Icon(Icons.favorite_outline),
                              onPressed: () {
                                setState(() {
                                  items[index].isFavourite = !items[index].isFavourite;
                                });
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ).onTap(() {
            FDFoodDetailsScreen(data: items[index]).launch(context);
          });
        }),
      ),
    );
  }
}
