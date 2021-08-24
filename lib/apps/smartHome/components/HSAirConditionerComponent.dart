import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/HexColor.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/appearance.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/example_page.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

final customWidth05 = CustomSliderWidths(trackWidth: 45, progressBarWidth: 45, shadowWidth: 70);
final customColors05 =
    CustomSliderColors(dotColor: HexColor('#424242'), trackColor: HexColor('#424242'), progressBarColors: [HexColor('#FF8E36'), HexColor('#F3D144')], shadowColor: HexColor('#FFB1B2'), shadowMaxOpacity: 0.05);
final info05 = InfoProperties(modifier: (double value) {
  final time = value.toInt();
  return '$time';
});
final CircularSliderAppearance appearance05 = CircularSliderAppearance(customWidths: customWidth05, customColors: customColors05, infoProperties: info05, startAngle: 270, angleRange: 360, size: 350.0);
final viewModel05 = ExampleViewModel(appearance: appearance05, min: 0, max: 27, value: 16);
final circleWidget = ExamplePage(
  viewModel: viewModel05,
);

class HSAirConditionerComponent extends StatefulWidget {
  static String tag = '/HSAirConditionerComponent';

  @override
  HSAirConditionerComponentState createState() => HSAirConditionerComponentState();
}

class HSAirConditionerComponentState extends State<HSAirConditionerComponent> {
  final CircularSliderAppearance appearance04 = CircularSliderAppearance();

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: context.width() * 0.2,
        automaticallyImplyLeading: false,
        backgroundColor: appStore.cardColor,
        leading: Row(
          children: [
            Icon(Icons.arrow_back_ios_outlined, color: hsColorAccent),
            Text("Back", style: boldTextStyle(color: hsColorAccent, size: 16)),
          ],
        ).onTap(() {
          finish(context);
        }),
        centerTitle: true,
        title: Text("Air Conditioner", style: boldTextStyle(size: 16)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(alignment: Alignment.center, height: 300, width: 300, child: circleWidget),
            ),
            40.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                optionWidget("Speech", icon: Icons.email),
                8.width,
                optionWidget("Speech", icon: Icons.camera_alt),
                8.width,
                optionWidget("Speech", icon: Icons.phone),
              ],
            ),
            12.height,
            Container(
              decoration: boxDecorationWithRoundedCorners(
                backgroundColor: Hs_color_grey_background,
                borderRadius: radius(10),
              ),
              padding: EdgeInsets.only(top: 8, bottom: 8, right: 12, left: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(icon: Icon(Icons.maximize, color: hsColorAccent), onPressed: () {}),
                  Text("TEMP", style: boldTextStyle(size: 14, color: HS_colorPrimary)),
                  IconButton(icon: Icon(Icons.add, color: hsColorAccent), onPressed: () {}),
                ],
              ),
            ),
            12.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                speechWidget("Speech"),
                speechWidget("Direction"),
                speechWidget("Swing"),
              ],
            ),
            12.height,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: Colors.pink,
                    borderRadius: radius(10),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.email, color: HS_colorPrimary),
                      Text("Power", style: primaryTextStyle(size: 14, color: HS_colorPrimary)),
                    ],
                  ),
                ).expand(),
                12.width,
                Container(
                  padding: EdgeInsets.only(top: 12, bottom: 12),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: hsColorAccent,
                    borderRadius: radius(10),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.star,
                        color: HS_colorPrimary,
                      ),
                      Text("Mode", style: primaryTextStyle(size: 12, color: HS_colorPrimary)),
                    ],
                  ),
                ).expand()
              ],
            )
          ],
        ).paddingOnly(top: 50, left: 16, right: 16, bottom: 16),
      ),
    );
  }

  Widget optionWidget(String title, {IconData icon}) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 35, right: 35),
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: Hs_color_grey_background,
        borderRadius: radius(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: HS_colorPrimary),
          Text(title, style: primaryTextStyle(size: 12, color: HS_colorPrimary)),
        ],
      ),
    );
  }

  Widget speechWidget(String title) {
    return Container(
      padding: EdgeInsets.only(left: 35, right: 35, top: 30, bottom: 30),
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: Hs_color_grey_background,
        borderRadius: radius(10),
      ),
      child: Text(title, style: primaryTextStyle(size: 12, color: HS_colorPrimary)),
    );
  }
}
