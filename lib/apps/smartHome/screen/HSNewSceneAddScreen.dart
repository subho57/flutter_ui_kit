import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/AddAccessoryScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSNewSceneAddScreen extends StatefulWidget {
  static String tag = '/HSNewSceneAddScreen';

  @override
  HSNewSceneAddScreenState createState() => HSNewSceneAddScreenState();
}

class HSNewSceneAddScreenState extends State<HSNewSceneAddScreen> {
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  final GlobalKey<FormState> addAccessoryFormKey = new GlobalKey<FormState>();

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
            Text("Back", style: boldTextStyle(color: hsColorAccent, size: 16)),
          ],
        ).onTap(() {
          finish(context);
        }),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: addAccessoryFormKey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New Scene", style: boldTextStyle(size: 28)),
                50.height,
                AppTextField(
                  controller: nameController,
                  textFieldType: TextFieldType.NAME,
                  focus: nameFocusNode,
                  textAlign: TextAlign.start,
                  autoFocus: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                    hintStyle: TextStyle(color: textSecondaryColorGlobal),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
                16.height,
                divider(context),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Accessory", style: boldTextStyle(size: 14)),
                    Icon(Icons.navigate_next_outlined, color: Colors.grey),
                  ],
                ).onTap(() {
                  AddAccessoryScreen(deviceName: nameController.text.validate()).launch(context);
                }),
                16.height,
                divider(context),
                120.height,
                AppButton(
                  width: context.width(),
                  onTap: () {
                    if (addAccessoryFormKey.currentState.validate()) {
                      AddAccessoryScreen(deviceName: nameController.text.validate()).launch(context);
                    }
                  },
                  color: hsColorAccent,
                  child: Text("Done", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: HS_colorPrimary)),
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ).paddingOnly(left: 60, right: 60),
              ],
            ).paddingAll(16),
          ),
        ),
      ),
    );
  }
}
