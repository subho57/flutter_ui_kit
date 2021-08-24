import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/model/HMModel.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMChatMessageScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class HMInboxScreen extends StatefulWidget {
  static String tag = '/HMInboxScreen';

  @override
  HMInboxScreenState createState() => HMInboxScreenState();
}

class HMInboxScreenState extends State<HMInboxScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: appStore.cardColor,
          elevation: 0,
          title: Text("Inbox", style: boldTextStyle(size: 22)),
          centerTitle: true,
          actions: [IconButton(icon: Icon(Icons.settings, color: HMFontColor400), onPressed: () {})],
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: handymanDataList.length,
            itemBuilder: (context, index) {
              HandymanData data = handymanDataList[index];
              return Container(
                color: appStore.cardColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: commonCacheImageWidget(data.user.avatarUrl, 55, width: 55, fit: BoxFit.cover),
                    ).cornerRadiusWithClipRRect(HMCornerRadius).paddingAll(8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.catName, style: boldTextStyle(size: 16), maxLines: 1),
                        8.height,
                        Row(
                          children: [
                            Text(
                              "I will gonna your home at 12:45 pm on Oct 15 2020",
                              overflow: TextOverflow.ellipsis,
                              style: secondaryTextStyle(),
                            ).expand(),
                            16.width,
                            Text("12 min ago", style: TextStyle(color: HMFontColor400))
                          ],
                        )
                      ],
                    ).paddingOnly(right: 16, top: 8, bottom: 8).expand()
                  ],
                ),
              ).cornerRadiusWithClipRRect(HMCornerRadius).paddingOnly(left: 16, right: 16, top: 16).onTap(
                () {
                  HMChatMessageScreen(handymanData: data).launch(context);
                },
              );
            },
          ).paddingBottom(16),
        ),
      ),
    );
  }
}
