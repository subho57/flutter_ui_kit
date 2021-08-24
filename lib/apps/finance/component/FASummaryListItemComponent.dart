import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

// ignore: must_be_immutable
class FASummaryListItemComponent extends StatefulWidget {
  static String tag = '/FASummaryListItemComponent';
  final FASummaryModel summaryData;
  int index = 0;

  FASummaryListItemComponent({this.summaryData, this.index});

  @override
  FASummaryListItemComponentState createState() => FASummaryListItemComponentState();
}

class FASummaryListItemComponentState extends State<FASummaryListItemComponent> {
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
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 175,
      decoration: boxDecorationRoundedWithShadow(
        8,
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: (widget.index % 2 == 0) ? fa_color_green : fa_color_primary,
              borderRadius: radius(30),
            ),
            padding: EdgeInsets.all(8),
            child: Image.asset(
              widget.summaryData.image,
              height: 40,
              width: 40,
              fit: BoxFit.fill,
              color: Colors.white,
            ),
          ),
          8.height,
          Text(widget.summaryData.name, style: boldTextStyle()),
          8.height,
          Text('SPENT', style: secondaryTextStyle(size: 12)),
          createRichText(
            list: [
              TextSpan(text: widget.summaryData.discountAmount, style: boldTextStyle(size: 18)),
              TextSpan(text: " out of ${widget.summaryData.originalAmount}", style: secondaryTextStyle()),
            ],
          ),
          16.height,
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: LinearProgressIndicator(
              value: 0.5,
              minHeight: 10,
              valueColor: AlwaysStoppedAnimation<Color>((widget.index % 2 == 0) ? fa_color_green : fa_color_primary),
              backgroundColor: Colors.grey[200],
            ),
          )
        ],
      ),
    ).onTap(() {});
  }
}
