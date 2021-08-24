import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSPromoDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class GSPromoScreen extends StatefulWidget {
  static String tag = '/GSPromoScreen';

  @override
  GSPromoScreenState createState() => GSPromoScreenState();
}

class GSPromoScreenState extends State<GSPromoScreen> {
  List<GSPromoModel> promoList = getPromoList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gsStatusBarWithTitle(context, "Promo Available"),
      body: ListView.builder(
        itemCount: promoList.length,
        itemBuilder: (context, index) {
          GSPromoModel mData = promoList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(mData.promoImage, fit: BoxFit.cover, height: 240, width: context.width()),
              8.height,
              Text(mData.offer, style: boldTextStyle(size: 18)),
              Text(mData.offerDate, style: secondaryTextStyle())
            ],
          ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8).onTap(() {
            GSPromoDetailsScreen(promoList: mData).launch(context);
          });
        },
      ).paddingOnly(top: 8, bottom: 8),
    );
  }
}
