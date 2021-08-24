import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDCollectionListComponent extends StatefulWidget {
  static String tag = '/FDCollectionListComponent';

  @override
  FDCollectionListComponentState createState() => FDCollectionListComponentState();
}

class FDCollectionListComponentState extends State<FDCollectionListComponent> {
  List<FDCollectionsItemModel> collectionItems = fdGetCollectionsItems();

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
      height: 220,
      child: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: collectionItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 2),
            width: 150,
            decoration: boxDecorationRoundedWithShadow(8),
            child: Column(
              children: [
                Image.asset(
                  collectionItems[index].image,
                  height: 150,
                  width: context.width(),
                  fit: BoxFit.fill,
                ),
                8.height,
                Text(collectionItems[index].name, style: primaryTextStyle(), maxLines: 1, textAlign: TextAlign.center),
              ],
            ),
          ).onTap(() {
            toast('${collectionItems[index].name} Collection');
          });
        },
        separatorBuilder: (context, index) {
          return 16.width;
        },
      ),
    );
  }
}
