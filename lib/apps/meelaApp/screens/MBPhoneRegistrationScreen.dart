import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBVerifyAccountScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBPhoneRegistrationScreen extends StatefulWidget {
  @override
  MBPhoneRegistrationScreenState createState() => MBPhoneRegistrationScreenState();
}

class MBPhoneRegistrationScreenState extends State<MBPhoneRegistrationScreen> {
  TextEditingController phoneNumController = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(MBTextRegistrationTitle, style: boldTextStyle(size: 26)),
                  16.height,
                  Text(MBTextRegistrationSubTitle, style: secondaryTextStyle(size: 16)),
                  44.height,
                  Text(MBTextEnterLocation, style: boldTextStyle(size: 14)),
                  16.height,
                  Container(
                    width: context.width(),
                    padding: EdgeInsets.only(left: 16, right: 4, top: 4, bottom: 4),
                    alignment: Alignment.topLeft,
                    decoration: boxDecorationWithRoundedCorners(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      border: Border.all(color: gray.withOpacity(0.3)),
                    ),
                    child: CountryCodePicker(
                      onChanged: (e) => print(e.toLongString()),
                      initialSelection: 'TF',
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      favorite: ['+39', 'FR'],
                    ),
                  ),
                  38.height,
                  Text(MBTextPhoneNumber, style: boldTextStyle(size: 14)),
                  16.height,
                  textFieldWidget(hintText: 'Enter Phone Number', controller: phoneNumController, textFieldType: TextFieldType.PHONE, length: 10),
                ],
              ),
              16.height,
              Column(
                children: [
                  AppButton(
                    text: MBBtnContinueText,
                    elevation: 12.0,
                    onTap: () {
                      finish(context);
                      MBVerifyAccountScreen().launch(context);
                    },
                    color: appPrimaryColor,
                    width: context.width(),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  34.height,
                  Text(MBTermsConditionText, style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
                ],
              ),
            ],
          ).paddingOnly(top: 44, bottom: 44, right: 16, left: 16),
        ),
      ),
    );
  }
}
