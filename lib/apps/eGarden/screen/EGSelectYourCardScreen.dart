import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGAddCardScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGSelectYourCardScreen extends StatefulWidget {
  static String tag = '/EGSelectYourCardScreen';

  final double totalPrice;

  const EGSelectYourCardScreen({Key key, this.totalPrice}) : super(key: key);

  @override
  EGSelectYourCardScreenState createState() => EGSelectYourCardScreenState();
}

class EGSelectYourCardScreenState extends State<EGSelectYourCardScreen> {
  bool isVisa = false;
  bool isMaster = true;

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
        appBar: appBarWidget("Select your card", center: true, elevation: 0, color: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor),
        persistentFooterButtons: [
          roundedButtonWithFillColor(context: context, btnText: "Next").onTap(() {
            buildCommonDialog(context, "Your product has been successfully booked! ");
          }),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Summary", style: boldTextStyle(size: 18)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment", style: boldTextStyle(size: 18)),
                  Row(
                    children: [
                      Icon(Icons.add, color: egPrimaryColor1),
                      8.width,
                      Text("New", style: boldTextStyle(size: 16, color: egPrimaryColor1)),
                    ],
                  ).onTap(() {
                    EGAddCardScreen().launch(context);
                  }),
                ],
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: EGPrimaryColor3,
                    child: commonCacheImageWidget(EGIconVisa, 30),
                  ),
                  24.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Visa / Visa Debit", style: primaryTextStyle(color: isVisa ? black : grey)),
                      2.height,
                      Text("xxxx xxxx xxxx 2444", style: secondaryTextStyle(color: Colors.grey)),
                      2.height,
                      Text("Expiry : 09/20", style: secondaryTextStyle(color: Colors.grey[350])),
                    ],
                  ).expand(),
                  Container(
                    width: 25,
                    height: 25,
                    child: isVisa ? Icon(Icons.check, color: white, size: 20) : null,
                    decoration: isVisa
                        ? BoxDecoration(shape: BoxShape.circle, color: egPrimaryColor1)
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                  )
                ],
              ).onTap(() {
                isVisa = !isVisa;
                if (isVisa) {
                  isMaster = false;
                }
                setState(() {});
              }),
              8.height,
              Divider(thickness: 1),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: EGPrimaryColor3,
                    child: commonCacheImageWidget(EGIconMasterCard, 30),
                  ),
                  24.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Master Card", style: primaryTextStyle(color: isMaster ? black : grey)),
                      2.height,
                      Text("xxxx xxxx xxxx 8080", style: secondaryTextStyle(color: Colors.grey)),
                      2.height,
                      Text("Expiry : 09/20", style: secondaryTextStyle(color: Colors.grey[350])),
                    ],
                  ).expand(),
                  Container(
                    width: 25,
                    height: 25,
                    child: isMaster ? Icon(Icons.check, color: white, size: 20) : null,
                    decoration: isMaster
                        ? BoxDecoration(shape: BoxShape.circle, color: egPrimaryColor1)
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey),
                          ),
                  )
                ],
              ).onTap(() {
                isMaster = !isMaster;
                if (isMaster) {
                  isVisa = false;
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
