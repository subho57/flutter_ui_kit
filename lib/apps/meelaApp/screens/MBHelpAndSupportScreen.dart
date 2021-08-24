import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBConts.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBHelpAndSupportScreen extends StatefulWidget {
  final String name;

  MBHelpAndSupportScreen({this.name});

  @override
  MBHelpAndSupportScreenState createState() => MBHelpAndSupportScreenState();
}

class MBHelpAndSupportScreenState extends State<MBHelpAndSupportScreen> {
  ScrollController scrollController = ScrollController();

  TextEditingController msgController = TextEditingController();

  FocusNode msgFocusNode = FocusNode();

  var msgListing = getChatMsgData();
  var personName = '';

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

  sendClick() async {
    DateFormat formatter = DateFormat('hh:mm a');

    if (msgController.text.trim().isNotEmpty) {
      var msgModel = BHMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.time = formatter.format(DateTime.now());
      msgModel.senderId = BHSender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = BHMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.time = formatter.format(DateTime.now());
      msgModel1.senderId = BHReceiver_id;

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: appPrimaryColor, size: 20),
          onPressed: () {
            finish(context);
          },
        ),
        title: Text(widget.name, style: boldTextStyle(size: 16)),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.call, size: 20, color: appPrimaryColor), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
            decoration: BoxDecoration(color: white),
            child: ListView.separated(
              separatorBuilder: (_, i) => Divider(color: Colors.transparent),
              shrinkWrap: true,
              reverse: true,
              controller: scrollController,
              itemCount: msgListing.length,
              padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
              itemBuilder: (_, index) {
                BHMessageModel data = msgListing[index];
                var isMe = data.senderId == BHSender_id;

                return ChatMessageWidget(isMe: isMe, data: data);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(color: gray.withOpacity(0.5), offset: Offset(0.0, 1.0), blurRadius: 2.0),
                    ],
                  ),
                  child: AppTextField(
                    textFieldType: TextFieldType.OTHER,
                    controller: msgController,
                    autoFocus: true,
                    nextFocus: msgFocusNode,
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration.collapsed(
                      hintText: personName.isNotEmpty ? 'Write to ${widget.name}' : 'Type a something...',
                      hintStyle: primaryTextStyle(color: gray),
                    ),
                    textStyle: primaryTextStyle(color: gray),
                    onFieldSubmitted: (s) {
                      sendClick();
                    },
                  ),
                ).expand(),
                16.width,
                Container(
                  decoration: boxDecorationWithShadow(
                    boxShape: BoxShape.circle,
                    backgroundColor: appPrimaryColor,
                    boxShadow: [BoxShadow(color: appPrimaryColor.withOpacity(0.5), offset: Offset(0.0, 1.0), blurRadius: 2.0, spreadRadius: 4)],
                  ),
                  child: IconButton(
                    onPressed: () {
                      sendClick();
                    },
                    icon: Icon(Icons.send, size: 20, color: white),
                  ),
                ),
              ],
            ).paddingAll(16),
          ),
        ],
      ),
    );
  }
}
