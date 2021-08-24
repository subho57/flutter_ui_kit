import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/meelaApp/models/MBModel.dart';
import 'package:mighty_ui_kit/apps/meelaApp/utils/MBDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MBAccountAnalyticsScreen extends StatefulWidget {
  @override
  MBAccountAnalyticsScreenState createState() => MBAccountAnalyticsScreenState();
}

class DataSet {
  DateTime time;
  int number;

  DataSet(this.time, this.number);
}

class MBAccountAnalyticsScreenState extends State<MBAccountAnalyticsScreen> {
  List<BudgetDetails> transactionHistoryList = getTransactionHistoryList();

  final List<Color> gradientColors = [
    const Color(0xFF23b6e6),
    const Color(0xFF02d39a),
  ];

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.width(),
              padding: EdgeInsets.only(top: 16),
              decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Interactivities', style: boldTextStyle(color: appPrimaryColor)).paddingOnly(left: 16),
                  4.height,
                  Text('Summit Bank of city Halt', style: secondaryTextStyle()).paddingOnly(left: 16),
                  16.height,
                  Container(
                    width: context.width(),
                    padding: EdgeInsets.only(right: 20),
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 15,
                        minY: 0,
                        maxY: 5,
                        gridData: FlGridData(
                            show: false,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (a) {
                              return FlLine(color: appPrimaryColor);
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(color: appPrimaryColor);
                            }),
                        borderData: FlBorderData(show: false, border: Border.all(color: const Color(0xff37434d), width: 1)),
                        lineBarsData: [
                          LineChartBarData(
                            spots: [
                              FlSpot(0, 3),
                              FlSpot(2.6, 2),
                              FlSpot(4.9, 5),
                              FlSpot(6.8, 2.5),
                              FlSpot(8, 4),
                              FlSpot(9.5, 3),
                              FlSpot(11, 4),
                              FlSpot(12, 1),
                              FlSpot(13.4, 4.5),
                              FlSpot(14.2, 3),
                              FlSpot(14.9, 0),
                            ],
                            isCurved: false,
                            colors: gradientColors,
                            barWidth: 4,
                            dotData: FlDotData(show: false),
                            belowBarData: BarAreaData(show: true, colors: gradientColors.map((color) => color.withOpacity(0.3)).toList()),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            24.height,
            Text('Account Analytics', style: boldTextStyle(size: 24)),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction History', style: boldTextStyle()),
                Text('View More', style: boldTextStyle(color: appPrimaryColor)),
              ],
            ),
            16.height,
            ListView.builder(
                itemCount: transactionHistoryList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 8),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  BudgetDetails data = transactionHistoryList[index];
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                    child: Row(
                      children: [
                        Image.asset(data.img, height: 50, width: 50, fit: BoxFit.cover, color: appStore.isDarkModeOn ? appBarBackgroundColor : black),
                        16.width,
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(data.budgetType, style: boldTextStyle(color: appPrimaryColor)),
                          8.height,
                          Row(
                            children: [
                              Text(data.date, style: secondaryTextStyle()),
                              8.width,
                              Text(data.progressPercentage, style: secondaryTextStyle()),
                            ],
                          ),
                        ]).expand(),
                        Text(data.totalCost, style: boldTextStyle(size: 14)),
                      ],
                    ),
                  );
                }),
          ],
        ).paddingAll(16),
      )),
    );
  }
}
