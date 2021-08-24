import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/component/FDFavouriteStoreProductComponent.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyCartScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSearchScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDCategoryDetailScreen extends StatefulWidget {
  static String tag = '/FDCategoryDetailScreen';

  final String categoryName;
  final bool isFromHomePage;

  FDCategoryDetailScreen({this.categoryName, this.isFromHomePage = false});

  @override
  FDCategoryDetailScreenState createState() => FDCategoryDetailScreenState();
}

class FDCategoryDetailScreenState extends State<FDCategoryDetailScreen> {
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
    if (widget.isFromHomePage) {
      setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(
        title: widget.categoryName,
        context: context,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              FDSearchScreen().launch(context);
            },
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: ImageIcon(AssetImage(FDMarketIcon)),
                onPressed: () {
                  FDMyCartScreen().launch(context);
                },
              ),
              Positioned(
                right: 6,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
                  child: Text('1'),
                ),
              )
            ],
          ).center().paddingOnly(right: 16),
        ],
      ),
      body: FDFavouriteStoreProductComponent(),
    );
  }
}
