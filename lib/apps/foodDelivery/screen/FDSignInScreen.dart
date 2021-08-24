import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDSignInScreen extends StatefulWidget {
  static String tag = '/FDSignInScreen';

  @override
  FDSignInScreenState createState() => FDSignInScreenState();
}

class FDSignInScreenState extends State<FDSignInScreen> {
  final formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  bool showPassword = false;
  bool rememberCheckBox = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light, delayInMilliSeconds: 1000);
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fdCreateRichText('Sign in to \n', 'Fooddoor', white).paddingOnly(left: 40, top: 100),
                30.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.height,
                        Text('Email or Phone Number', style: secondaryTextStyle()),
                        8.height,
                        fdAppTextField(
                          userNameController,
                          TextFieldType.NAME,
                          focus: userNameFocus,
                          nextFocus: passwordFocus,
                        ),
                        16.height,
                        Text('Password', style: secondaryTextStyle()),
                        8.height,
                        fdAppTextField(
                          passwordController,
                          TextFieldType.PASSWORD,
                          focus: passwordFocus,
                        ),
                        16.height,
                        CheckboxListTile(
                          value: rememberCheckBox,
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.all(0),
                          activeColor: FDPrimaryColor,
                          title: Text('Remember me', style: secondaryTextStyle()),
                          onChanged: (value) {
                            setState(() {
                              rememberCheckBox = value;
                            });
                          },
                        ),
                        16.height,
                        fdAppButton(FDSecondaryColor, () {
                          finish(context);
                          FDDashBoardScreen(isFromSignIn: true).launch(context);
                        }, context, 'Sign In'),
                        16.height,
                      ],
                    ),
                  ).paddingAll(16),
                ).paddingSymmetric(horizontal: 16.0),
              ],
            ),
            Positioned(
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ', style: secondaryTextStyle(color: white)),
                  Text('Sign Up', style: secondaryTextStyle(color: FDSecondaryColor)).onTap(() {
                    FDSignUpScreen().launch(context);
                  }),
                ],
              ).withWidth(context.width()),
            ),
          ],
        ).withHeight(context.height()),
      ),
    );
  }
}
