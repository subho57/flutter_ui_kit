import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDCategoryListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDMarketPopularListComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCategoryScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFavouriteStoreScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDPopularScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSearchScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMarketScreen extends StatefulWidget {
  static String tag = '/FDMarketScreen';

  @override
  FDMarketScreenState createState() => FDMarketScreenState();
}

class FDMarketScreenState extends State<FDMarketScreen> {
  TextEditingController searchController = TextEditingController();

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
      appBar: AppBar(
        elevation: 0,
        title: fdCreateRichText('Mar', 'ket', FDPrimaryColor),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.dashboard_rounded, color: FDPrimaryColor),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: boxDecorationWithShadow(),
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      4.width,
                      Text('204, Shivam Apartment, MI 43423', style: secondaryTextStyle(color: black)),
                    ],
                  ),
                  4.height,
                  AppTextField(
                    controller: searchController,
                    textFieldType: TextFieldType.OTHER,
                    textStyle: secondaryTextStyle(),
                    onTap: () {
                      FDSearchScreen().launch(context);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: grey.withOpacity(0.2),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Type Something...',
                      hintStyle: secondaryTextStyle(),
                      prefixIcon: Icon(Icons.search, color: grey),
                    ),
                  ).cornerRadiusWithClipRRect(10),
                  16.height,
                ],
              ),
            ),
            16.height,
            fdTitleWidget(
              title1: 'Popular',
              title2: 'See all',
              onTap: () {
                FDPopularScreen().launch(context);
              },
            ),
            FDMarketPopularListComponent(),
            8.height,
            fdTitleWidget(
              title1: 'Categories',
              title2: 'See all',
              onTap: () {
                FDCategoryScreen().launch(context);
              },
            ),
            FDCategoryListComponent(),
            8.height,
            fdTitleWidget(
              title1: 'Discount',
              title2: 'See all',
              onTap: () {
                toast('Discount');
              },
            ),
            Image.asset(FDDiscountImage, fit: BoxFit.fill).cornerRadiusWithClipRRect(12).paddingAll(16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          FDMarketIcon,
          width: 20,
          height: 20,
          color: white,
        ),
        backgroundColor: FDSecondaryColor,
        onPressed: () {
          FDFavouriteStoreScreen().launch(context);
        },
      ),
    );
  }
}
