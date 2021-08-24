import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDMyCardScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDExpirationFormField.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDFlipCard.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDAddNewCardScreen extends StatefulWidget {
  static String tag = '/FDAddNewCardScreen';

  @override
  FDAddNewCardScreenState createState() => FDAddNewCardScreenState();
}

class FDAddNewCardScreenState extends State<FDAddNewCardScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  var cardNumberCont = TextEditingController();
  var cardHolderCont = TextEditingController();
  var expiryDateCont = TextEditingController(text: 'MM/YY');
  var securityCodeCont = TextEditingController();

  var cardHolderFocus = FocusNode();
  var cardNumberFocus = FocusNode();
  var expiryDateFocus = FocusNode();
  var securityCodeFocus = FocusNode();

  var isFocusOnSecurityCode = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    securityCodeFocus.addListener(() {
      cardKey.currentState.toggleCard();

      setState(() {});
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
    securityCodeFocus?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Add card', style: boldTextStyle(size: 20, color: white)),
        backgroundColor: FDPrimaryColor,
        toolbarHeight: 70,
        leading: Icon(Icons.arrow_back_ios_outlined, color: white).onTap(() {
          finish(context);
        }),
      ),
      backgroundColor: FDPrimaryColor,
      body: Stack(
        children: [
          Container(
            height: context.width() * 0.5,
            child: FlipCard(
              key: cardKey,
              front: Container(
                decoration: BoxDecoration(color: FDRedColor, borderRadius: BorderRadius.circular(16)),
                child: Stack(
                  children: [
                    Positioned(
                      child: Image.asset('images/foodDelivery/fd_mastercard.png'),
                      height: 40,
                      right: 8,
                      top: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            cardNumberCont.text.padRight(16, '*').replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} "),
                            style: boldTextStyle(size: 24),
                          ),
                        ),
                        30.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Card Holder', style: primaryTextStyle(size: 16)),
                            Text('Expiry', style: primaryTextStyle(size: 16)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cardHolderCont.text,
                              style: boldTextStyle(size: 24),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).expand(),
                            Text(expiryDateCont.text, style: boldTextStyle(size: 24)),
                          ],
                        ),
                      ],
                    ).paddingOnly(left: 16, right: 16),
                  ],
                ),
              ),
              back: Container(
                decoration: BoxDecoration(color: FDRedColor, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(height: 40, color: Colors.black),
                    20.height,
                    Row(
                      children: [
                        Container(height: 40, color: Colors.black38, width: (context.width() * 0.6)),
                        20.width,
                        Text(securityCodeCont.text, style: boldTextStyle(size: 24)),
                      ],
                    ),
                    20.height,
                    Container(height: 40, color: Colors.black12),
                  ],
                ),
              ),
            ),
          ).paddingAll(16),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.width(),
              height: context.height() * 0.50,
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.height,
                        Text('Name in Card', style: secondaryTextStyle()),
                        8.height,
                        TextField(
                          controller: cardHolderCont,
                          textCapitalization: TextCapitalization.words,
                          focusNode: cardHolderFocus,
                          textInputAction: TextInputAction.next,
                          style: primaryTextStyle(size: 14),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            filled: true,
                            fillColor: grey.withOpacity(0.1),
                            contentPadding: EdgeInsets.only(left: 16, right: 16),
                          ),
                          onChanged: (s) {
                            setState(() {});
                          },
                        ),
                        16.height,
                        Text('Card number', style: secondaryTextStyle()),
                        8.height,
                        TextField(
                          focusNode: cardNumberFocus,
                          controller: cardNumberCont,
                          keyboardType: TextInputType.number,
                          style: primaryTextStyle(size: 14),
                          maxLength: 16,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            filled: true,
                            fillColor: grey.withOpacity(0.1),
                            contentPadding: EdgeInsets.only(left: 16, right: 16),
                          ),
                          onChanged: (s) {
                            setState(() {});
                          },
                        ),
                        16.height,
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expired date', style: secondaryTextStyle()),
                                8.height,
                                ExpirationFormField(
                                  controller: expiryDateCont,
                                  style: primaryTextStyle(size: 14),
                                  focusNode: expiryDateFocus,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: grey.withOpacity(0.1),
                                    contentPadding: EdgeInsets.only(left: 16, right: 16),
                                    counterText: '',
                                  ),
                                ),
                              ],
                            ).expand(),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('CVV', style: secondaryTextStyle()),
                                8.height,
                                TextField(
                                  controller: securityCodeCont,
                                  keyboardType: TextInputType.number,
                                  style: primaryTextStyle(),
                                  focusNode: securityCodeFocus,
                                  textInputAction: TextInputAction.next,
                                  maxLength: 3,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                                    filled: true,
                                    fillColor: grey.withOpacity(0.1),
                                    contentPadding: EdgeInsets.only(left: 16, right: 16),
                                    counterText: '',
                                  ),
                                  onChanged: (s) {
                                    setState(() {});
                                  },
                                ),
                              ],
                            ).expand(),
                          ],
                        ),
                        80.height,
                      ],
                    ).paddingOnly(left: 16, right: 16),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: fdAppButton(FDPrimaryColor, () {
                      FDMyCardScreen().launch(context);
                    }, context, 'Submit'),
                  ),
                ],
              ).withHeight(context.height()),
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }
}
