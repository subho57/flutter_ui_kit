import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDAddNewAddressScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDAddressScreen extends StatefulWidget {
  static String tag = '/FDAddressScreen';
  final bool isFromAccount;

  FDAddressScreen({this.isFromAccount = false});

  @override
  FDAddressScreenState createState() => FDAddressScreenState();
}

class FDAddressScreenState extends State<FDAddressScreen> {
  List<FDAddressModel> addressList = fdGetAddress();

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
    if (widget.isFromAccount) {
      setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(title: 'My Address', context: context),
      body: ListView.builder(
        itemCount: addressList.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            decoration: boxDecorationRoundedWithShadow(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: boxDecorationRoundedWithShadow(8),
                  child: Icon(addressList[index].addressName == 'Company' ? Icons.home_work_rounded : Icons.home).paddingAll(8),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressList[index].addressName, style: boldTextStyle()),
                    Text(addressList[index].contactNo, style: secondaryTextStyle()),
                    Text(
                      addressList[index].address,
                      style: secondaryTextStyle(),
                      maxLines: 2,
                    ),
                    8.height,
                    Text(addressList[index].name, style: boldTextStyle()),
                  ],
                ),
              ],
            ),
          ).paddingOnly(bottom: 16);
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: AppButton(
          elevation: 0,
          width: context.width(),
          color: FDSelectedTextColor.withOpacity(0.2),
          textStyle: boldTextStyle(color: FDSelectedTextColor),
          text: 'Add New Address',
          onTap: () {
            FDAddNewAddressScreen().launch(context);
          },
        ),
      ),
    );
  }
}
