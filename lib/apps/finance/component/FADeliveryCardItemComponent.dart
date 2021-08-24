import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class FADeliveryCardItemComponent extends StatefulWidget {
  static String tag = '/FADeliveryCardItemComponent';

  FADeliveryCardModel deliveryCard;
  int index;
  int currentIndex;

  FADeliveryCardItemComponent({this.deliveryCard, this.index, this.currentIndex});

  @override
  FADeliveryCardItemComponentState createState() => FADeliveryCardItemComponentState();
}

class FADeliveryCardItemComponentState extends State<FADeliveryCardItemComponent> {
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 800),
      alignment: Alignment.center,
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: widget.index == widget.currentIndex
            ? appStore.isDarkModeOn
                ? scaffoldSecondaryDark
                : Colors.white
            : fa_color_secondary.withOpacity(0.3),
        borderRadius: radius(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.deliveryCard.title, style: primaryTextStyle()).expand(),
          8.height,
          Text(widget.deliveryCard.price, style: boldTextStyle(size: 24)).expand(),
          30.height,
          Text(widget.deliveryCard.estimateTime, style: secondaryTextStyle()).expand(),
          8.height,
          Text(DateFormat('EEEE - MMM dd, yyyy').format(DateTime.now()), style: boldTextStyle(size: 14)).expand(),
        ],
      ),
    );
  }
}
