import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHChatMessageComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHConstants.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHChatScreen extends StatefulWidget {
  static String tag = '/RHChatScreen';
  final RHChatModel chatUserData;

  RHChatScreen({this.chatUserData});

  @override
  RHChatScreenState createState() => RHChatScreenState();
}

class RHChatScreenState extends State<RHChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListData = getChatMsgData();
  var personName = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      var msgModel = RHMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = sender_id;
      hideKeyboard(context);
      msgListData.insert(0, msgModel);

      var msgModel1 = RHMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = receiver_id;

      msgController.text = '';

      if (mounted) scrollController?.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListData.insert(0, msgModel1);

      if (mounted) scrollController?.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        elevation: 2,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
            onPressed: () {
              finish(context);
            }),
        title: Text(widget.chatUserData.name, style: boldTextStyle()),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          msgListWidget(),
          textFieldWidget(),
        ],
      ),
    );
  }

  Widget msgListWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      decoration: BoxDecoration(color: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor),
      child: ListView.separated(
        separatorBuilder: (_, i) => Divider(color: Colors.transparent),
        shrinkWrap: true,
        reverse: true,
        controller: scrollController,
        itemCount: msgListData.length,
        padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
        itemBuilder: (_, index) {
          RHMessageModel data = msgListData[index];
          var isMe = data.senderId == sender_id;

          return RHChatMessageComponent(isMe: isMe, data: data);
        },
      ),
    );
  }

  Widget textFieldWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(color: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[300], boxShadow: defaultBoxShadow()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              controller: msgController,
              focus: msgFocusNode,
              autoFocus: true,
              onFieldSubmitted: (s) {
                sendClick();
              },
              decoration: InputDecoration.collapsed(
                hintText: personName.isNotEmpty ? 'Write to ${"test"}' : 'Type a message',
                hintStyle: primaryTextStyle(color: Colors.grey),
              ),
            ).expand(),
            IconButton(
              icon: Icon(Icons.send, size: 24, color: Colors.grey),
              onPressed: () async {
                sendClick();
              },
            ),
          ],
        ),
      ),
    );
  }
}
