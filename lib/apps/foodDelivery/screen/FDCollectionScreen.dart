import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDCollectionScreen extends StatefulWidget {
  static String tag = '/FDCollectionScreen';

  @override
  FDCollectionScreenState createState() => FDCollectionScreenState();
}

class FDCollectionScreenState extends State<FDCollectionScreen> {
  List<FDCollectionsItemModel> collectionList = fdGetCollectionsItems();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(elevation: 0, context: context, title: 'Collection'),
      body: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: boxDecorationWithShadow(),
              child: TabBar(
                tabs: [
                  Tab(child: Text('Popular')),
                  Tab(child: Text('Hot deal')),
                  Tab(child: Text('Feature')),
                ],
                indicator: BoxDecoration(
                  color: FDSelectedTextColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                labelColor: FDSelectedTextColor,
                unselectedLabelColor: grey,
              ),
            ),
            TabBarView(
              children: [
                ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return Image.asset(
                      collectionList[index].image,
                      width: context.width() * 0.8,
                      fit: BoxFit.fill,
                    ).cornerRadiusWithClipRRect(8).paddingOnly(right: 16).onTap(() {
                      toast('${collectionList[index].name} Collection');
                    });
                  },
                  itemCount: collectionList.length,
                  scrollDirection: Axis.horizontal,
                ),
                Center(child: Text('Hot deal')),
                Center(child: Text('Feature')),
              ],
            ).expand(),
          ],
        ),
      ),
    );
  }
}
