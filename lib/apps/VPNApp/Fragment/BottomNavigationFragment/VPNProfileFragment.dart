import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNColors.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNConstant.dart';
import 'package:mighty_ui_kit/apps/VPNApp/utils/VPNWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class VPNProfileFragment extends StatefulWidget {
  static String tag = '/VPNProfileFragment';

  @override
  VPNProfileFragmentState createState() => VPNProfileFragmentState();
}

class VPNProfileFragmentState extends State<VPNProfileFragment> {
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
    return SafeArea(
      child: Scaffold(
          backgroundColor: vpnBackgroundColor,
          body: SingleChildScrollView(
            child: Column(children: [
              Text("Profile", style: boldTextStyle(color: commonColorWhite, size: 26)).center().paddingAll(16),
              CircleAvatar(
                backgroundColor: appPrimaryColor,
                child: Icon(Icons.person, color: commonColorWhite, size: iconSize),
                radius: 60,
              ).onTap(() async {
                final pickImage = await ImagePicker().getImage(source: ImageSource.gallery);
                if (pickImage != null) {
                  //
                } else {
                  log("No image");
                }
              }),
              16.height,
              commonDataList(title: "Account", data: Text("Basic", style: TextStyle(color: commonColorWhite, fontSize: textSize))),
              AppButton(
                width: context.width(),
                height: 50,
                color: appPrimaryColor,
                child: Text("Upgrade", style: boldTextStyle(color: commonColorWhite), textAlign: TextAlign.center),
                onTap: () {
                  //
                },
              ).paddingOnly(left: 16, right: 16, bottom: 8, top: 8),
              commonDataList(title: "Your IP Address", data: Text("00.123.456.789", style: TextStyle(color: commonColorWhite, fontSize: textSize))),
              commonDataList(title: "Your Device", data: Text("1/1", style: TextStyle(color: commonColorWhite, fontSize: textSize))),
              commonDataList(title: "Band Width", data: Text("1000 Mbps", style: TextStyle(color: commonColorWhite, fontSize: textSize))),
            ]),
          )),
    );
  }
}
