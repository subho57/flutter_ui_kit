import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eGarden/utils/EGColors.dart';
import 'package:mighty_ui_kit/apps/rentHouse/model/RHModel.dart';
import 'package:mighty_ui_kit/apps/rentHouse/utils/RHWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class RHChatMessageComponent extends StatelessWidget {
  const RHChatMessageComponent({
    Key key,
    @required this.isMe,
    @required this.data,
  }) : super(key: key);

  final bool isMe;
  final RHMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          margin: isMe.validate()
              ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (dynamicWidth(context) * 0.25).toDouble())
              : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (dynamicWidth(context) * 0.25).toDouble()),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: !isMe
                  ? [white, white]
                  : [
                      getColorFromHex('#4C76EA'),
                      getColorFromHex('#4C76EA'),
                    ],
            ),
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate() ? BorderRadius.all(Radius.circular(10)) : BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: isMe ? Colors.grey : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Flexible(child: Text(data.msg, style: primaryTextStyle(color: isMe ? white : greyColor))), Text(data.time, style: secondaryTextStyle(color: isMe ? white : Colors.grey, size: 12))],
          ),
        ),
      ],
    );
  }
}
