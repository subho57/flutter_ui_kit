import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSUserProfileScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSAddUserScreen extends StatefulWidget {
  static String tag = '/HSAddUserScreen';

  @override
  HSAddUserScreenState createState() => HSAddUserScreenState();
}

class HSAddUserScreenState extends State<HSAddUserScreen> {
  TextEditingController nameController = TextEditingController();
  File profileImage;
  String setProfileImg;
  List<HSUserProfileModel> userProfileData;
  final GlobalKey<FormState> profileFormKey = new GlobalKey<FormState>();
  FocusNode nameFocusNode = FocusNode();

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appStore.cardColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
          onPressed: () {
            HSUserProfileScreen().launch(context);
          },
        ),
      ),
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: Form(
            key: profileFormKey,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 60, bottom: 30),
              height: context.height(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      profileImage != null
                          ? ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.file(profileImage, width: 100, height: 100, fit: BoxFit.fill))
                          : CircleAvatar(radius: 50, backgroundImage: AssetImage(profileImage != null ? profileImage : HS_user1)),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.isDarkModeOn ? HS_colorPrimary : Colors.black),
                          child: Center(child: Icon(Icons.edit_outlined, color: appStore.isDarkModeOn ? Hs_color_grey_background : Colors.white, size: 18)),
                        ),
                      )
                    ],
                  ).onTap(() {
                    dialogWidget(context);
                  }),
                  50.height,
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : HS_colorPrimary,
                      boxShadow: appStore.isDarkModeOn ? [] : defaultBoxShadow(),
                    ),
                    child: AppTextField(
                      controller: nameController,
                      textFieldType: TextFieldType.NAME,
                      focus: nameFocusNode,
                      textAlign: TextAlign.start,
                      textStyle: secondaryTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixStyle: TextStyle(color: Colors.white),
                        hintText: "Name",
                        hintStyle: secondaryTextStyle(),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  120.height,
                  AppButton(
                    width: context.width(),
                    onTap: () {
                      if (profileFormKey.currentState.validate()) {
                        appStore.hsAddProfileItems(HSUserProfileModel(image: setProfileImg != null ? setProfileImg : HS_user1, name: nameController.text.validate()));
                        finish(context);
                      }
                    },
                    color: hsColorAccent,
                    child: Text("Save", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ).paddingOnly(left: 60, right: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  dialogWidget(dialogContext) {
    return showDialog(
      barrierDismissible: true,
      context: dialogContext,
      builder: (context) {
        return AlertDialog(
          title: Text('Set profile photo', style: boldTextStyle(size: 20), textAlign: TextAlign.start),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Take photo', style: primaryTextStyle(size: 16)).onTap(() {
                pickFromCamera();
                finish(context);
              }),
              20.height,
              Text('Choose photo', style: primaryTextStyle(size: 16)).onTap(() {
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
      setProfileImg = profileImage.path;
    });
  }

  pickFromGallery() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 50)).path);
    setState(() {
      profileImage = image;
      setProfileImg = profileImage.path;
    });
  }
}
