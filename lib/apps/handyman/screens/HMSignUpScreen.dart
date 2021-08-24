import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMSignUpScreen extends StatefulWidget {
  static String tag = '/HMSignUpScreen';

  @override
  HMSignUpScreenState createState() => HMSignUpScreenState();
}

class HMSignUpScreenState extends State<HMSignUpScreen> {
  TextEditingController _dobController;

  FocusNode nameNode;
  FocusNode mailNode;
  FocusNode passNode;
  FocusNode numberNode;
  FocusNode dobNode;

  bool _showPassword = false;
  DateTime _dobDate;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _dobController = TextEditingController();
    nameNode = FocusNode();
    mailNode = FocusNode();
    passNode = FocusNode();
    numberNode = FocusNode();
    dobNode = FocusNode();
  }

  @override
  void dispose() {
    _dobController.dispose();
    nameNode.dispose();
    mailNode.dispose();
    passNode.dispose();
    numberNode.dispose();
    dobNode.dispose();
    super.dispose();
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
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          elevation: 0,
          leading: Icon(Icons.arrow_back).onTap(() {
            finish(context);
          }),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Column(
                children: [
                  Text("Sign Up", style: boldTextStyle(size: HMHeadingFontSize.toInt())),
                  Text("Please write your information below", style: TextStyle(color: HMFontColor600, fontSize: HMFontSize)).paddingTop(18.0),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            focusNode: nameNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "full name",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                            onFieldSubmitted: (term) {
                              nameNode.unfocus();
                              FocusScope.of(context).requestFocus(mailNode);
                            },
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius),
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            focusNode: mailNode,
                            textInputAction: TextInputAction.next,
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (term) {
                              mailNode.unfocus();
                              FocusScope.of(context).requestFocus(passNode);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16),
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            autofocus: false,
                            focusNode: passNode,
                            textInputAction: TextInputAction.next,
                            obscureText: _showPassword ? false : true,
                            keyboardType: TextInputType.text,
                            onFieldSubmitted: (term) {
                              passNode.unfocus();
                              FocusScope.of(context).requestFocus(numberNode);
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  _showPassword = !_showPassword;
                                  setState(() {});
                                },
                                child: Icon(_showPassword ? Icons.visibility : Icons.visibility_off, color: gray),
                              ),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16),
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            autofocus: false,
                            focusNode: numberNode,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "+91 123 456 6789",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                            onFieldSubmitted: (term) {
                              numberNode.unfocus();
                            },
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16),
                        Container(
                          decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100]),
                          child: TextFormField(
                            focusNode: dobNode,
                            controller: _dobController,
                            onTap: () async {
                              _dobDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                              );
                              if (_dobDate != null && _dobDate != DateTime.now()) {
                                _dobController.text = '${_dobDate.year}/' + '${_dobDate.month}/' + '${_dobDate.day}';
                              }
                            },
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(onTap: () {}, child: Icon(Icons.calendar_today, color: gray)),
                              border: InputBorder.none,
                              hintText: "Date of Birth",
                              hintStyle: secondaryTextStyle(size: 16),
                            ),
                          ).paddingOnly(left: 8, top: 2),
                        ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(top: 16),
                        CommonButton("Sign Up").paddingTop(64).onTap(() {
                          finish(context);
                        }),
                      ],
                    ),
                  ).paddingTop(64),
                ],
              )),
              Container(
                  child: createRichText(list: [
                TextSpan(text: "You have an account?", style: TextStyle(color: HMFontColor600)),
                TextSpan(text: "Sign In", style: boldTextStyle(color: hmColorPrimary)),
              ]).onTap(() {
                finish(context);
              })).paddingOnly(top: 32, bottom: 32)
            ],
          ),
        ).paddingOnly(top: HMAppPadding, left: HMAppPadding, right: HMAppPadding),
      ),
    );
  }
}
