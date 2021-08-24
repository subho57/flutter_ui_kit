import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/model/FAModel.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FADataProvider.dart';

import 'FASummaryListItemComponent.dart';

class FASummaryComponent extends StatefulWidget {
  static String tag = '/FASummaryComponent';

  @override
  FASummaryComponentState createState() => FASummaryComponentState();
}

class FASummaryComponentState extends State<FASummaryComponent> with SingleTickerProviderStateMixin {
  List<FASummaryModel> summaryList = getSummaryList();

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
      height: 240,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 8, bottom: 16, top: 16, right: 8),
        itemCount: summaryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          FASummaryModel mData = summaryList[index];
          return FASummaryListItemComponent(summaryData: mData, index: index);
        },
      ),
    );
  }
}
