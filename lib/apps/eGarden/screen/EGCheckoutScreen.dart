import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSelectYourCardScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class EGCheckoutScreen extends StatefulWidget {
  static String tag = '/EGCheckoutScreen';

  final double totalPrice;

  const EGCheckoutScreen({Key key, this.totalPrice}) : super(key: key);

  @override
  EGCheckoutScreenState createState() => EGCheckoutScreenState();
}

class EGCheckoutScreenState extends State<EGCheckoutScreen> {
  bool isAddressCheck1 = true;
  bool isAddressCheck2 = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("", elevation: 0, color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor),
        persistentFooterButtons: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            width: context.width(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("Total :", style: secondaryTextStyle(size: 16)),
                    8.width,
                    Text("\$ ${widget.totalPrice + 1}", style: primaryTextStyle(size: 20)),
                  ],
                ),
                btnWithFillColor(btnText: "Place Order").onTap(() {
                  EGSelectYourCardScreen(totalPrice: widget.totalPrice).launch(context);
                }),
              ],
            ),
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Checkout", style: boldTextStyle(size: 32)),
              32.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment", style: boldTextStyle(size: 18)),
                  Text("Change", style: boldTextStyle(size: 16, color: egPrimaryColor1)),
                ],
              ),
              8.height,
              Text("09/20, (...)25482 - Visa / Visa Debit", style: secondaryTextStyle(color: Colors.grey[400])),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal", style: primaryTextStyle(size: 18, color: grey)),
                  Text("\$ ${widget.totalPrice}", style: primaryTextStyle(size: 18, color: grey)),
                ],
              ),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Shipping fee", style: primaryTextStyle(size: 18, color: grey)),
                  Text("\$ 1.0", style: primaryTextStyle(size: 18, color: grey)),
                ],
              ),
              4.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: primaryTextStyle(size: 20)),
                  Text("\$ ${widget.totalPrice + 1}", style: primaryTextStyle(size: 20)),
                ],
              ),
              32.height,
              Text("Shipping Address", style: boldTextStyle(size: 18)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "31 Bryngllas, Glewstone\nName : O'Donnell\nPhone:070 5235 2015",
                    style: secondaryTextStyle(),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: isAddressCheck1 ? Icon(Icons.check, color: white, size: 20) : null,
                    decoration: isAddressCheck1 ? BoxDecoration(shape: BoxShape.circle, color: egPrimaryColor1) : BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                  )
                ],
              ).onTap(() {
                isAddressCheck1 = !isAddressCheck1;
                if (isAddressCheck1) {
                  isAddressCheck2 = false;
                }
                setState(() {});
              }),
              8.height,
              Divider(thickness: 1),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "31 Bryngllas, Glewstone\nName : O'Donnell\nPhone:070 5235 2015",
                    style: primaryTextStyle(color: isAddressCheck2 ? black : grey),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: isAddressCheck2 ? Icon(Icons.check, color: white, size: 20) : null,
                    decoration: isAddressCheck2 ? BoxDecoration(shape: BoxShape.circle, color: egPrimaryColor1) : BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
                  )
                ],
              ).onTap(() {
                isAddressCheck2 = !isAddressCheck2;
                if (isAddressCheck2) {
                  isAddressCheck1 = false;
                }
                setState(() {});
              }),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
