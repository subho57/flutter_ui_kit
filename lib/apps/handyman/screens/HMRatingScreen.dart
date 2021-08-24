import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMImages.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class HMRatingScreen extends StatefulWidget {
  static String tag = '/HMRatingScreen';

  @override
  HMRatingScreenState createState() => HMRatingScreenState();
}

class HMRatingScreenState extends State<HMRatingScreen> {
  int ratingNum = 0;

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          elevation: 0,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          title: Text("Rating", style: boldTextStyle(size: 22)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: context.width(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.width(),
                  decoration: BoxDecoration(color: appStore.cardColor),
                  child: Column(
                    children: [
                      createRichText(
                        list: [
                          TextSpan(text: "Hi,", style: boldTextStyle(size: 22)),
                          TextSpan(text: "Selena", style: boldTextStyle(size: 22, color: hmColorPrimary)),
                        ],
                      ),
                      8.height,
                      Text("How do you feel this services?", style: boldTextStyle(size: 16)),
                      64.height,
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: commonCacheImageWidget(hm_person1, 80, width: 80, fit: BoxFit.cover),
                            ).cornerRadiusWithClipRRect(HMCornerRadius),
                            8.height,
                            Text("Dog Walking", style: boldTextStyle(size: 18))
                          ],
                        ),
                      ),
                      16.height,
                      RatingBar.builder(
                          initialRating: 0,
                          minRating: 1,
                          itemCount: 5,
                          glow: false,
                          unratedColor: gray.withOpacity(0.4),
                          maxRating: 5,
                          itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            ratingNum = rating.toInt();
                            setState(() {});
                          }),
                      16.height,
                      Text("Awesome!!!!\nYou rated $ratingNum stars for it.", textAlign: TextAlign.center, style: boldTextStyle(size: 18)),
                      16.height,
                      Container(
                        height: 80,
                        padding: EdgeInsets.all(8),
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: TextField(
                          style: secondaryTextStyle(),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Type something about this service...!",
                            hintStyle: secondaryTextStyle(),
                          ),
                        ),
                      ).center().paddingOnly(left: 16, right: 16)
                    ],
                  ).paddingAll(HMAppPadding),
                ).cornerRadiusWithClipRRect(HMCornerRadius),
                CommonButton("Complete").paddingTop(32).onTap(() {
                  finish(context);
                })
              ],
            ),
          ).paddingAll(HMAppPadding),
        ),
      ),
    );
  }
}
