import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFoodDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDPopularScreen extends StatefulWidget {
  static String tag = '/FDPopularScreen';
  final bool isFromHome;

  FDPopularScreen({this.isFromHome = false});

  @override
  FDPopularScreenState createState() => FDPopularScreenState();
}

class FDPopularScreenState extends State<FDPopularScreen> {
  List<FDPopularItemModel> popularList = fdGetPopularItems();

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
      appBar: fdAppBarWidget(title: 'Popular', elevation: 8, context: context),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(popularList.length, (index) {
            FDPopularItemModel mData = popularList[index];
            return Container(
              decoration: boxDecorationRoundedWithShadow(8),
              width: (context.width() - (3 * 16)) * 0.5,
              child: Column(
                children: [
                  8.height,
                  Image.asset(mData.image, width: context.width() * 0.25, fit: BoxFit.cover),
                  4.height,
                  Text(mData.name, style: primaryTextStyle()),
                  8.height,
                ],
              ),
            ).onTap(() {
              FDFoodDetailsScreen(data: mData).launch(context);
            });
          }),
        ).paddingAll(16),
      ),
    );
  }
}
