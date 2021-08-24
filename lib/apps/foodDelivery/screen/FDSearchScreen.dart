import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDFilterComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCategoryDetailScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDBottomSheetCustom.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class FDSearchScreen extends StatefulWidget {
  static String tag = '/FDSearchScreen';

  bool isFromHome;

  FDSearchScreen({this.isFromHome = false});

  @override
  FDSearchScreenState createState() => FDSearchScreenState();
}

class FDSearchScreenState extends State<FDSearchScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> recentSearchList = ['Andy & Cindy\'s Dinner', 'Gado & Grill', 'Panda In Mongolian'];
  List<FDCategoriesItemModel> items = fdGetCategoriesItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    if (widget.isFromHome) {
      setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(
        title: 'Search',
        context: context,
        elevation: 0,
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage(FDFilterIcon)),
            onPressed: () {
              showModalBottomSheetCustom(
                context: context,
                builder: (context) {
                  return FDFilterComponent();
                },
                topOffset: 100,
              );
            },
            iconSize: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: searchController,
              textFieldType: TextFieldType.OTHER,
              textStyle: secondaryTextStyle(color: black),
              autoFocus: false,
              decoration: InputDecoration(
                fillColor: grey.withOpacity(0.1),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                filled: true,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: 'Type Something...',
                hintStyle: secondaryTextStyle(),
                prefixIcon: Icon(Icons.search, color: grey),
              ),
            ).cornerRadiusWithClipRRect(10).paddingOnly(left: 16, right: 16),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Search', style: boldTextStyle()),
                Text('Clear', style: boldTextStyle(color: FDRedColor)),
              ],
            ).paddingOnly(left: 16, right: 16),
            8.height,
            ListView.builder(
              shrinkWrap: true,
              itemCount: recentSearchList.length,
              itemBuilder: (context, index) {
                return Text(
                  recentSearchList[index],
                  style: secondaryTextStyle(color: black),
                ).paddingBottom(8);
              },
            ).paddingOnly(left: 16, right: 16),
            16.height,
            Text('Top brands', style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            Container(
              height: 170,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                scrollDirection: Axis.horizontal,
                itemCount: items.length - 1,
                itemBuilder: (context, index) {
                  return Container(
                    //width: 75,
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Container(
                          //width: context.width(),
                          height: 70,
                          decoration: boxDecorationRoundedWithShadow(8),
                          padding: EdgeInsets.all(8),
                          child: Image.asset(items[index].image, fit: BoxFit.fill),
                        ),
                        8.height,
                        Text(
                          items[index].name,
                          style: primaryTextStyle(size: 12),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ).center(),
                      ],
                    ),
                  ).onTap(() {
                    FDCategoryDetailScreen(categoryName: items[index].name).launch(context);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
