import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCategoryDetailScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDCategoryListComponent extends StatefulWidget {
  static String tag = '/FDCategoryListComponent';

  final bool isHome;

  FDCategoryListComponent({this.isHome = false});

  @override
  FDCategoryListComponentState createState() => FDCategoryListComponentState();
}

class FDCategoryListComponentState extends State<FDCategoryListComponent> {
  List<FDCategoriesItemModel> categoryItems = fdGetCategoriesItems();

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
    /* return GridView.builder(
      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
      physics: ScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.6,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemCount: categoryItems.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              Container(
                child: Image.asset(categoryItems[index].image).paddingAll(16),
                decoration: boxDecorationRoundedWithShadow(8),
              ),
              16.height,
              Text(
                categoryItems[index].name,
                style: primaryTextStyle(size: 14),
                maxLines: 1,
                textAlign: TextAlign.center,
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
        children: List.generate(8, (index) {
          return Container(
            width: (context.width() - (5 * 16)) * 0.25,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Image.asset(categoryItems[index].image),
                  height: (context.width() - (5 * 16)) * 0.25,
                  decoration: boxDecorationRoundedWithShadow(8),
                ),
                16.height,
                Text(
                  categoryItems[index].name,
                  style: primaryTextStyle(size: 14),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ).onTap(() {
            FDCategoryDetailScreen(
              categoryName: categoryItems[index].name,
              isFromHomePage: widget.isHome,
            ).launch(context);
          });
        }),
      ),
    );
  }
}
