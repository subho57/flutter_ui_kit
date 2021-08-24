import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FADataProvider.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FABillsMonthComponent extends StatefulWidget {
  static String tag = '/FABillsMonthComponent';

  @override
  FABillsMonthComponentState createState() => FABillsMonthComponentState();
}

class FABillsMonthComponentState extends State<FABillsMonthComponent> {
  List<FASalesData> data = [
    FASalesData('Jan', 35),
    FASalesData('Feb', 28),
    FASalesData('Mar', 34),
    FASalesData('Apr', 32),
    FASalesData('May', 40),
  ];

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
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('This month', style: boldTextStyle(size: 18)),
        ),
        8.width,
        Align(
          alignment: Alignment.topLeft,
          child: Text("You've spent \$6.2 more than last month", style: secondaryTextStyle()),
        ),
        SfPyramidChart(
          onTooltipRender: (TooltipArgs args) {
            List<String> data;
            String text;
            text = args.dataPoints[args.pointIndex.toInt()].y.toString();
            if (text.contains('.')) {
              data = text.split('.');
              final String newTe = data[0].toString() + ' years ' + data[1].toString() + ' months';
              args.text = newTe;
            } else {
              args.text = text + ' years';
            }
          },
          smartLabelMode: SmartLabelMode.none,
          legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: getPyramidSeries(),
        )
      ],
    ).paddingOnly(left: 16, right: 16);
  }
}
