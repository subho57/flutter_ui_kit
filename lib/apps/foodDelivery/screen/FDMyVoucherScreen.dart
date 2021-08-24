import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDMultipleRoundedCurveClipper.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDTicketPassClipper.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMyVoucherScreen extends StatefulWidget {
  static String tag = '/FDMyVoucherScreen';

  @override
  FDMyVoucherScreenState createState() => FDMyVoucherScreenState();
}

class FDMyVoucherScreenState extends State<FDMyVoucherScreen> {
  List<FDVoucherItemModel> voucherItems = fdGetVoucherItems();

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
      backgroundColor: Colors.grey[100],
      appBar: fdAppBarWidget(context: context, title: 'My Voucher'),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: List.generate(voucherItems.length, (index) {
            return ClipPath(
              clipper: MultipleRoundedCurveClipper(),
              child: Container(
                width: (context.width() - (3 * 16)) * 0.5,
                color: white,
                child: Column(
                  children: [
                    Image.asset(
                      voucherItems[index].image,
                      height: 120,
                      width: context.width(),
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRect(8),
                    16.height,
                    ClipPath(
                      clipper: TicketPassClipper(holeRadius: 8, position: 20),
                      child: Container(
                        child: Text(voucherItems[index].voucherCode, style: boldTextStyle(color: voucherItems[index].color)),
                        padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                        color: voucherItems[index].color.withOpacity(0.2),
                      ),
                    ),
                    8.height,
                    Text(
                      'Expired Date: ${voucherItems[index].date}',
                      style: secondaryTextStyle(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    8.height,
                  ],
                ),
              ),
            ).onTap(() {
              toast(voucherItems[index].voucherCode);
            });
          }),
        ).paddingAll(16),
      ),
    );
  }
}
