import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAConformationComponent.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FABottomSheetCustom.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FASendMoneyNextScreen extends StatefulWidget {
  static String tag = '/FASendMoneyNextScreen';

  @override
  FASendMoneyNextScreenState createState() => FASendMoneyNextScreenState();
}

class FASendMoneyNextScreenState extends State<FASendMoneyNextScreen> {
  var amountController = TextEditingController();
  String selectedOption = 'Outgoing';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: faGradientBoxDecoration(),
        child: Column(
          children: [
            faAppbarWidget(
              context,
              backgroundColor: Colors.transparent,
              title: "Send Money",
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: radius(12),
                      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                    ),
                    child: Column(
                      children: [
                        sendMoneyUserWidget(image: fa_user1, name: "Jerry", type: "@leocamp"),
                        Divider(),
                        sendMoneyUserWidget(image: fa_user5, name: "Isabella", type: "@leocamp"),
                      ],
                    ),
                  ).paddingOnly(top: 16, right: 16, left: 16),
                  60.height,
                  Text('How much?', style: primaryTextStyle(size: 14, color: Colors.white)),
                  16.height,
                  Container(
                    alignment: Alignment.center,
                    child: AppTextField(
                      controller: amountController,
                      textFieldType: TextFieldType.OTHER,
                      keyboardType: TextInputType.number,
                      autoFocus: false,
                      minLines: 1,
                      textStyle: boldTextStyle(color: Colors.white, size: 30),
                      maxLength: 10,
                      decoration: faAmountInputDecoration(prefixIcon: fa_dollar_sign, hint: "Enter amount"),
                    ),
                  ).paddingOnly(left: 30, right: 30),
                  Divider(color: Colors.grey[100]).paddingOnly(left: 30, right: 30),
                  16.height,
                  Text('Thanks for your work', style: primaryTextStyle(color: white)),
                  24.height,
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: radius(16),
                      backgroundColor: fa_color_secondary.withOpacity(0.2),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedOption,
                        dropdownColor: Colors.grey[600],
                        icon: Icon(
                          // Add this
                          Icons.keyboard_arrow_down, color: Colors.white,
                        ),
                        items: <String>['Outgoing', 'Incoming'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: secondaryTextStyle()),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedOption = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ).expand(),
            Align(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                width: context.width(),
                child: Text("Next", style: boldTextStyle(color: white)),
                color: fa_color_secondary,
                shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                onTap: () {
                  showModalBottomSheetCustom(
                    context: context,
                    builder: (context) {
                      return FAConformationComponent();
                    },
                    topOffset: 60,
                  );
                },
              ),
            ).paddingOnly(bottom: 16, right: 16, left: 16)
          ],
        ),
      ),
    );
  }
}
