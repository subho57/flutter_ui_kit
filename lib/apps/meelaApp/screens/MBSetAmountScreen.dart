import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBCreateBudgetScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBColors.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSetAmountScreen extends StatefulWidget {
  @override
  MBSetAmountScreenState createState() => MBSetAmountScreenState();
}

class MBSetAmountScreenState extends State<MBSetAmountScreen> {
  List<BudgetDetails> receiptsList = getReceiptsList();
  List<BudgetDetails> quickActionList = getQuickActionList();

  int j = 3;
  int i = 1;

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
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButton(
            color: appPrimaryColor,
            width: 130,
            elevation: 12.0,
            onTap: () {
              MBCreateBudgetScreen().launch(context);
            },
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text('Transfer', style: boldTextStyle(color: white)),
          ),
          AppButton(
            color: appStore.cardColor,
            width: 130,
            onTap: () {
              finish(context);
            },
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text('Cancel', style: boldTextStyle(color: appStore.isDarkModeOn ? white : appPrimaryColor)),
          ),
        ],
      ).paddingAll(16),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(MBSetAmountText, style: boldTextStyle(size: 24)),
            16.height,
            Text('How much you would like to send?', style: secondaryTextStyle(size: 16)),
            30.height,
            Container(
              width: context.width(),
              padding: EdgeInsets.all(16),
              height: 180,
              decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          backgroundColor: MBBottomInvitedColor,
                        ),
                        child: Icon(Icons.add, color: white, size: 22),
                      ),
                      20.width,
                      Text('\$7,000', style: boldTextStyle(color: appPrimaryColor, size: 24)),
                      20.width,
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          backgroundColor: MBBottomInvitedColor,
                        ),
                        child: Icon(Icons.horizontal_rule, color: white, size: 22),
                      ),
                    ],
                  ),
                  16.height,
                  Text('Quick Action', style: boldTextStyle()),
                  Container(
                    height: 60,
                    child: ListView.builder(
                      itemCount: quickActionList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        BudgetDetails data = quickActionList[index];
                        return Container(
                          margin: EdgeInsets.only(right: 16),
                          child: AppButton(
                            color: i == index ? appPrimaryColor : MBBottomInvitedColor,
                            width: 90,
                            height: 60,
                            onTap: () {
                              i = index;
                              setState(() {});
                            },
                            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Text(data.budgetType, style: boldTextStyle(color: i == index ? white : black)),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            16.height,
            Container(
              width: context.width(),
              height: 190,
              decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MBRecentReceiptsText, style: boldTextStyle()).paddingOnly(left: 16, top: 16),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      itemCount: receiptsList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        BudgetDetails data = receiptsList[index];
                        return Container(
                          height: 100,
                          margin: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: boxDecorationWithShadow(
                                  boxShape: BoxShape.circle,
                                  decorationImage: DecorationImage(image: Image.asset(data.totalCost).image, fit: BoxFit.cover),
                                ),
                              ),
                              10.height,
                              Text(data.budgetType, style: boldTextStyle(size: 16, color: j == index ? appPrimaryColor : gray)),
                            ],
                          ).onTap(() {
                            j = index;
                            setState(() {});
                          }),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(16),
      ),
    ));
  }
}
