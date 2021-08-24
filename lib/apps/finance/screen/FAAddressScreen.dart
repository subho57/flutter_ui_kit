import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FACreatePasswordScreen.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAConstants.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FAAddressScreen extends StatefulWidget {
  static String tag = '/FAAddressScreen';

  @override
  FAAddressScreenState createState() => FAAddressScreenState();
}

class FAAddressScreenState extends State<FAAddressScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var streetAddressController = TextEditingController();
  var streetNumberController = TextEditingController();

  var streetAddressNode = FocusNode();
  var streetNumberNode = FocusNode();

  bool isAddress = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : fa_color_background);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: context.height() * 0.5,
            child: Image.asset(
              fa_google_map_image,
              fit: BoxFit.fill,
              height: context.height() * 0.5,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: context.height() - 50,
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radiusOnly(topRight: 18, topLeft: 18),
                backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : fa_color_background,
              ),
              margin: EdgeInsets.only(top: context.height() * 0.45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Address Details', style: boldTextStyle(size: 24)),
                  8.height,
                  Text(fa_address_details, style: secondaryTextStyle()),
                  30.height,
                  AppTextField(
                    controller: streetAddressController,
                    textFieldType: TextFieldType.NAME,
                    decoration: faAddressInputDecoration(hint: "Street Address"),
                    keyboardType: TextInputType.multiline,
                    autoFocus: false,
                    focus: streetAddressNode,
                    nextFocus: streetNumberNode,
                    maxLength: 200,
                    maxLines: 2,
                  ),
                  16.height,
                  AppTextField(
                    controller: streetNumberController,
                    textFieldType: TextFieldType.OTHER,
                    decoration: faAddressInputDecoration(hint: "Street / Apt number"),
                    keyboardType: TextInputType.text,
                    autoFocus: false,
                    focus: streetNumberNode,
                  ),
                  24.height,
                  AppButton(
                    width: context.width(),
                    child: Text("Continue", style: boldTextStyle(color: white)),
                    color: fa_color_secondary,
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    onTap: () {
                      FACreatePasswordScreen().launch(context);
                    },
                  ).paddingOnly(left: 16, right: 16, bottom: 16)
                ],
              ).paddingAll(16),
            ),
          ),
          Container(
            height: context.height() * 0.2,
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(top: 30, left: 16),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ).onTap(() {
            finish(context);
          }),
        ],
      ),
    );
  }
}
