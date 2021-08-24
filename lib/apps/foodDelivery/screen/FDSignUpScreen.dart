import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDSignUpScreen extends StatefulWidget {
  static String tag = '/FDSignUpScreen';

  @override
  FDSignUpScreenState createState() => FDSignUpScreenState();
}

class FDSignUpScreenState extends State<FDSignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool rememberCheckBox = false;

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
    return Scaffold(
      backgroundColor: FDPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fdCreateRichText('Sign up to \n', 'Fooddoor', white).paddingOnly(left: 40, top: 100),
            30.height,
            Container(
              decoration: boxDecorationWithRoundedCorners(),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Text('Full Name', style: secondaryTextStyle()),
                    8.height,
                    fdAppTextField(nameController, TextFieldType.NAME, focus: nameFocus, nextFocus: userNameFocus),
                    16.height,
                    Text('Email or Phone Number', style: secondaryTextStyle()),
                    8.height,
                    fdAppTextField(userNameController, TextFieldType.NAME, focus: userNameFocus, nextFocus: passwordFocus),
                    16.height,
                    Text('Password', style: secondaryTextStyle()),
                    8.height,
                    fdAppTextField(passwordController, TextFieldType.PASSWORD, focus: passwordFocus),
                    16.height,
                    CheckboxListTile(
                      value: rememberCheckBox,
                      activeColor: FDPrimaryColor,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.all(0),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('By creating an account, you agree to our', overflow: TextOverflow.ellipsis, style: secondaryTextStyle()),
                          Text('Term and Conditions', style: secondaryTextStyle(color: FDSelectedTextColor)).onTap(() {}),
                        ],
                      ),
                      onChanged: (value) {
                        setState(() {
                          rememberCheckBox = value;
                        });
                      },
                    ),
                    16.height,
                    fdAppButton(FDSecondaryColor, () {
                      finish(context);
                    }, context, 'Sign Up'),
                  ],
                ),
              ).paddingAll(16),
            ).paddingSymmetric(horizontal: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: FDPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account? ', style: secondaryTextStyle(color: white)),
            Text('Sign In', style: secondaryTextStyle(color: FDSecondaryColor)).onTap(() {
              finish(context);
            }),
          ],
        ),
      ),
    );
  }
}
