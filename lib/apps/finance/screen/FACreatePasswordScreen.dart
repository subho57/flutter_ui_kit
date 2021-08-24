import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAMemberDialog.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FACreatePasswordScreen extends StatefulWidget {
  static String tag = '/FACreatePasswordScreen';

  @override
  FACreatePasswordScreenState createState() => FACreatePasswordScreenState();
}

class FACreatePasswordScreenState extends State<FACreatePasswordScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  var passwordController = TextEditingController();

  var passwordFocusNode = FocusNode();

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
        onTap: () async {
          showInDialog(
            context,
            child: FAMemberDialog(),
            shape: dialogShape(16),
            contentPadding: EdgeInsets.zero,
            barrierDismissible: false,
          );
        },
      ).paddingOnly(left: 16, right: 16, bottom: 16),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(fa_app_logo, height: 120, width: 120, fit: BoxFit.fill),
            30.height,
            Align(alignment: Alignment.topLeft, child: Text('Create Password', style: boldTextStyle(size: 30))),
            8.height,
            Align(alignment: Alignment.topLeft, child: Text(fa_create_password_remember, style: secondaryTextStyle())),
            30.height,
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextField(
                    controller: passwordController,
                    focus: passwordFocusNode,
                    decoration: faInputDecoration(hint: 'Password'),
                    textFieldType: TextFieldType.PASSWORD,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                  ),
                  16.height,
                  createPasswordWidget(title: "Has at least 8  characters", iconColor: fa_color_green),
                  createPasswordWidget(title: "Has an uppercase letter or symbol", iconColor: fa_color_green),
                  createPasswordWidget(title: "Has a number", iconColor: fa_color_green),
                ],
              ),
            )
          ],
        ).center().paddingAll(16),
      ),
    );
  }
}
