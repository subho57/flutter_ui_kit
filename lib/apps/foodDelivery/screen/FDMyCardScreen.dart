import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDAddNewCardScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMyCardScreen extends StatefulWidget {
  static String tag = '/FDMyCardScreen';

  @override
  FDMyCardScreenState createState() => FDMyCardScreenState();
}

class FDMyCardScreenState extends State<FDMyCardScreen> {
  List<FDPaymentCardModel> cardDetails = fdGetPaymentDetails();

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
      appBar: fdAppBarWidget(
        title: 'My Card',
        context: context,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: cardDetails.length,
        itemBuilder: (context, index) {
          FDPaymentCardModel mData = cardDetails[index];
          return Container(
            padding: EdgeInsets.all(16),
            height: context.width() * 0.5,
            decoration: BoxDecoration(color: FDRedColor, borderRadius: BorderRadius.circular(16)),
            child: Stack(
              children: [
                Positioned(
                  child: Image.asset('images/foodDelivery/fd_mastercard.png'),
                  height: 40,
                  right: 8,
                  top: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(
                        mData.cardNumber,
                        style: boldTextStyle(size: 16),
                      ),
                    ),
                    30.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Card Holder', style: primaryTextStyle(size: 16)),
                        Text('Expiry', style: primaryTextStyle(size: 16)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          mData.holderName,
                          style: boldTextStyle(size: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ).expand(),
                        Text('${mData.expDate}', style: boldTextStyle(size: 14)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ).paddingBottom(16);
        },
      ),
      bottomNavigationBar: AppButton(
        elevation: 0,
        width: context.width(),
        color: FDSelectedTextColor.withOpacity(0.2),
        child: Text('Add new card', style: boldTextStyle(color: FDSelectedTextColor)),
        onTap: () {
          FDAddNewCardScreen().launch(context);
        },
      ).paddingAll(16),
    );
  }
}
