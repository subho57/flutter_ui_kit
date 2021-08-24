import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDAddressScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyCardScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyVoucherScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSettingScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDAccountScreen extends StatefulWidget {
  static String tag = '/FDAccountScreen';

  @override
  FDAccountScreenState createState() => FDAccountScreenState();
}

class FDAccountScreenState extends State<FDAccountScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget accountDetailWidget(Widget widget, String name) {
    return Container(
      decoration: boxDecorationRoundedWithShadow(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: widget.paddingAll(8),
            decoration: boxDecorationRoundedWithShadow(8),
          ),
          Text(name, style: boldTextStyle()),
        ],
      ).paddingOnly(left: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Stack(
                  children: [
                    Container(height: 150, color: FDPrimaryColor),
                    fdCreateRichText('My ', 'Account', white).paddingOnly(top: 16, left: 16, right: 16),
                    Positioned(
                      left: 16,
                      right: 16,
                      top: 90,
                      child: Container(
                        decoration: boxDecorationRoundedWithShadow(8),
                        child: ListTile(
                          title: Text('Robin Scherbatsky', style: boldTextStyle()).paddingBottom(4),
                          subtitle: Text('+919656763454'),
                          leading: CircleAvatar(radius: 30, backgroundImage: AssetImage(FDHomeImage1)),
                        ).paddingAll(16),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                padding: EdgeInsets.all(16),
                children: [
                  accountDetailWidget(ImageIcon(AssetImage(FDVoucherIcon)), 'My Voucher').onTap(() {
                    FDMyVoucherScreen().launch(context);
                  }),
                  accountDetailWidget(Icon(Icons.payments), 'Payment').onTap(() {
                    FDMyCardScreen().launch(context);
                  }),
                  accountDetailWidget(Icon(Icons.location_on), 'Address').onTap(() {
                    FDAddressScreen(isFromAccount: true).launch(context);
                  }),
                  accountDetailWidget(Icon(Icons.settings), 'Settings').onTap(() {
                    FDSettingScreen().launch(context);
                  }),
                ],
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
