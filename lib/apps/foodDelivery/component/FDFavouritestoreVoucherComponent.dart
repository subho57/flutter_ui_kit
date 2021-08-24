import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:nb_utils/nb_utils.dart';

class FDFavouriteStoreVoucherComponent extends StatefulWidget {
  static String tag = '/FDFavouriteStoreVoucherComponent';

  @override
  FDFavouriteStoreVoucherComponentState createState() => FDFavouriteStoreVoucherComponentState();
}

class FDFavouriteStoreVoucherComponentState extends State<FDFavouriteStoreVoucherComponent> {
  List<FDFavouriteStoreVoucherModel> voucherItems = fdGetFavouriteStoreVoucherItems();

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
    return ListView.builder(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      itemCount: voucherItems.length,
      itemBuilder: (context, index) {
        FDFavouriteStoreVoucherModel mData = voucherItems[index];

        return Container(
          padding: EdgeInsets.all(16),
          decoration: boxDecorationRoundedWithShadow(8),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: ImageIcon(AssetImage(mData.image), color: mData.color),
                color: mData.color.withOpacity(0.3),
              ).expand(),
              16.width,
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mData.description,
                      style: boldTextStyle(),
                    ),
                    8.height,
                    Text('Expired date: ${mData.date}', style: secondaryTextStyle(), maxLines: 2),
                  ],
                ),
              ),
            ],
          ),
        ).paddingBottom(16);
      },
    );
  }
}
