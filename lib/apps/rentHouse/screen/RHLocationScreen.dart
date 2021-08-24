import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHLocationScreen extends StatefulWidget {
  static String tag = '/RHLocationScreen';

  @override
  RHLocationScreenState createState() => RHLocationScreenState();
}

class RHLocationScreenState extends State<RHLocationScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var searchAreaController = TextEditingController();
  FocusNode searchNode = FocusNode();

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          onPressed: () {
            finish(context);
          },
        ),
        centerTitle: true,
        title: Text("Find around here", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 6, bottom: 6, left: 16, right: 16),
              decoration: boxDecorationWithRoundedCorners(borderRadius: radius(26), backgroundColor: Colors.grey[100]),
              child: AppTextField(
                controller: searchAreaController,
                textFieldType: TextFieldType.EMAIL,
                focus: searchNode,
                autoFocus: false,
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter the school name, work address",
                  prefixIcon: Icon(Icons.location_on, color: Colors.grey),
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            30.height,
            Image.asset(RH_location_user_img, width: context.width(), height: 300, fit: BoxFit.cover),
            30.height,
            Text(
              "RENT HOUSE finds the accommodation that is most convenient for you by evening your work and study address.",
              style: secondaryTextStyle(size: 16),
              textAlign: TextAlign.center,
            ),
            30.height,
            Text("Use current location", style: primaryTextStyle(decoration: TextDecoration.underline, color: appPrimaryColor)).onTap(() {
              toast("click here");
            }),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
