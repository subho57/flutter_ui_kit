import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFoodDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFavoriteScreen extends StatefulWidget {
  static String tag = '/FDFavoriteScreen';

  @override
  FDFavoriteScreenState createState() => FDFavoriteScreenState();
}

class FDFavoriteScreenState extends State<FDFavoriteScreen> {
  List<FDPopularItemModel> favouriteItems = fdGetPopularItems();
  List<FDPopularItemModel> items = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    favouriteItems.forEach((element) {
      if (element.isFavourite == true) {
        items.add(element);
      }
    });
  }

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
        elevation: 8,
        title: fdCreateRichText('Favou', 'rite', FDPrimaryColor),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.dashboard_sharp, color: FDPrimaryColor).paddingOnly(right: 16),
        ],
      ),
      body: items.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(items.length, (index) {
                    return Container(
                      width: (context.width() - (2 * 16) - 16) * 0.50,
                      decoration: boxDecorationRoundedWithShadow(8),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.height,
                              Image.asset(
                                items[index].image,
                                height: context.width() * 0.25,
                                fit: BoxFit.cover,
                              ).center(),
                              8.height,
                              Text(
                                items[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: primaryTextStyle(),
                              ),
                              4.height,
                              Text(
                                '\$${items[index].price.toString()}',
                                style: boldTextStyle(),
                              ),
                              4.height,
                            ],
                          ).paddingOnly(left: 16, right: 16),
                          Positioned(
                            right: 2,
                            top: 0,
                            child: IconButton(
                              icon: Icon(Icons.favorite),
                              color: Colors.red.withOpacity(0.5),
                              onPressed: () {
                                setState(() {
                                  items.remove(items[index]);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      FDFoodDetailsScreen(data: items[index]).launch(context);
                    });
                  }),
                ),
              ),
            )
          : Center(
              child: Container(
              child: Text('No Favourite items', style: boldTextStyle()),
            )),
    );
  }
}
