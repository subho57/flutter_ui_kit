import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBCreateBudgetScreen extends StatefulWidget {
  @override
  MBCreateBudgetScreenState createState() => MBCreateBudgetScreenState();
}

class MBCreateBudgetScreenState extends State<MBCreateBudgetScreen> {
  List<BudgetDetails> categoryBudgetList = getCategoryBudgetList();

  TextEditingController budgetController = TextEditingController();

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
        bottomNavigationBar: AppButton(
          child: Text('Create Budget', style: boldTextStyle(size: 16, color: white)),
          onTap: () {},
          elevation: 12.0,
          color: appPrimaryColor,
          width: context.width(),
          shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
        ).paddingOnly(left: 16, right: 16, bottom: 24),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Budget', style: boldTextStyle(size: 24)),
                  16.height,
                  Text('Choose category of budget', style: secondaryTextStyle(size: 16)),
                ],
              ).paddingAll(16),
              Container(
                height: 170,
                child: ListView.builder(
                    itemCount: categoryBudgetList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      BudgetDetails data = categoryBudgetList[index];
                      return Container(
                        height: 160,
                        width: 160,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.only(left: 16),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          backgroundColor: i == index ? appPrimaryColor : white,
                          border: Border.all(color: i == index ? white : appPrimaryColor, width: 1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            8.height,
                            Image.asset(data.img, width: 60, height: 60, fit: BoxFit.cover),
                            20.height,
                            Text(data.budgetType, style: boldTextStyle(size: 20, color: i == index ? white : appPrimaryColor)),
                          ],
                        ),
                      ).onTap(() {
                        i = index;
                        setState(() {});
                      });
                    }),
              ),
              16.height,
              Column(
                children: [
                  textFieldWidget(hintText: 'Enter budget name', controller: budgetController, textFieldType: TextFieldType.EMAIL),
                  16.height,
                  editTextWidget(hintText: 'Choose Category', color: gray.withOpacity(0.1), icon: Icons.keyboard_arrow_down, iconColor: appPrimaryColor),
                  16.height,
                  Row(
                    children: [
                      editTextWidget(
                        hintText: 'Enter Amount',
                        keyboardType: TextInputType.number,
                        color: gray.withOpacity(0.1),
                        icon: Icons.edit_outlined,
                        iconColor: appPrimaryColor,
                      ).expand(),
                      8.width,
                      editTextWidget(
                        hintText: 'Choose Tag',
                        keyboardType: TextInputType.text,
                        color: gray.withOpacity(0.1),
                        icon: Icons.keyboard_arrow_down,
                        iconColor: appPrimaryColor,
                      ).expand(),
                    ],
                  ),
                  16.height,
                ],
              ).paddingOnly(left: 16, right: 16, bottom: 16),
            ],
          ),
        ),
      ),
    );
  }
}
