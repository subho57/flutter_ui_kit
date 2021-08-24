import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHChatScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHInboxScreen extends StatefulWidget {
  static String tag = '/RHInboxScreen';

  @override
  RHInboxScreenState createState() => RHInboxScreenState();
}

class RHInboxScreenState extends State<RHInboxScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<RHChatModel> chatUserList = getChatData();

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
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.grey),
            onPressed: () {
              finish(context);
            }),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Inbox", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 40),
          itemCount: chatUserList.length,
          itemBuilder: (context, index) {
            RHChatModel mData = chatUserList[index];
            return GestureDetector(
              child: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: boxDecorationWithRoundedCorners(borderRadius: radius(12), boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                child: Row(
                  children: [
                    CircleAvatar(radius: 30, backgroundImage: AssetImage(mData.img)),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(mData.name, style: boldTextStyle(size: 14)),
                            Text(DateFormat('d EEE, MMM').format(DateTime.now()), style: primaryTextStyle(size: 12)).fit(),
                          ],
                        ),
                        8.height,
                        Text(mData.lastMsg, style: secondaryTextStyle()),
                      ],
                    ).expand()
                  ],
                ),
              ),
              onTap: () {
                RHChatScreen(chatUserData: mData).launch(context);
              },
            );
          },
        ),
      ),
    );
  }
}
