import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/component/HMMaskInputFormat.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMAddPaymentMethod extends StatefulWidget {
  static String tag = '/HMAddPaymentMethod';

  @override
  HMAddPaymentMethodState createState() => HMAddPaymentMethodState();
}

class HMAddPaymentMethodState extends State<HMAddPaymentMethod> {
  bool _isAddNew = false;
  int card = 1;

  TextEditingController cardNumber;
  TextEditingController cardExp;
  TextEditingController cardCVV;

  FocusNode cardNumNode;
  FocusNode cardExpNode;
  FocusNode cardCVVNode;

  final _formKey = GlobalKey<FormState>();
  int selectedIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    cardNumber = TextEditingController();
    cardExp = TextEditingController();
    cardCVV = TextEditingController();

    cardNumNode = FocusNode();
    cardExpNode = FocusNode();
    cardCVVNode = FocusNode();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          centerTitle: true,
          title: Text("Payment Methods", style: boldTextStyle(size: HMScreenHeadingFontSize.toInt())),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              finish(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Payment Methods", style: boldTextStyle(size: 16)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cardData.length,
                        itemBuilder: (context, index) {
                          CardDetails data = cardData[index];
                          return CommonCardDetail(
                            selectedIndex: selectedIndex,
                            mainIndex: index,
                            cardImage: data.cardImage,
                            cardNumber: data.cardNumber,
                          ).onTap(
                            () {
                              selectedIndex = index;
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                75.height,
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Add new Payment Methods", style: boldTextStyle(size: 16)),
                      16.height,
                      Container(
                        width: context.width(),
                        decoration: BoxDecoration(color: appStore.cardColor),
                        child: Row(
                          children: [
                            Image.asset(card == 1 ? 'images/handyman/hm_visa.png' : 'images/handyman/hm_master.png', height: 50, width: 50),
                            8.width,
                            Text(card == 1 ? "Visa Card" : "Master Card", style: boldTextStyle(size: 16)).expand(),
                            Icon(_isAddNew ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, size: 24, color: HMFontColor400)
                          ],
                        ).paddingOnly(top: 4, bottom: 4, left: 8, right: 8),
                      ).cornerRadiusWithClipRRect(HMCornerRadius).onTap(
                        () {
                          _isAddNew = !_isAddNew;
                          setState(() {});
                        },
                      ),
                      Container(
                        decoration: BoxDecoration(color: appStore.cardColor),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('images/handyman/hm_visa.png', height: 50, width: 50),
                                8.width,
                                Text("Visa card", style: boldTextStyle(size: 16)).expand(),
                              ],
                            ).paddingOnly(top: 4, bottom: 4, left: 8, right: 8).onTap(
                              () {
                                card = 1;
                                _isAddNew = false;
                                setState(() {});
                              },
                            ),
                            Divider(thickness: 1, height: 0),
                            Row(
                              children: [
                                Image.asset('images/handyman/hm_master.png', height: 50, width: 50),
                                8.width,
                                Text("Master card", style: boldTextStyle(size: 16)).expand(),
                              ],
                            ).paddingOnly(top: 4, bottom: 4, left: 8, right: 8).onTap(
                              () {
                                card = 2;
                                _isAddNew = false;
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 8, bottom: 8).visible(_isAddNew),
                      16.height,
                      Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(color: appStore.cardColor),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value.length != 19) {
                                      return 'Please Enter valid Details';
                                    }
                                    return null;
                                  },
                                  controller: cardNumber,
                                  focusNode: cardNumNode,
                                  inputFormatters: [MaskInputFormatting(mask: 'xxxx xxxx xxxx xxxx', saparator: ' ')],
                                  autofocus: false,
                                  keyboardType: TextInputType.number,
                                  style: secondaryTextStyle(size: 16),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Card number",
                                    hintStyle: secondaryTextStyle(size: 16),
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 19) {
                                      FocusScope.of(context).requestFocus(cardExpNode);
                                    }
                                  },
                                ).paddingOnly(left: 8, top: 2, bottom: 2),
                              ).cornerRadiusWithClipRRect(HMCornerRadius),
                              16.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(color: appStore.cardColor),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.length != 5) {
                                          return 'Please Enter valid Details';
                                        }
                                        return null;
                                      },
                                      controller: cardExp,
                                      focusNode: cardExpNode,
                                      inputFormatters: [MaskInputFormatting(mask: 'xx/xx', saparator: '/')],
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      style: secondaryTextStyle(size: 16),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Exp Date",
                                        hintStyle: secondaryTextStyle(size: 16),
                                      ),
                                      onChanged: (value) {
                                        if (value.length == 5) {
                                          FocusScope.of(context).requestFocus(cardCVVNode);
                                        }
                                      },
                                    ).paddingOnly(left: 8, top: 2, bottom: 2),
                                  ).cornerRadiusWithClipRRect(HMCornerRadius).expand(),
                                  8.width,
                                  Container(
                                    decoration: BoxDecoration(color: appStore.cardColor),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value.length != 3) {
                                          return 'Please Enter valid CVV';
                                        }
                                        return null;
                                      },
                                      controller: cardCVV,
                                      focusNode: cardCVVNode,
                                      obscureText: true,
                                      autofocus: false,
                                      keyboardType: TextInputType.number,
                                      style: secondaryTextStyle(size: 16),
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "CVV",
                                        hintStyle: secondaryTextStyle(size: 16),
                                      ),
                                      onChanged: (value) {
                                        if (value.length == 3) {
                                          cardCVVNode.unfocus();
                                        }
                                      },
                                    ).paddingOnly(left: 8, top: 2, bottom: 2),
                                  ).cornerRadiusWithClipRRect(HMCornerRadius).expand()
                                ],
                              ),
                            ],
                          )),
                      16.height,
                      CommonButton('Add new Method').onTap(() {
                        if (_formKey.currentState.validate()) {
                          cardData.add(
                            CardDetails(
                              cardNumber: cardNumber.text,
                              cardImage: card == 1 ? 'images/handyman/hm_visa.png' : 'images/handyman/hm_master.png',
                            ),
                          );
                          cardNumber.clear();
                          cardExp.clear();
                          cardCVV.clear();
                          setState(() {});
                        }
                      })
                    ],
                  ),
                )
              ],
            ),
          ).paddingAll(HMAppPadding),
        ),
      ),
    );
  }
}
