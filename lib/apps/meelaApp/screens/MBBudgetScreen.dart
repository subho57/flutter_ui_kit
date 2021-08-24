import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBCreateBudgetScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBBudgetScreen extends StatefulWidget {
  static String tag = '/MBBudgetScreen';

  @override
  MBBudgetScreenState createState() => MBBudgetScreenState();
}

class MBBudgetScreenState extends State<MBBudgetScreen> {
  List<BudgetDetails> nameMonth = getMonthNameList();

  int count = 0;

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
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              28.height,
              Text('Budget', style: boldTextStyle(size: 28)).paddingLeft(16),
              16.height,
              Container(
                height: 60,
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: nameMonth.length,
                    itemBuilder: (context, index) {
                      BudgetDetails data = nameMonth[index];
                      return Container(
                        margin: EdgeInsets.all(6),
                        decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow()),
                        child: AppButton(
                          color: count == index ? appPrimaryColor : white,
                          onTap: () {
                            setState(() {
                              count = index;
                            });
                          },
                          child: Text(data.nameMonth, style: boldTextStyle(color: count == index ? white : black)),
                        ),
                      );
                    }),
              ),
              32.height,
              Column(
                children: [
                  budgetCardWidget(
                    bugTitle: 'Children Education',
                    amount: '\$2446.20',
                    percentage: '50%',
                    amount1: '\$2446.20',
                    color: Colors.greenAccent,
                    width: context.width() * 0.8,
                  ),
                  24.height,
                  budgetCardWidget(
                    bugTitle: 'Home Medical',
                    amount: '\$5,0000',
                    percentage: '75%',
                    amount1: '\$60,000',
                    color: appPrimaryColor,
                    width: context.width() * 0.8,
                  ),
                  24.height,
                  budgetCardWidget(
                    bugTitle: 'Office and Business',
                    amount: '\$1,0000',
                    percentage: '25%',
                    amount1: '\$25,000',
                    color: Colors.greenAccent,
                    width: context.width() * 0.8,
                  ),
                  24.height,
                  AppButton(
                    width: context.width(),
                    color: appPrimaryColor,
                    onTap: () {
                      MBCreateBudgetScreen().launch(context);
                    },
                    child: Text('Set New Budget', style: boldTextStyle(color: Colors.white)),
                  )
                ],
              ).paddingOnly(left: 16, right: 16)
            ],
          ),
        ),
      ),
    );
  }
}
