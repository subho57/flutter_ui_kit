import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDSettingScreen extends StatefulWidget {
  static String tag = '/FDSettingScreen';

  @override
  FDSettingScreenState createState() => FDSettingScreenState();
}

class FDSettingScreenState extends State<FDSettingScreen> {
  bool switchValue = false;

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
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(title: 'Settings', context: context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: ListTile(
                leading: Container(
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Icon(Icons.info).paddingAll(8),
                ),
                title: Text('Information & Contact', style: boldTextStyle()),
                subtitle: Text('Profile information and Contact'),
              ).paddingOnly(top: 8, bottom: 8),
            ).onTap(() {
              toast('Information & Contact');
            }),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: ListTile(
                leading: Container(
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Icon(Icons.lock).paddingAll(8),
                ),
                title: Text('Password', style: boldTextStyle()),
                subtitle: Text('Profile information and Contact'),
              ).paddingOnly(top: 8, bottom: 8),
            ).onTap(() {
              toast('Password');
            }),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: ListTile(
                leading: Container(decoration: boxDecorationRoundedWithShadow(8), child: Icon(Icons.language).paddingAll(8)),
                title: Text('Language', style: boldTextStyle()),
                trailing: Text('English', style: boldTextStyle(color: FDSelectedTextColor)).onTap(() {
                  toast('English');
                }),
              ).paddingOnly(top: 8, bottom: 8),
            ).onTap(() {
              toast('Language');
            }),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: SwitchListTile(
                value: switchValue,
                onChanged: (value) {
                  setState(() {
                    switchValue = value;
                    toast(switchValue ? 'ON' : 'OFF');
                  });
                },
                title: Text('Notifications', style: boldTextStyle()),
                secondary: Container(child: Icon(Icons.notifications).paddingAll(8), decoration: boxDecorationRoundedWithShadow(8)),
                activeColor: white,
                activeTrackColor: FDSelectedTextColor,
              ).paddingOnly(top: 8, bottom: 8),
            ),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(8),
              child: Column(
                children: [
                  Image.asset(
                    FDHomeImage1,
                    fit: BoxFit.cover,
                    //height: 120,
                    width: context.width(),
                  ).cornerRadiusWithClipRRect(8),
                  8.height,
                  Text('Rate our App', style: boldTextStyle()),
                  8.height,
                  RatingBar.builder(
                    itemCount: 5,
                    initialRating: 0,
                    minRating: 0,
                    maxRating: 5,
                    itemSize: 30,
                    itemBuilder: (context, index) {
                      return Icon(Icons.star, color: FDSelectedTextColor);
                    },
                    onRatingUpdate: (value) {},
                  ),
                ],
              ).paddingOnly(bottom: 16),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
