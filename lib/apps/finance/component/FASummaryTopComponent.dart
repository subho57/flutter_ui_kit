import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class FASummaryTopComponent extends StatefulWidget {
  static String tag = '/FASummaryTopComponent';

  @override
  FASummaryTopComponentState createState() => FASummaryTopComponentState();
}

class FASummaryTopComponentState extends State<FASummaryTopComponent> {
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
    return Stack(
      children: [
        Container(
          color: fa_color_primary,
          height: context.height() * 0.45,
          width: context.width(),
          padding: EdgeInsets.only(left: 16, right: 16),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 8),
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: boxDecorationRoundedWithShadow(
              26,
              backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('MMMM yyyy').format(DateTime.now()),
                    style: boldTextStyle(),
                  ),
                  8.height,
                  faCircularProgress(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Your expense is under control', style: secondaryTextStyle()),
                      8.width,
                      Icon(Icons.info_outline_rounded),
                    ],
                  ),
                  AppButton(
                    color: fa_color_secondary,
                    padding: EdgeInsets.only(left: 36, right: 36, top: 14, bottom: 14),
                    child: Text(
                      'Learn More',
                      style: boldTextStyle(color: Colors.white),
                    ),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ).paddingOnly(left: 16, right: 16, top: context.height() * 0.1),
      ],
    );
  }
}
