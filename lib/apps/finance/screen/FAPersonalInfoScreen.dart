import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FAAddressScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FAPersonalInfoScreen extends StatefulWidget {
  static String tag = '/FAPersonalInfoScreen';

  @override
  FAPersonalInfoScreenState createState() => FAPersonalInfoScreenState();
}

class FAPersonalInfoScreenState extends State<FAPersonalInfoScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var securityNumberController = TextEditingController();

  var fNameFocusNode = FocusNode();
  var lNameFocusNode = FocusNode();
  var dateOfBirthNameFocusNode = FocusNode();
  var securityNumberFocusNode = FocusNode();

  DateTime _dobDate;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(
      appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
      statusBarIconBrightness: Brightness.dark,
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : fa_color_background,
      appBar: faAppbarWidget(
        context,
        title: '',
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : fa_color_background,
        iconColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
      ),
      bottomNavigationBar: AppButton(
        width: context.width(),
        child: Text("Continue", style: boldTextStyle(color: white)),
        color: fa_color_secondary,
        shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
        onTap: () {
          FAAddressScreen().launch(context);
        },
      ).paddingOnly(left: 16, right: 16, bottom: 16),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Personal Info', style: boldTextStyle(size: 30)),
            ),
            8.height,
            Text(fa_personal_info, style: secondaryTextStyle()),
            30.height,
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: fNameController,
                    focus: fNameFocusNode,
                    nextFocus: lNameFocusNode,
                    decoration: faInputDecoration(hint: 'First Name'),
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.name,
                  ),
                  16.height,
                  AppTextField(
                    controller: lNameController,
                    focus: lNameFocusNode,
                    nextFocus: dateOfBirthNameFocusNode,
                    decoration: faInputDecoration(hint: 'Last Name'),
                    textFieldType: TextFieldType.NAME,
                    keyboardType: TextInputType.name,
                  ),
                  16.height,
                  AppTextField(
                    controller: dateOfBirthController,
                    focus: dateOfBirthNameFocusNode,
                    nextFocus: securityNumberFocusNode,
                    readOnly: true,
                    decoration: faInputDecoration(hint: 'Date of Birth ( MM / DD /YYYY)'),
                    suffix: Icon(Icons.calendar_today_rounded),
                    textFieldType: TextFieldType.OTHER,
                    onTap: () async {
                      hideKeyboard(context);
                      _dobDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (_dobDate != null && _dobDate != DateTime.now()) {
                        dateOfBirthController.text = '${_dobDate.month}/' + '${_dobDate.day}/' + '${_dobDate.year}';
                      }
                    },
                  ),
                  16.height,
                  AppTextField(
                    controller: securityNumberController,
                    textFieldType: TextFieldType.OTHER,
                    decoration: faInputDecoration(hint: 'Social security number (last 4 digits)'),
                    focus: securityNumberFocusNode,
                    suffix: Icon(Icons.lock),
                    maxLength: 4,
                  ),
                  16.height,
                  Text(fa_encryption_security, style: secondaryTextStyle(color: Colors.black)),
                ],
              ),
            )
          ],
        ).center().paddingAll(16),
      ),
    );
  }
}
