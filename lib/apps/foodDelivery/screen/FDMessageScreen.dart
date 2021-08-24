import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDMessageScreen extends StatefulWidget {
  static String tag = '/FDMessageScreen';
  final bool isFromCall;

  FDMessageScreen({this.isFromCall = false});

  @override
  FDMessageScreenState createState() => FDMessageScreenState();
}

class FDMessageScreenState extends State<FDMessageScreen> {
  TextEditingController messageController = TextEditingController();

  DateFormat formatter = DateFormat('hh:mm a');

  List<FDChatModel> chatDetails = fdGetChatDetais();

  String message;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    if (widget.isFromCall) {
      setStatusBarColor(FDPrimaryColor, statusBarIconBrightness: Brightness.light);
    } else {
      setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(title: 'Messages', context: context, elevation: 0),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 60),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            reverse: true,
            itemCount: chatDetails.length,
            itemBuilder: (context, index) {
              FDChatModel mData = chatDetails[index];
              return mData.sender.id == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        mData.image != null
                            ? Container(
                                child: Column(
                                  children: [
                                    Image.asset(mData.image),
                                    Text(mData.name, style: boldTextStyle(size: 20)),
                                    Text('\$${mData.price}', style: boldTextStyle()),
                                  ],
                                ),
                                padding: EdgeInsets.all(16),
                                color: FDSecondaryColor,
                              ).cornerRadiusWithClipRRect(8)
                            : SizedBox(),
                        4.height,
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                          color: grey.withOpacity(0.1),
                          child: Text("${mData.text}", style: boldTextStyle(size: 14)),
                        ).cornerRadiusWithClipRRect(8),
                        4.height,
                        Text('${mData.time}', style: secondaryTextStyle()),
                      ],
                    ).paddingOnly(right: 100, top: 4, bottom: 4)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                          color: FDSelectedTextColor,
                          child: Text("${mData.text}", style: boldTextStyle(size: 14, color: white)),
                        ).cornerRadiusWithClipRRect(8),
                        4.height,
                        Text('${mData.time}', style: secondaryTextStyle()),
                      ],
                    ).paddingOnly(left: 100, top: 4, bottom: 4);
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: AppTextField(
                controller: messageController,
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  hintStyle: secondaryTextStyle(),
                  prefixIcon: Icon(Icons.camera_alt_rounded, color: grey.withOpacity(0.1)).onTap(() {}),
                  suffixIcon: Icon(Icons.send, color: FDSelectedTextColor).onTap(() {
                    if (messageController.text.isNotEmpty) {
                      chatDetails.insert(
                        0,
                        FDChatModel(sender: customer, text: messageController.text, time: formatter.format(DateTime.now())),
                      );
                    }
                    messageController.clear();
                    setState(() {});
                  }),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
              decoration: boxDecorationWithShadow(),
            ),
          ),
        ],
      ).withHeight(context.height()),
    );
  }
}
