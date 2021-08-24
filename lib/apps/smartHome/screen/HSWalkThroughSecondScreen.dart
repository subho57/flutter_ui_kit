import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class HSWalkThroughSecondScreen extends StatefulWidget {
  static String tag = '/HSWalkThroughSecondScreen';

  @override
  HSWalkThroughSecondScreenState createState() => HSWalkThroughSecondScreenState();
}

class HSWalkThroughSecondScreenState extends State<HSWalkThroughSecondScreen> {
  List<HSDeviceModel> deviceList = getDeviceList();

  int checkedIndex = 0;

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
      alignment: Alignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("FEATURE 1/3", style: primaryTextStyle(size: 12, color: textSecondaryColorGlobal)),
            5.height,
            Text("Control Everything", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
            12.height,
            Text("You control all our Smart Home and enjoy Smart life", style: primaryTextStyle(size: 16, color: textSecondaryColorGlobal)),
          ],
        ),
        GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: deviceList.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (BuildContext context, int index) {
              HSDeviceModel mData = deviceList[index];
              return buildCard(index, mData);
            }),
      ],
    );
  }

  Widget buildCard(int index, HSDeviceModel mData) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkedIndex = index;
          mData.isOn = !mData.isOn;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(10),
          backgroundColor: mData.isOn ? appStore.cardColor : appSecondaryBackgroundColor.withOpacity(0.3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(mData.deviceIcon, height: 26, width: 26),
            16.height,
            Text(
              mData.deviceName,
              overflow: TextOverflow.ellipsis,
              style: primaryTextStyle(
                size: 14,
                weight: mData.isOn ? FontWeight.bold : FontWeight.normal,
              ),
            ).expand(),
            Text(
              !mData.isOn ? "Off" : "On",
              style: secondaryTextStyle(size: 14),
            )
          ],
        ),
      ),
    );
  }
}
