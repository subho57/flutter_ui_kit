import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDCategoryListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDCollectionListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDPopularListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCategoryScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCollectionScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDPopularScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSearchScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDHomeScreen extends StatefulWidget {
  static String tag = '/FDHomeScreen';

  @override
  FDHomeScreenState createState() => FDHomeScreenState();
}

class FDHomeScreenState extends State<FDHomeScreen> {
  TextEditingController searchController = TextEditingController();

  int pageIndex = 0;

  PageController pageControllerHome;

  List<FDHomeItemModel> homeItems = fdGetHomeItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    pageControllerHome = PageController(initialPage: pageIndex, viewportFraction: 0.9);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 380,
                child: Stack(
                  children: [
                    Container(height: 250, color: FDPrimaryColor),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            fdCreateRichText('FOOD', 'DOOR', white),
                            Icon(Icons.dashboard, color: white),
                          ],
                        ),
                        8.height,
                        Row(
                          children: [
                            Icon(Icons.location_on, color: white, size: 20),
                            8.width,
                            Text('204, Shivam Apartment, MI 43423', style: secondaryTextStyle(color: white)),
                          ],
                        ),
                        8.height,
                        AppTextField(
                          controller: searchController,
                          textFieldType: TextFieldType.OTHER,
                          cursorColor: white,
                          textStyle: secondaryTextStyle(color: white),
                          onTap: () {
                            FDSearchScreen(isFromHome: true).launch(context);
                          },
                          decoration: InputDecoration(
                            fillColor: FDSelectedTextColor.withOpacity(0.3),
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            filled: true,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Type Something...',
                            hintStyle: secondaryTextStyle(color: white.withOpacity(0.3)),
                            prefixIcon: Icon(Icons.search, color: white.withOpacity(0.3)),
                          ),
                        ).cornerRadiusWithClipRRect(10),
                      ],
                    ).paddingOnly(left: 16, right: 16, top: 16),
                    Positioned(
                      top: 170,
                      left: 0,
                      right: 0,
                      height: 200,
                      child: PageView(
                        pageSnapping: true,
                        allowImplicitScrolling: true,
                        controller: pageControllerHome,
                        onPageChanged: (value) {
                          setState(() {
                            pageIndex = value;
                          });
                        },
                        children: List.generate(homeItems.length, (index) {
                          return Container(
                            child: Image.asset(homeItems[index].image, fit: BoxFit.cover),
                          ).cornerRadiusWithClipRRect(8).paddingLeft(index > 0 ? 16 : 0).onTap(() {
                            toast(homeItems[index].name);
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              DotIndicator(
                pageController: pageControllerHome,
                pages: homeItems,
                indicatorColor: FDPrimaryColor,
              ),
              8.height,
              fdTitleWidget(
                title1: 'Popular',
                title2: 'See All',
                onTap: () {
                  FDPopularScreen(isFromHome: true).launch(context);
                },
              ),
              FDPopularListComponent(),
              8.height,
              fdTitleWidget(title1: 'Voucher', title2: 'See All'),
              Image.asset(
                FDHomeImage1,
                width: context.width(),
                fit: BoxFit.fill,
              ).paddingAll(16).onTap(() {
                toast('Voucher');
              }),
              8.height,
              fdTitleWidget(
                title1: 'Collections',
                title2: 'See All',
                onTap: () {
                  FDCollectionScreen().launch(context);
                },
              ),
              FDCollectionListComponent(),
              8.height,
              fdTitleWidget(
                title1: 'Categories',
                title2: 'See All',
                onTap: () {
                  FDCategoryScreen(isCategoryFromHome: true).launch(context);
                },
              ),
              FDCategoryListComponent(isHome: true),
            ],
          ),
        ),
      ),
    );
  }
}
