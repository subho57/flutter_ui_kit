import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGPaymentHistoryScreen extends StatelessWidget {
  final List<Map<String, Object>> historyList = [
    {"cardName": "Visa Debit", "date": "28 SEP 2019", "amount": "\$ 20", "image": EGIconVisa},
    {"cardName": "Master Card", "date": "12 OCT 2019", "amount": "\$ 26", "image": EGIconMasterCard},
    {"cardName": "Visa Debit", "date": "27 FEB 2020", "amount": "\$ 67", "image": EGIconVisa},
    {"cardName": "Visa Debit", "date": "15 MAY 2020", "amount": "\$ 20", "image": EGIconVisa},
    {"cardName": "Master Card", "date": "21 SEP 2018", "amount": "\$ 50", "image": EGIconMasterCard}
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Payment History", center: true, elevation: 0, color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildSearchBar(hintText: "Card name or card number, date..."),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History", style: boldTextStyle(size: 20)),
                  Text("Filter", style: boldTextStyle(size: 16, color: egPrimaryColor1)),
                ],
              ),
              16.height,
              ListView.builder(
                itemCount: historyList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: appStore.cardColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(backgroundColor: EGPrimaryColor3, child: commonCacheImageWidget(historyList[index]["image"], 30)),
                        24.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(historyList[index]["date"], style: secondaryTextStyle(color: Colors.grey[350])),
                            4.height,
                            Text(historyList[index]["cardName"], style: primaryTextStyle()),
                          ],
                        ).expand(),
                        Text(historyList[index]["amount"], style: boldTextStyle(size: 16))
                      ],
                    ).paddingSymmetric(horizontal: 16, vertical: 12),
                  ).paddingBottom(8);
                },
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
