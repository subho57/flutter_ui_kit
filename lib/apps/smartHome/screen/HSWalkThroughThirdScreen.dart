import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/HexColor.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/appearance.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/example_page.dart';
import 'package:nb_utils/nb_utils.dart';

final customWidth05 = CustomSliderWidths(trackWidth: 45, progressBarWidth: 45, shadowWidth: 70);
final customColors05 = CustomSliderColors(
  dotColor: HexColor('#424242'),
  trackColor: HexColor('#424242'),
  progressBarColors: [HexColor('#FF8E36'), HexColor('#F3D144')],
  shadowColor: HexColor('#FFB1B2'),
  shadowMaxOpacity: 0.05,
);
final info05 = InfoProperties(modifier: (double value) {
  final time = value.toInt();
  return '$time';
});
final CircularSliderAppearance appearance05 = CircularSliderAppearance(customWidths: customWidth05, customColors: customColors05, infoProperties: info05, startAngle: 270, angleRange: 360, size: 350.0);
final viewModel05 = ExampleViewModel(appearance: appearance05, min: 0, max: 26, value: 17);
final circleWidget = ExamplePage(viewModel: viewModel05);

class HSWalkThroughThirdScreen extends StatefulWidget {
  static String tag = '/HSWalkThroughThirdComponent';

  @override
  HSWalkThroughThirdScreenState createState() => HSWalkThroughThirdScreenState();
}

class HSWalkThroughThirdScreenState extends State<HSWalkThroughThirdScreen> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("FEATURE 2/3", style: primaryTextStyle(size: 12, color: textSecondaryColorGlobal)),
        5.height,
        Text("User Interface", style: primaryTextStyle(size: 28, weight: FontWeight.bold)),
        12.height,
        Text("You control all our Smart Home and enjoy Smart life", style: primaryTextStyle(size: 16, color: textSecondaryColorGlobal)),
        circleWidget.expand(),
        100.height,
      ],
    );
  }
}
