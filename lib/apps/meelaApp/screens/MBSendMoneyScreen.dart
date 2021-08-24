import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBChooseAccountScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBMapScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBColors.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBSendMoneyScreen extends StatefulWidget {
  @override
  MBSendMoneyScreenState createState() => MBSendMoneyScreenState();
}

class MBSendMoneyScreenState extends State<MBSendMoneyScreen> {
  List<BudgetDetails> sendMoneyList = getSendMoneyList();
  List<BudgetDetails> receiptsList = getReceiptsList();
  List<BudgetDetails> addNewContactList = getAddNewContactList();

  int i = 0;
  int j = 1;
  int K = 3;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MBSendMoneyText, style: boldTextStyle(size: 22)),
                  16.height,
                  Text(MBSelectOptionText, style: secondaryTextStyle(size: 16)),
                ],
              ).paddingOnly(left: 16, top: 16),
              Container(
                height: 120,
                child: ListView.builder(
                  itemCount: sendMoneyList.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    BudgetDetails data = sendMoneyList[index];
                    return Container(
                      width: 90,
                      margin: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: i == index ? appPrimaryColor : Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: defaultBoxShadow(),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(data.icon, size: 24, color: i == index ? white : appPrimaryColor),
                          8.height,
                          Text(data.budgetType, style: boldTextStyle(size: 16, color: i == index ? white : null)),
                        ],
                      ),
                    ).onTap(() {
                      i = index;
                      setState(() {
                        if (index == 3) {
                          MBMapScreen().launch(context);
                        } else if (index == 0) {
                          MBChooseAccountScreen().launch(context);
                        }
                      });
                    });
                  },
                ),
              ),
              Column(
                children: [
                  Container(
                    width: context.width(),
                    decoration: boxDecorationWithRoundedCorners(
                      boxShadow: defaultBoxShadow(),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
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
                                height: 120,
                                margin: EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: boxDecorationWithShadow(
                                        boxShape: BoxShape.circle,
                                        decorationImage: DecorationImage(image: Image.asset(data.totalCost).image, fit: BoxFit.cover),
                                      ),
                                    ),
                                    10.height,
                                    Text(data.budgetType, style: boldTextStyle(size: 16, color: j == index ? appPrimaryColor : iconSecondaryColor)),
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
                  16.height,
                  Container(
                    width: context.width(),
                    decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(MBAddNewContactText, style: boldTextStyle()),
                        8.height,
                        TextFormField(
                          autocorrect: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            hintText: 'Search Contact',
                            suffixIcon: Icon(Icons.search, color: gray),
                            hintStyle: TextStyle(color: gray),
                            filled: true,
                            fillColor: gray.withOpacity(0.1),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: white, width: 0.5),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: white, width: 0.5),
                            ),
                          ),
                        ),
                        ListView.builder(
                          itemCount: addNewContactList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(vertical: 8),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            BudgetDetails data = addNewContactList[index];

                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: boxDecorationWithShadow(
                                      boxShape: BoxShape.circle,
                                      decorationImage: DecorationImage(image: Image.asset(data.img).image, fit: BoxFit.cover),
                                    ),
                                  ),
                                  16.width,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(data.budgetType, style: boldTextStyle()),
                                      4.height,
                                      Text(data.totalCost, style: secondaryTextStyle(size: 14)),
                                    ],
                                  ).expand(),
                                  AppButton(
                                    color: K == index ? appPrimaryColor : MBBottomInvitedColor,
                                    onTap: () {},
                                    elevation: 0.0,
                                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                    child: Text(MBBtnInvitedText, style: boldTextStyle(color: K == index ? white : black)),
                                  )
                                ],
                              ),
                            ).onTap(() {
                              K = index;
                              setState(() {});
                            });
                          },
                        ),
                      ],
                    ).paddingAll(16),
                  ),
                ],
              ).paddingAll(16),
            ],
          ),
        ),
      ),
    );
  }
}
