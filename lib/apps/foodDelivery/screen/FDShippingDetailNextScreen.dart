import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDBillScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDCallScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFoodDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMessageScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

class FDShippingDetailNextScreen extends StatefulWidget {
  static String tag = '/FDShippingDetailNextScreen';

  @override
  FDShippingDetailNextScreenState createState() => FDShippingDetailNextScreenState();
}

class FDShippingDetailNextScreenState extends State<FDShippingDetailNextScreen> {
  List<FDPopularItemModel> items = fdGetPopularItems();

  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              FDMapImage,
              fit: BoxFit.fill,
              height: context.height() * 0.70,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, bottom: 16),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shipping details', style: boldTextStyle()).center(),
                  16.height,
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(FDHomeImage1),
                    ),
                    title: Text('Ted Mosby', style: boldTextStyle()),
                    subtitle: Row(
                      children: [
                        Icon(Icons.star, color: FDSecondaryColor, size: 20),
                        2.width,
                        Text('4.7', style: primaryTextStyle(size: 14)),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.call, color: black).onTap(() {
                          FDCallScreen().launch(context);
                        }),
                        16.width,
                        Icon(Icons.message, color: black).onTap(() {
                          FDMessageScreen().launch(context);
                        }),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        FDPopularItemModel mData = items[index];

                        return Container(
                          width: 170,
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationRoundedWithShadow(8),
                          child: Row(
                            children: [
                              Image.asset(mData.image).expand(),
                              8.width,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(mData.name, style: primaryTextStyle(size: 14), softWrap: true, overflow: TextOverflow.ellipsis, maxLines: 1),
                                  Row(
                                    children: [
                                      Text('x', style: secondaryTextStyle(size: 10)),
                                      Text('${mData.quantity}', style: secondaryTextStyle(size: 12)),
                                    ],
                                  ),
                                ],
                              ).expand(),
                            ],
                          ),
                        ).paddingRight(16).onTap(() {
                          FDFoodDetailsScreen(data: mData, isFoodFromShipping: true).launch(context);
                        });
                      },
                    ),
                  ),
                  AppTextField(
                    controller: notesController,
                    textFieldType: TextFieldType.OTHER,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: grey.withOpacity(0.1),
                      hintText: 'Any pickup notes?',
                      hintStyle: secondaryTextStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                    ),
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  ListTile(
                    leading: Container(
                      decoration: boxDecorationRoundedWithShadow(8),
                      child: Icon(Icons.headset, color: black),
                      padding: EdgeInsets.all(8),
                    ),
                    title: Text('Need Support?', style: primaryTextStyle(size: 14)),
                    subtitle: Text('Chat with us if you need support', style: secondaryTextStyle(size: 12)),
                    trailing: Text('Chat', style: primaryTextStyle(size: 14, color: FDSelectedTextColor)).onTap(() {
                      FDMessageScreen().launch(context);
                    }),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: boxDecorationRoundedWithShadow(8),
                      child: Icon(Icons.share, color: black),
                      padding: EdgeInsets.all(8),
                    ),
                    title: Text('Share details', style: primaryTextStyle(size: 14)),
                    subtitle: Text('Share details with friend & family', style: secondaryTextStyle(size: 12)),
                    trailing: Text('Share', style: primaryTextStyle(size: 14, color: FDSelectedTextColor)).onTap(() {
                      Share.share('check out my website https://www.google.com');
                    }),
                  ),
                  16.height,
                  fdAppButton(FDPrimaryColor, () {
                    FDBillScreen().launch(context);
                  }, context, 'Received Order')
                      .paddingSymmetric(horizontal: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
