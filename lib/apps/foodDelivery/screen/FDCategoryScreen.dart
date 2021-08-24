import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCategoryDetailScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDCategoryScreen extends StatefulWidget {
  static String tag = '/FDCategoryScreen';
  final bool isCategoryFromHome;

  FDCategoryScreen({this.isCategoryFromHome = false});

  @override
  FDCategoryScreenState createState() => FDCategoryScreenState();
}

class FDCategoryScreenState extends State<FDCategoryScreen> {
  List<FDCategoriesItemModel> categoriesItems = fdGetCategoriesItems();

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
    if (widget.isCategoryFromHome) {
      setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(context: context, title: 'Categories'),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(categoriesItems.length, (index) {
            return Container(
              width: (context.width() - (4 * 16)) * 0.33,
              child: Column(
                children: [
                  Container(
                    child: Image.asset(categoriesItems[index].image).paddingAll(16),
                    decoration: boxDecorationRoundedWithShadow(8),
                  ),
                  8.height,
                  Text(
                    categoriesItems[index].name,
                    style: primaryTextStyle(size: 14),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ).onTap(() {
              FDCategoryDetailScreen(categoryName: categoriesItems[index].name).launch(context);
            });
          }),
        ).paddingAll(16),
      ),
    );
  }
}
