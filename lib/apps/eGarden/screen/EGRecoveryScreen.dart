import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGVerificationScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class EGRecoveryScreen extends StatefulWidget {
  static String tag = '/EGRecoveryScreen';

  @override
  EGRecoveryScreenState createState() => EGRecoveryScreenState();
}

class EGRecoveryScreenState extends State<EGRecoveryScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();

  bool isGetTheCodeBtnEnable = false;
  bool isValidEmail = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget("", elevation: 0, color: appStore.cardColor),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Recovery", style: boldTextStyle(size: 32)).paddingOnly(top: 16, right: 16, left: 16),
                8.height,
                Text("Enter email to receive recovery code", style: secondaryTextStyle()).paddingSymmetric(horizontal: 16),
                40.height,
                TextFormField(
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailCtrl,
                  style: secondaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: "Email",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    enabledBorder: isValidEmail ? UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)) : UnderlineInputBorder(borderSide: BorderSide(color: gray, width: 1.5)),
                    contentPadding: EdgeInsets.zero,
                    hintStyle: secondaryTextStyle(),
                    labelStyle: secondaryTextStyle(size: 16),
                    suffixIcon: isValidEmail ? IconButton(icon: Icon(Icons.check, color: egPrimaryColor1), onPressed: () {}) : 0.width,
                    suffixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 32),
                  ),
                  onChanged: (val) {
                    isValidEmail = val.validateEmail() ? true : false;
                    isGetTheCodeBtnEnable = emailCtrl.text.isEmptyOrNull || !isValidEmail ? false : true;
                    setState(() {});
                  },
                  validator: (val) {
                    if (val.isEmptyOrNull) {
                      return "Please enter email id";
                    }
                    if (!val.validateEmail()) {
                      return "Please enter valid email id";
                    }
                    isValidEmail = true;
                    return null;
                  },
                ).paddingSymmetric(horizontal: 16),
                100.height,
                Text(
                  "Make sure you already confirmed your email. By pressing button below, you'll get an email with recovery code. Input this code on the next page to reset to your password",
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center,
                ).paddingSymmetric(horizontal: 16),
                32.height,
                roundedButtonWithFillColor(
                  context: context,
                  btnText: "Get the code",
                  isEnable: isGetTheCodeBtnEnable,
                ).paddingSymmetric(horizontal: 12).onTap(() {
                  if (_formKey.currentState.validate()) {
                    EGVerificationScreen().launch(context);
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
