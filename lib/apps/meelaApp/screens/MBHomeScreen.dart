import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBAccountAnalyticsScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBBudgetScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBNewCardScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSendMoneyScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSetAmountScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MBHomeScreen extends StatefulWidget {
  @override
  MBHomeScreenState createState() => MBHomeScreenState();
}

class MBHomeScreenState extends State<MBHomeScreen> {
  List<BudgetDetails> budgetDetailList = getBudgetDetailList();
  List<BudgetDetails> operationsList = getOperationsList();
  List<BudgetDetails> completeList = getCompleteList();

  TextEditingController dateController = TextEditingController();

  int i = 0;

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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(MBHelloText, style: boldTextStyle(size: 16, color: gray)),
                          8.height,
                          Text.rich(
                            TextSpan(
                              text: MBNameText,
                              style: boldTextStyle(size: 22),
                              children: <TextSpan>[TextSpan(text: MBLastNameText, style: secondaryTextStyle(size: 22, color: Colors.blue))],
                            ),
                          )
                        ],
                      ),
                      ClipRRect(borderRadius: BorderRadius.all(Radius.circular(8)), child: Image.asset(mb_profile1, width: 50, height: 50)),
                    ],
                  ),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MBOverViewText, style: boldTextStyle(size: 16)),
                      Text(MBInSightText, style: boldTextStyle(size: 16, color: gray.withOpacity(0.7))),
                    ],
                  ),
                ],
              ).paddingAll(16),
              Container(
                height: 150,
                child: ListView.builder(
                  itemCount: budgetDetailList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    BudgetDetails data = budgetDetailList[index];
                    return Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        backgroundColor: i == index ? appPrimaryColor : appStore.cardColor,
                        boxShadow: defaultBoxShadow(),
                      ),
                      alignment: Alignment.center,
                      width: context.width() * 0.45,
                      margin: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularPercentIndicator(
                            radius: 60.0,
                            lineWidth: 2.0,
                            animation: true,
                            percent: data.percentage,
                            backgroundColor: i == index ? gray : white,
                            center: Text(data.progressPercentage, style: boldTextStyle(color: i == index ? white : appPrimaryColor)),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: i == index ? white : Colors.purple,
                          ),
                          8.width,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data.budgetType, style: boldTextStyle(size: 16, color: i == index ? white : Colors.blue)),
                              8.height,
                              Text(data.totalCost, style: boldTextStyle(size: 16, color: i == index ? white : Colors.blue)),
                            ],
                          ),
                        ],
                      ),
                    ).onTap(() {
                      i = index;
                      setState(() {});
                    });
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.height,
                  Text(MBOperationText, style: boldTextStyle()),
                  16.height,
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    alignment: WrapAlignment.spaceEvenly,
                    runAlignment: WrapAlignment.spaceEvenly,
                    children: List.generate(
                      operationsList.length,
                      (index) {
                        BudgetDetails data = operationsList[index];

                        return Container(
                          width: context.width() * 0.25,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(data.icon, size: 24, color: appStore.isDarkModeOn ? appBarBackgroundColor : appPrimaryColor),
                              8.height,
                              Text(data.budgetType, style: boldTextStyle(size: 16)),
                            ],
                          ),
                        ).onTap(() {
                          if (index == 0) {
                            MBSendMoneyScreen().launch(context);
                          } else if (index == 2) {
                            MBSetAmountScreen().launch(context);
                          } else if (index == 5) {
                            MBBudgetScreen().launch(context);
                          } else if (index == 4) {
                            MBAccountAnalyticsScreen().launch(context);
                          } else if (index == 3) {
                            MBNewCardScreen().launch(context);
                          }
                          setState(() {});
                        });
                      },
                    ),
                  ).center(),
                  16.height,
                  Text(MBCompleteText, style: boldTextStyle()),
                  ListView.builder(
                    itemCount: completeList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      BudgetDetails data = completeList[index];
                      return Container(
                        decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                        width: context.width(),
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(data.budgetType, style: boldTextStyle(size: 16)),
                            Text(data.totalCost, style: secondaryTextStyle()),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ).paddingOnly(right: 16, left: 16),
            ],
          ),
        ),
      ),
    );
  }
}
