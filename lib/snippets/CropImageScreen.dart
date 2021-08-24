import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class CropImageScreen extends StatefulWidget {
  static String tag = '/CropImageScreen';

  @override
  CropImageScreenState createState() => CropImageScreenState();
}

enum AppState {
  free,
  picked,
  cropped,
}

class CropImageScreenState extends State<CropImageScreen> {
  AppState state;
  File imageFile;
  String title = "Select image";

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    state = AppState.free;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageFile != null
            ? Center(child: Image.file(imageFile, height: 500, width: 300))
            : Center(
                child: Container(
                  alignment: Alignment.center,
                  //  color: Colors.grey[300],
                  color: appStore.cardColor,
                  height: 280,
                  width: context.width(),
                  child: Text("Select image to crop", style: boldTextStyle(size: 16)),
                ),
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AppButton(
            padding: EdgeInsets.only(left: 30, right: 30, top: 16, bottom: 16),
            onTap: () {
              if (state == AppState.free) {
                _pickImage();
                title = "Crop image";
              } else if (state == AppState.picked) {
                _cropImage();
                title = "Clear image";
              } else if (state == AppState.cropped) {
                _clearImage();
                title = "Add image";
              }
            },
            color: appStore.cardColor,
            child: Text(title.validate(), style: boldTextStyle(size: 14)),
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
          ),
        ),
      ],
    ).paddingOnly(bottom: 20, top: 20, left: 16, right: 16);
  }

  Future<Null> _pickImage() async {
    imageFile = File((await ImagePicker().getImage(source: ImageSource.gallery)).path);
    if (imageFile != null) {
      setState(() {
        state = AppState.picked;
      });
    }
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
        toolbarTitle: 'Image Cropper',
        toolbarColor: appPrimaryColor,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
    );
    if (croppedFile != null) {
      imageFile = croppedFile;
      setState(() {
        state = AppState.cropped;
      });
    }
  }

  void _clearImage() {
    imageFile = null;
    setState(() {
      state = AppState.free;
    });
  }
}
