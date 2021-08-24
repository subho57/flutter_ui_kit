import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSAddUserScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSSettingRoomScreen..dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSUserDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSUserProfileScreen extends StatefulWidget {
  static String tag = '/HSUserProfileScreen';
  final String image;

  HSUserProfileScreen({this.image});

  @override
  HSUserProfileScreenState createState() => HSUserProfileScreenState();
}

class HSUserProfileScreenState extends State<HSUserProfileScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    print(widget.image);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (_) => ListView(
            padding: EdgeInsets.only(top: 16, bottom: 20, right: 16, left: 16),
            children: [
              Text("My HOME", style: boldTextStyle(size: 28)),
              16.height,
              Text("People", style: boldTextStyle(size: 14)),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: appPrimaryColor, shape: BoxShape.circle),
                    child: Icon(Icons.add, color: white),
                  ).onTap(() {
                    HSAddUserScreen().launch(context);
                  }),
                  8.width,
                  SizedBox(
                    height: 110,
                    width: context.width(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: appStore.hsUserProfileList.length,
                      itemBuilder: (context, index) {
                        HSUserProfileModel mData = appStore.hsUserProfileList[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(radius: 36, backgroundImage: AssetImage(mData.image.validate())),
                            10.height,
                            Text(mData.name.validate(), style: primaryTextStyle(size: 12, color: hsColorAccent)),
                          ],
                        ).paddingOnly(left: 8, right: 8).onTap(() {
                          HSUserDetailsScreen(userData: mData).launch(context);
                        });
                      },
                    ),
                  ).expand(),
                ],
              ).paddingOnly(left: 8, right: 8),
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Speaker", style: secondaryTextStyle(size: 14)),
                  24.height,
                  settingOption("Allow Remote Access"),
                  10.height,
                  divider(context),
                  24.height,
                  settingOption("Allow Editing"),
                  10.height,
                  divider(context),
                  30.height,
                  Text("WallPaper", style: secondaryTextStyle(size: 14)),
                  24.height,
                  settingOption("Choose photo"),
                  10.height,
                  divider(context),
                  30.height,
                  Text("Remove", style: secondaryTextStyle(size: 14)),
                  24.height,
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8),
                        decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: hsColorAccent),
                        child: Icon(Icons.location_on_outlined, color: Colors.white),
                      ),
                      10.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Remove Person", style: boldTextStyle(size: 14, color: hsColorAccent)),
                          Text("John Smith", style: primaryTextStyle(size: 12, color: Colors.grey)),
                        ],
                      ).expand(),
                      Icon(Icons.navigate_next_outlined, color: Colors.grey),
                    ],
                  ),
                  10.height,
                  divider(context),
                  30.height,
                  settingOption("Setting Room").onTap(() {
                    HSSettingRoomScreen().launch(context);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget settingOption(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: boldTextStyle(size: 14, color: hsColorAccent)),
        Icon(Icons.navigate_next_outlined, color: Colors.grey),
      ],
    );
  }
}
