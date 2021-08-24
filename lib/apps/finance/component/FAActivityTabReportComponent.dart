import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'FAReportBottomComponent.dart';
import 'FAReportCardComponent.dart';

class FAActivityTabReportComponent extends StatefulWidget {
  static String tag = '/FAActivityTabReportComponent';

  @override
  FAActivityTabReportComponentState createState() => FAActivityTabReportComponentState();
}

class FAActivityTabReportComponentState extends State<FAActivityTabReportComponent> {
  String selectedDays = 'Monthly';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedDays,
            dropdownColor: Colors.grey[600],
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            items: <String>['Monthly', 'Weekly', 'Daily'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: primaryTextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedDays = newValue;
              });
            },
          ),
        ).paddingLeft(16),
        8.height,
        Container(
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            backgroundColor: fa_color_secondary.withOpacity(0.2),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              faNextCircleWidget(),
              4.width,
              Column(
                children: [
                  Text(DateFormat('MMMM').format(DateTime.now()), style: boldTextStyle(color: Colors.white)),
                  4.height,
                  Row(
                    children: [
                      Text('1 April 2021 - ', style: secondaryTextStyle(color: Colors.white)),
                      Text('30 April 2021', style: secondaryTextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              4.width,
              faNextCircleWidget(),
            ],
          ),
        ).paddingOnly(left: 16, right: 16),
        16.height,
        FAReportCardComponent(),
        16.height,
        FAReportBottomComponent()
      ],
    );
  }
}
