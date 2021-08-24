import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/finance/component/FAConfirmationDialog.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAWidgets.dart';
import 'package:mighty_ui_kit/apps/finance/utils/sliderButton/slider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class FAConformationComponent extends StatefulWidget {
  static String tag = '/FAConformationComponent';

  @override
  FAConformationComponentState createState() => FAConformationComponentState();
}

class FAConformationComponentState extends State<FAConformationComponent> {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Confirmation', style: boldTextStyle()),
          30.height,
          Image.asset(fa_user2, height: 80, width: 80, fit: BoxFit.fill).cornerRadiusWithClipRRect(40),
          16.height,
          Text('William', style: boldTextStyle()),
          Text('@william', style: secondaryTextStyle()),
          30.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text('Fund Source', style: secondaryTextStyle()),
          ),
          16.height,
          Row(
            children: [
              Image.asset(fa_visa, height: 50, width: 50, fit: BoxFit.fill),
              16.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Visa', style: boldTextStyle()),
                  createRichText(
                    list: [
                      TextSpan(text: "Safe to spend:", style: primaryTextStyle()),
                      TextSpan(text: " \$2130.4", style: boldTextStyle()),
                    ],
                  )
                ],
              ),
              Spacer(),
              Text('Change', style: boldTextStyle(color: fa_color_secondary, size: 14)),
            ],
          ),
          8.height,
          Divider(),
          8.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text('Notes', style: secondaryTextStyle()),
          ),
          8.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text('Thanks for your work', style: primaryTextStyle()),
          ),
          8.height,
          Divider(),
          8.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text('Transfer details', style: boldTextStyle()),
          ),
          8.height,
          faTitleWidget(
            title: "Transfer amount",
            subTitle: "\$240.51",
            subTitleStyle: primaryTextStyle(),
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transfer fee', style: primaryTextStyle(size: 14)),
              4.width,
              Icon(Icons.info_outline_rounded),
              Spacer(),
              Text('Free', style: secondaryTextStyle(color: fa_color_green)),
            ],
          ),
          8.height,
          faTitleWidget(
            title: "Total",
            subTitle: "\$240.51",
            subTitleStyle: boldTextStyle(),
            titleColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
          ),
          16.height,
          Text('Payment received in seconds', style: secondaryTextStyle()),
          16.height,
          SliderButton(
            buttonSize: 40,
            disable: false,
            dismissible: true,
            backgroundColor: fa_color_secondary,
            action: () {
              finish(context);
              showInDialog(
                context,
                child: FAConfirmationDialog(),
                shape: dialogShape(16),
                contentPadding: EdgeInsets.zero,
                barrierDismissible: false,
              );
            },
            label: Text("Swipe to send money", style: secondaryTextStyle(color: Colors.white)),
            icon: Icon(Icons.navigate_next_outlined, color: fa_color_secondary),
          ),
        ],
      ).paddingAll(16),
    );
  }
}
