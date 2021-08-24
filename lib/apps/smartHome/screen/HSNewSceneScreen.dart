import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSNewSceneAddScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class HSNewSceneScreen extends StatefulWidget {
  static String tag = '/HSAddSceneScreen';

  @override
  HSNewSceneScreenState createState() => HSNewSceneScreenState();
}

class HSNewSceneScreenState extends State<HSNewSceneScreen> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();

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
    return SafeArea(
      child: Scaffold(
        key: globalScaffoldKey,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16, bottom: 20, right: 16, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Scene", style: boldTextStyle(size: 28)),
              50.height,
              Image.asset(
                HS_kitchen_bg,
                fit: BoxFit.cover,
                width: context.width(),
                height: 210,
              ).cornerRadiusWithClipRRect(defaultRadius),
              40.height,
              Text("Suggested scenes".toUpperCase(), style: boldTextStyle(size: 14)),
              20.height,
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: hsColorOrange),
                    child: Image.asset(HS_morning_icon, height: 24, width: 24, color: HS_colorPrimary),
                  ),
                  16.width,
                  addSceneWidget("Good Morning", "58% Brightness").expand(),
                  Icon(Icons.navigate_next_outlined, color: Colors.grey),
                ],
              ),
              12.height,
              divider(context),
              12.height,
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: Colors.pink),
                    child: Image.asset(HS_home_icon, height: 24, width: 24, color: HS_colorPrimary),
                  ),
                  16.width,
                  addSceneWidget("I'm Home", "58% Brightness").expand(),
                  Icon(Icons.navigate_next_outlined, color: Colors.grey),
                ],
              ),
              12.height,
              divider(context),
              12.height,
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: Colors.deepPurpleAccent),
                    child: Image.asset(HS_setting_icon, height: 24, width: 24, color: HS_colorPrimary),
                  ),
                  16.width,
                  addSceneWidget("I'm Leaving", "58% Brightness").expand(),
                  Icon(Icons.navigate_next_outlined, color: Colors.grey),
                ],
              ),
              12.height,
              divider(context),
              20.height,
              Text("More".toUpperCase(), style: boldTextStyle(size: 14)),
              20.height,
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: hsColorAccent),
                    child: Image.asset(HS_location_icon, height: 24, width: 24, color: HS_colorPrimary),
                  ),
                  16.width,
                  addSceneWidget("Custom", "58% Brightness").expand(),
                  Icon(Icons.navigate_next_outlined, color: Colors.grey),
                ],
              ).onTap(() {
                HSNewSceneAddScreen().launch(context);
              }),
              12.height,
              divider(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget addSceneWidget(String title, String brightness) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: boldTextStyle(size: 14)),
        Text(brightness, style: primaryTextStyle(size: 12, color: Colors.grey)),
      ],
    );
  }
}
