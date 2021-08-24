import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/rentHouse/component/RHChatMessageComponent.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHConstants.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHDataProvider.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class RHMessageComponent extends StatefulWidget {
  static String tag = '/RHMessageComponent';

  @override
  RHMessageComponentState createState() => RHMessageComponentState();
}

class RHMessageComponentState extends State<RHMessageComponent> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = 'John';

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
      msgListing.insert(0, msgModel);

      var msgModel1 = RHMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = receiver_id;

      msgController.text = '';

      if (mounted) scrollController?.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

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
    Widget msgList() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(color: appPrimaryColor),
        child: ListView.separated(
          separatorBuilder: (_, i) => Divider(color: Colors.transparent),
          shrinkWrap: true,
          reverse: true,
          controller: scrollController,
          itemCount: msgListing.length,
          padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
          itemBuilder: (_, index) {
            RHMessageModel data = msgListing[index];
            var isMe = data.senderId == sender_id;

            return RHChatMessageComponent(isMe: isMe, data: data);
          },
        ),
      );
    }

    Widget textField() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          decoration: BoxDecoration(color: Colors.red, boxShadow: defaultBoxShadow()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: msgController,
                focusNode: msgFocusNode,
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration.collapsed(hintText: personName.isNotEmpty ? 'Write to $personName' : 'Type a message', hintStyle: primaryTextStyle()),
                style: primaryTextStyle(),
                onSubmitted: (s) {
                  sendClick();
                },
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_outlined), onPressed: () {}),
        title: Text("", style: boldTextStyle(color: black)),
        centerTitle: true,
      ),
      body: Stack(
        children: [msgList(), textField()],
      ),
    );
  }
}
