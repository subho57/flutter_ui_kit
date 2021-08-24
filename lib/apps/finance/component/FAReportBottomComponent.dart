import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class FAReportBottomComponent extends StatefulWidget {
  static String tag = '/FAReportBottomComponent';

  @override
  FAReportBottomComponentState createState() => FAReportBottomComponentState();
}

class FAReportBottomComponentState extends State<FAReportBottomComponent> {
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
      children: [
        Text('Expenses Trend', style: boldTextStyle(size: 20)).paddingLeft(16),
        4.height,
        Row(
          children: [
            Text('1 April 2021 - ', style: secondaryTextStyle()),
            Text('30 April 2021', style: secondaryTextStyle()),
          ],
        ).paddingLeft(16),
        8.height,
        SfSparkLineChart.custom(
          trackball: SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
          marker: SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
          labelDisplayMode: SparkChartLabelDisplayMode.all,
          xValueMapper: (int index) => data[index].year,
          yValueMapper: (int index) => data[index].sales,
          dataCount: 5,
        ).paddingOnly(left: 16, right: 16)
      ],
    ).paddingBottom(30);
  }
}
