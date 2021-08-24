import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSUserDetailsScreen extends StatefulWidget {
  static String tag = '/HSUserDetailsScreen';
  final HSUserProfileModel userData;

  HSUserDetailsScreen({this.userData});

  @override
  HSUserDetailsScreenState createState() => HSUserDetailsScreenState();
}

class HSUserDetailsScreenState extends State<HSUserDetailsScreen> {
  bool mRemoteAccess = true;
  bool mAllowEditing = true;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: appStore.cardColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
        title: Row(
          children: [
            Icon(Icons.arrow_back_ios_outlined),
            8.width,
            Text("Back", style: boldTextStyle(color: hsColorAccent, size: 16)).expand(),
            Text("User", style: boldTextStyle(size: 16)).expand(),
            IconButton(icon: Icon(Icons.add, color: hsColorAccent), onPressed: () {})
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: CircleAvatar(radius: 50, backgroundImage: AssetImage(widget.userData.image != null ? widget.userData.image : HS_user1))),
            10.height,
            Text(widget.userData.name, style: boldTextStyle(size: 16)).center(),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                circleIcon(Icons.phone, "Phone"),
                20.width,
                circleIcon(Icons.mail, "Message"),
                20.width,
                circleIcon(Icons.camera, "Camera"),
                20.width,
                circleIcon(Icons.star, "Send"),
              ],
            ),
            10.height,
            divider(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Setting", style: boldTextStyle(size: 14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Allow Remote Access", style: boldTextStyle(size: 14, color: hsColorAccent)),
                    CupertinoSwitch(
                      value: mRemoteAccess,
                      trackColor: gray,
                      onChanged: (bool value) {
                        setState(() {
                          mRemoteAccess = value;
                        });
                      },
                    ).onTap(() {
                      setState(() {
                        mRemoteAccess = !mRemoteAccess;
                      });
                    }),
                  ],
                )
              ],
            ).paddingOnly(right: 16, left: 16, top: 20),
            10.height,
            divider(context),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Allow Editing", style: boldTextStyle(size: 14, color: hsColorAccent)),
                CupertinoSwitch(
                  value: mAllowEditing,
                  trackColor: gray,
                  onChanged: (bool value) {
                    setState(() {
                      mAllowEditing = value;
                    });
                  },
                ).onTap(() {
                  setState(() {
                    mAllowEditing = !mAllowEditing;
                  });
                }),
              ],
            ).paddingOnly(right: 16, left: 16),
            10.height,
            divider(context),
            24.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Remove", style: boldTextStyle(size: 14)),
                30.height,
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: radius(10), backgroundColor: Colors.pink),
                      child: Image.asset(HS_home_icon, color: HS_colorPrimary, height: 10, width: 10),
                    ),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Remove Person", style: boldTextStyle(size: 14, color: hsColorAccent)),
                        Text(widget.userData.name, style: primaryTextStyle(size: 12, color: Colors.grey)),
                      ],
                    ).expand(),
                    Icon(Icons.navigate_next_outlined, color: Colors.grey),
                  ],
                ),
                20.height,
                divider(context),
              ],
            ).paddingOnly(right: 16, left: 16),
          ],
        ).paddingTop(40),
      ),
    );
  }

  Widget circleIcon(IconData icon, String title) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(shape: BoxShape.circle, color: hsColorAccent),
          child: Icon(icon, size: 24),
        ),
        4.height,
        Text(title, style: primaryTextStyle(size: 12, color: hsColorAccent))
      ],
    );
  }
}
