import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class HMChatMessageScreen extends StatefulWidget {
  static String tag = '/HMChatMessageScreen';
  final HandymanData handymanData;

  HMChatMessageScreen({this.handymanData});

  @override
  HMChatMessageScreenState createState() => HMChatMessageScreenState();
}

class HMChatMessageScreenState extends State<HMChatMessageScreen> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            children: [
              Container(
                child: commonCacheImageWidget(widget.handymanData.user.avatarUrl, 40, width: 40, fit: BoxFit.cover),
              ).cornerRadiusWithClipRRect(HMCornerRadius),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.handymanData.catName, style: boldTextStyle(size: 16), overflow: TextOverflow.ellipsis),
                  4.height,
                  Text("Online", style: boldTextStyle(size: 14, color: gray)),
                ],
              ).expand(),
            ],
          ),
          actions: [IconButton(icon: Icon(Icons.call, color: HMFontColor400), onPressed: () {})],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
                reverse: true,
                itemCount: chatModel.length,
                itemBuilder: (context, index) {
                  ChatModel data = chatModel[index];
                  return data.sender.id == currentUser.id
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            color: hmColorPrimary,
                            child: Text("${data.text}", style: boldTextStyle(size: 14, color: HMColorWhite)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                          ).cornerRadiusWithClipRRect(32).paddingOnly(left: 100, top: 4, bottom: 4, right: 4),
                        )
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            color: appStore.cardColor,
                            child: Text("${data.text}", style: boldTextStyle(size: 14)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                          ).cornerRadiusWithClipRRect(32).paddingOnly(right: 100, top: 4, bottom: 4, left: 4),
                        );
                }).paddingBottom(8).expand(),
            Container(
              color: appStore.cardColor,
              child: Row(
                children: [
                  IconButton(icon: Icon(Icons.camera_alt_rounded, size: 32, color: HMFontColor400), onPressed: () {}),
                  IconButton(icon: Icon(Icons.emoji_emotions_outlined, size: 32, color: HMFontColor400), onPressed: () {}),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), border: Border.all(color: HMFontColor400, width: 1)),
                    child: Row(
                      children: [
                        TextField(
                          controller: controller,
                          textInputAction: TextInputAction.send,
                          style: secondaryTextStyle(),
                          onSubmitted: (value) {
                            chatModel.insert(0, ChatModel(sender: currentUser, text: controller.text));
                            Future.delayed(Duration(milliseconds: 1000), () {
                              chatModel.insert(0, ChatModel(sender: selena, text: controller.text));
                              controller.clear();
                              setState(() {});
                            });
                          },
                          decoration: InputDecoration(hintText: "type some thing...", border: InputBorder.none, hintStyle: secondaryTextStyle()),
                        ).paddingLeft(8).expand(),
                        Container(
                          width: 40,
                          height: 40,
                          color: HMFontColor400,
                          child: IconButton(icon: Icon(Icons.keyboard_voice_rounded, color: HMColorWhite), onPressed: () {}).center(),
                        ).cornerRadiusWithClipRRect(64).paddingRight(8)
                      ],
                    ),
                  ).paddingAll(8).expand()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
