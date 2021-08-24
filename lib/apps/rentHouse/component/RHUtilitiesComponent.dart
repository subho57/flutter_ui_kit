import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHUtilitiesComponent extends StatefulWidget {
  @override
  _RHUtilitiesComponentState createState() => _RHUtilitiesComponentState();
}

class _RHUtilitiesComponentState extends State<RHUtilitiesComponent> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  File profileImage;
  List<String> utilitiesList = ['Internet', 'Water', 'Light', 'Parking', 'Tv', 'Air Conditioner', 'Washing', 'Bed'];
  List<String> tags = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorder(
            dashPattern: [10, 10],
            color: Colors.grey[400],
            strokeWidth: 2,
            borderType: BorderType.RRect,
            radius: Radius.circular(12),
            padding: EdgeInsets.all(6),
            child: Container(
              height: 200,
              width: context.width(),
              child: Column(
                children: [
                  profileImage != null
                      ? Image.file(profileImage, width: 140, height: 140, fit: BoxFit.cover)
                      : Image.asset(
                          profileImage != null ? profileImage : RH_photo_gallery_img,
                          width: 140,
                          height: 140,
                          fit: BoxFit.fill,
                        ),
                  8.height,
                  Text("Click here to post images\n from gallery and camera", style: secondaryTextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          30.height,
          AppButton(
            color: appPrimaryColor,
            width: context.width(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, color: white),
                8.width,
                Text('Take a picture', style: boldTextStyle(size: 14, color: white)),
              ],
            ),
            onTap: () {
              dialogWidget(context);
            },
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(24)),
          ),
          16.height,
          Text("Utilities", style: secondaryTextStyle(size: 16)),
          16.height,
          ChipsChoice<String>.multiple(
            spacing: 8,
            padding: EdgeInsets.all(0),
            value: tags,
            onChanged: (val) => setState(() => tags = val),
            choiceActiveStyle: C2ChoiceStyle(
              labelStyle: secondaryTextStyle(size: 14, color: Colors.blueAccent),
              borderShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(color: Colors.blueAccent),
              ),
            ),
            choiceStyle: C2ChoiceStyle(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.only(left: 20, right: 20),
              showCheckmark: false,
              borderShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(color: Colors.grey[200]),
              ),
              labelStyle: secondaryTextStyle(size: 14, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
            ),
            choiceItems: C2Choice.listFrom<String, String>(
              source: utilitiesList,
              value: (i, v) => v,
              label: (i, v) => v,
            ),
            wrapped: true,
          ),
        ],
      ),
    );
  }

  dialogWidget(dialogContext) {
    return showDialog(
      barrierDismissible: true,
      context: dialogContext,
      builder: (context) {
        return AlertDialog(
          title: Text('Set profile photo', style: primaryTextStyle(color: black, size: 20, weight: FontWeight.bold), textAlign: TextAlign.start),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Take photo', style: primaryTextStyle(size: 16, color: black)).onTap(() {
                pickFromCamera();
                finish(context);
              }),
              20.height,
              Text('Choose photo', style: primaryTextStyle(size: 16, color: black)).onTap(() {
                pickFromGallery();
                finish(context);
              }),
            ],
          ),
        );
      },
    );
  }

  pickFromCamera() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 50)).path);
    setState(() {
      profileImage = image;
    });
  }

  pickFromGallery() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 50)).path);

    setState(() {
      profileImage = image;
    });
  }
}
