import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class HSBrightnessScreen extends StatefulWidget {
  static String tag = '/HSLampComponent';
  final HSDeviceModel deviceData;

  HSBrightnessScreen({this.deviceData});

  @override
  HSBrightnessScreenState createState() => HSBrightnessScreenState();
}

class HSBrightnessScreenState extends State<HSBrightnessScreen> {
  List<HsBrightnessModel> brightnessData = getBrightnessColorList();

  bool isColorChange = false;
  int checkedIndex = 0;
  Color color = Colors.red;
  double change = 175;
  bool isDeviceFav = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setState(() {
      appStore.favDeviceList.forEach((element) {
        isDeviceFav = element.deviceId == widget.deviceData.deviceId;
      });
    });
  }

  double getPercent(double num) {
    double get;
    get = num * 100 / 350;
    var brightnessPercent = double.parse(get.toStringAsFixed(0));
    return brightnessPercent;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                BackButton(),
                Icon(Icons.add, size: 24, color: hsColorOrange),
                10.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.deviceData.deviceName.validate(), style: boldTextStyle(size: 14)),
                    Text(" ${getPercent(change).toInt()}% Brightness".validate(), style: primaryTextStyle(color: textSecondaryColorGlobal, size: 14)),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  child: IconButton(
                    icon: isDeviceFav ? Icon(Icons.favorite, color: hsColorOrange) : Icon(Icons.favorite_border),
                    onPressed: () {
                      setState(() {
                        if (isDeviceFav == false) {
                          appStore.addToMyItems(widget.deviceData);
                        } else {
                          appStore.removeToMyItems(widget.deviceData);
                        }
                        isDeviceFav = !isDeviceFav;
                      });
                    },
                  ),
                )
              ],
            ),
            50.height,
            GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.delta.dy > 0) {
                  change = change == 0 ? 0 : change - 1;
                } else if (details.delta.dy < -0) {
                  change = change == 350 ? 350 : change + 1;
                }
                setState(() {});
              },
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 350,
                    width: 140,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: Colors.white,
                      boxShadow: defaultBoxShadow(),
                      borderRadius: radius(40),
                    ),
                  ),
                  AnimatedContainer(
                    height: change,
                    width: 140,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: color,
                      boxShadow: defaultBoxShadow(),
                      borderRadius: radius(40),
                    ),
                    duration: Duration(microseconds: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 4, width: 30, color: Colors.grey[300]),
                        5.height,
                        Icon(Icons.lightbulb, size: 24, color: HS_colorPrimary),
                      ],
                    ).paddingOnly(top: 16, bottom: 8).visible(getPercent(change) >= 20),
                  )
                ],
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 50),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, crossAxisSpacing: 2, childAspectRatio: 1, mainAxisSpacing: 5),
              itemCount: brightnessData.length,
              itemBuilder: (context, index) {
                HsBrightnessModel mData = brightnessData[index];
                return GestureDetector(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: mData.color),
                      ),
                      checkedIndex == index ? Text("edit", style: boldTextStyle(size: 14, color: HS_colorPrimary, weight: FontWeight.bold)) : Text(""),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      checkedIndex = index;
                      color = mData.color;
                    });
                  },
                );
              },
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }

  Widget circle(Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
