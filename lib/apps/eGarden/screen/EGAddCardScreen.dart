import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGImages.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGTextInputFormatter.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class EGAddCardScreen extends StatefulWidget {
  static String tag = '/EGAddCardScreen';

  @override
  EGAddCardScreenState createState() => EGAddCardScreenState();
}

class EGAddCardScreenState extends State<EGAddCardScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController cardHolderNameCtrl = TextEditingController();
  TextEditingController expiryCtrl = TextEditingController();
  TextEditingController securityCodeCtrl = TextEditingController();

  FocusNode cardNumberFocus;
  FocusNode cardHolderNameFocus;
  FocusNode expiryFocus;
  FocusNode securityFocus;

  bool isValidCardNumber = false;

  @override
  void initState() {
    super.initState();
    cardNumberFocus = FocusNode();
    cardHolderNameFocus = FocusNode();
    expiryFocus = FocusNode();
    securityFocus = FocusNode();
    init();
  }

  init() async {}

  @override
  void dispose() {
    super.dispose();
    cardNumberFocus.dispose();
    cardHolderNameFocus.dispose();
    expiryFocus.dispose();
    securityFocus.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  bool validateCardNumber(String cardNumber) {
    if (cardNumber == "1234 5678 9876 5432") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("Add card", elevation: 0),
        persistentFooterButtons: [
          roundedButtonWithFillColor(context: context, btnText: "Save"),
        ],
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCacheImageWidget(EGImgDebitCard, 200, width: context.width() * 0.8).center(),
                32.height,
                TextFormField(
                  focusNode: cardNumberFocus,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.number,
                  controller: cardNumberCtrl,
                  inputFormatters: [EGTextInputFormatter('xxxx xxxx xxxx xxxx', ' ')],
                  decoration: InputDecoration(
                    labelText: "Card Number",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                    enabledBorder: isValidCardNumber ? UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)) : null,
                    contentPadding: EdgeInsets.zero,
                    labelStyle: secondaryTextStyle(size: 16),
                    suffixIcon: isValidCardNumber ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    cardNumberFocus.unfocus();
                    FocusScope.of(context).requestFocus(cardHolderNameFocus);
                  },
                  onChanged: (val) {
                    if (val.length == 19) {
                      cardNumberFocus.unfocus();
                      FocusScope.of(context).requestFocus(cardHolderNameFocus);
                    }
                  },
                ),
                16.height,
                TextFormField(
                  focusNode: cardHolderNameFocus,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.text,
                  controller: cardHolderNameCtrl,
                  decoration: InputDecoration(
                    labelText: "Cardholder Name",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                    enabledBorder: isValidCardNumber ? UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)) : null,
                    contentPadding: EdgeInsets.zero,
                    labelStyle: secondaryTextStyle(size: 16),
                    suffixIcon: isValidCardNumber ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onFieldSubmitted: (val) {
                    cardHolderNameFocus.unfocus();
                    FocusScope.of(context).requestFocus(expiryFocus);
                  },
                ),
                16.height,
                Row(
                  children: [
                    TextFormField(
                      focusNode: expiryFocus,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.datetime,
                      inputFormatters: [EGTextInputFormatter('xx/xx', '/')],
                      controller: expiryCtrl,
                      decoration: InputDecoration(
                        labelText: "Expiry",
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                        enabledBorder: isValidCardNumber ? UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)) : null,
                        contentPadding: EdgeInsets.zero,
                        labelStyle: secondaryTextStyle(size: 16),
                        suffixIcon: isValidCardNumber ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                        suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                      ),
                      onFieldSubmitted: (val) {
                        expiryFocus.unfocus();
                        FocusScope.of(context).requestFocus(securityFocus);
                      },
                      onChanged: (val) {
                        if (val.length == 5) {
                          expiryFocus.unfocus();
                          FocusScope.of(context).requestFocus(securityFocus);
                        }
                      },
                    ).expand(),
                    16.width,
                    TextFormField(
                      obscureText: true,
                      focusNode: securityFocus,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      controller: securityCodeCtrl,
                      inputFormatters: [LengthLimitingTextInputFormatter(3)],
                      decoration: InputDecoration(
                        labelText: "Security Code",
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)),
                        enabledBorder: isValidCardNumber ? UnderlineInputBorder(borderSide: BorderSide(color: egPrimaryColor1, width: 1.5)) : null,
                        contentPadding: EdgeInsets.zero,
                        labelStyle: secondaryTextStyle(size: 16),
                        suffixIcon: isValidCardNumber ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                        suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                      ),
                      onFieldSubmitted: (val) {
                        securityFocus.unfocus();
                      },
                    ).expand(),
                  ],
                )
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
