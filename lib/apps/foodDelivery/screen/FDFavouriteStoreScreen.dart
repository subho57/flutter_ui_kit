import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDFavouriteStoreNextScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFavouriteStoreScreen extends StatefulWidget {
  static String tag = '/FDFavouriteStoreScreen';

  @override
  FDFavouriteStoreScreenState createState() => FDFavouriteStoreScreenState();
}

class FDFavouriteStoreScreenState extends State<FDFavouriteStoreScreen> {
  List<FDFavouriteStoreItemModel> favouriteStoreItems = fdGetFavouriteStoreItems();

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
    return Scaffold(
      appBar: fdAppBarWidget(title: 'Favourite Store', context: context),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: favouriteStoreItems.length,
        itemBuilder: (context, index) {
          FDFavouriteStoreItemModel mData = favouriteStoreItems[index];
          return Container(
            padding: EdgeInsets.only(bottom: 16),
            child: Stack(
              children: [
                Container(
                  decoration: boxDecorationRoundedWithShadow(8),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          color: FDRedColor,
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: Text('${mData.discount.toString()}%', style: secondaryTextStyle(color: white)),
                        ),
                      ),
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(mData.name, style: boldTextStyle()),
                          Text('${mData.branches} branches', style: secondaryTextStyle()),
                        ],
                      ),
                      8.height,
                      Row(
                        children: [
                          Icon(Icons.star, color: FDSecondaryColor),
                          Text(mData.rating.toString(), style: secondaryTextStyle()),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: boxDecorationWithShadow(boxShape: BoxShape.circle),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(left: 30),
                  child: CircleAvatar(
                    backgroundColor: white,
                    backgroundImage: AssetImage(mData.image),
                    radius: 30,
                  ),
                ),
              ],
            ),
          ).onTap(() {
            FDFavouriteStoreNextScreen(image: mData.image, name: mData.name).launch(context);
          });
        },
      ),
    );
  }
}
