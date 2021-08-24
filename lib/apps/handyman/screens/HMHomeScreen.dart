import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMAllCategoryDataScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HMHomeScreen extends StatefulWidget {
  static String tag = '/HMHomeScreen';

  @override
  HMHomeScreenState createState() => HMHomeScreenState();
}

class HMHomeScreenState extends State<HMHomeScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: appStore.cardColor),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.location_city_rounded, color: hmColorPrimary),
                                8.width,
                                Text("Los Angeles, California, US", style: boldTextStyle()),
                              ],
                            ),
                          ),
                          16.height,
                          Container(
                            decoration: BoxDecoration(color: hmColorPrimary),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                createRichText(
                                  list: [
                                    TextSpan(text: "Hey, ", style: boldTextStyle(size: 16, color: HMFontColor400)),
                                    TextSpan(text: "Selena", style: TextStyle(color: HMColorWhite)),
                                  ],
                                ).paddingLeft(16),
                                16.height,
                                Text("Can i help you something?", style: TextStyle(fontSize: HMFontSize, color: HMFontColor400)).paddingLeft(16),
                                16.height,
                                Container(
                                  decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                                  child: TextField(
                                    style: secondaryTextStyle(),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search, color: hmColorPrimary),
                                      border: InputBorder.none,
                                      hintText: "Searching...",
                                      hintStyle: secondaryTextStyle(),
                                    ),
                                  ),
                                ).cornerRadiusWithClipRRect(32).paddingOnly(left: 16, right: 16)
                              ],
                            ).paddingOnly(top: 16, bottom: 16),
                          ).cornerRadiusWithClipRRect(HMCornerRadius),
                          16.height,
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Categories", style: boldTextStyle(size: 22)),
                                    Text("View All", style: boldTextStyle(color: hmColorPrimary)).onTap(() {
                                      HMAllCategoryData().launch(context);
                                    })
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ).paddingAll(HMAppPadding),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: mainCategoryList.length,
                          itemBuilder: (context, index) {
                            MainCategory data = mainCategoryList[index];
                            return Container(
                              width: 100,
                              height: 80,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(data.imageData),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                                ),
                              ),
                              child: Text(
                                data.mainCat,
                                textAlign: TextAlign.center,
                                style: boldTextStyle(color: HMColorWhite),
                              ).paddingOnly(top: 8, left: 8),
                            ).cornerRadiusWithClipRRect(16).paddingOnly(left: 8, right: 8).onTap(() {
                              HMAllCategoryData().launch(context);
                            });
                          }),
                    ).paddingOnly(bottom: HMAppPadding),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommended for You", style: boldTextStyle(size: 18)),
                    Text("View All", style: boldTextStyle(color: hmColorPrimary)).onTap(() {
                      HMAllCategoryData().launch(context);
                    })
                  ],
                ),
              ).paddingAll(HMAppPadding),
              CommonCategoryContainer(recommendedList: recommendedList).onTap(() {
                HMAllCategoryData().launch(context);
              }),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Moving into a New Home", style: boldTextStyle(size: 18)),
                    Text("View All", style: boldTextStyle(color: hmColorPrimary)).onTap(() {
                      HMAllCategoryData(appBarTitle: "Moving into a New home").launch(context);
                    })
                  ],
                ),
              ).paddingAll(HMAppPadding),
              CommonSubCategoryContainer(categoryData: moveHomeList).onTap(() {
                HMAllCategoryData(appBarTitle: "Moving into a New home").launch(context);
              }),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Essential Home Services", style: boldTextStyle(size: 18)),
                    Text("View All", style: boldTextStyle(color: hmColorPrimary)).onTap(
                      () {
                        HMAllCategoryData(appBarTitle: "Essential Home Services").launch(context);
                      },
                    ),
                  ],
                ),
              ).paddingAll(HMAppPadding),
              CommonSubCategoryContainer(categoryData: essentialServiceList).onTap(
                () {
                  HMAllCategoryData(appBarTitle: "Essential Home Services").launch(context);
                },
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Outdoor Upkeep", style: boldTextStyle(size: 18)),
                    Text("View All", style: boldTextStyle(color: hmColorPrimary)).onTap(
                      () {
                        HMAllCategoryData(appBarTitle: "Outdoor Upkeep").launch(context);
                      },
                    ),
                  ],
                ),
              ).paddingAll(HMAppPadding),
              CommonSubCategoryContainer(categoryData: outdoorUpkeepList).onTap(
                () {
                  HMAllCategoryData(appBarTitle: "Outdoor Upkeep").launch(context);
                },
              ),
            ],
          ).paddingBottom(16),
        ),
      ),
    );
  }
}
