import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/handyman/component/HMTaskComponent.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HMTaskScreen extends StatefulWidget {
  static String tag = '/HMTaskScreen';

  @override
  HMTaskScreenState createState() => HMTaskScreenState();
}

class HMTaskScreenState extends State<HMTaskScreen> {
  int tabIndex = 1;

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
        appBar: AppBar(
          backgroundColor: appStore.cardColor,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          elevation: 0,
          leading: Container(),
          title: Text("Tasks", style: boldTextStyle(size: 22)),
          centerTitle: true,
          actions: [IconButton(icon: Icon(Icons.more_horiz_rounded, size: 32, color: appStore.isDarkModeOn ? appBarBackgroundColor : gray), onPressed: null)],
        ),
        body: Container(
          child: Column(
            children: [
              CupertinoSlidingSegmentedControl(
                padding: EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 8),
                children: {
                  1: Container(
                    child: Text('Ongoing',
                        style: primaryTextStyle(
                            color: tabIndex == 1
                                ? appStore.isDarkModeOn
                                    ? HMColorWhite
                                    : HMColorWhite
                                : appStore.isDarkModeOn
                                    ? HMColorWhite
                                    : black)),
                  ),
                  2: Container(
                    child: Text('Completed',
                        style: primaryTextStyle(
                            color: tabIndex == 2
                                ? appStore.isDarkModeOn
                                    ? HMColorWhite
                                    : HMColorWhite
                                : appStore.isDarkModeOn
                                    ? HMColorWhite
                                    : black)),
                  ),
                  3: Container(
                    child: Text('Archived',
                        style: primaryTextStyle(
                            color: tabIndex == 3
                                ? appStore.isDarkModeOn
                                    ? HMColorWhite
                                    : HMColorWhite
                                : appStore.isDarkModeOn
                                    ? HMColorWhite
                                    : black)),
                  ),
                },
                backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : Colors.grey[100],
                thumbColor: hmColorPrimary,
                groupValue: tabIndex,
                onValueChanged: (newTabIndex) {
                  tabIndex = newTabIndex;
                  setState(() {});
                },
              ).paddingAll(HMAppPadding),
              SingleChildScrollView(
                child: tabIndex == 1
                    ? HMTaskOngoing(catData: outdoorUpkeepList)
                    : tabIndex == 2
                        ? HMTaskCompleted(taskData: taskData)
                        : tabIndex == 3
                            ? HMTaskArchived(taskData: taskData)
                            : null,
              ).expand()
            ],
          ),
        ),
      ),
    );
  }
}
