import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/appearance.dart';
import 'package:mighty_ui_kit/apps/smartHome/customLibrary/sleekCircularSlider/circular_slider.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';

class ExampleViewModel {
  final List<Color> pageColors;
  final CircularSliderAppearance appearance;
  final double min;
  final double max;
  final double value;
  final InnerWidget innerWidget;

  ExampleViewModel({this.pageColors, @required this.appearance, this.min = 0, this.max = 100, this.value = 50, this.innerWidget});
}

class ExamplePage extends StatelessWidget {
  final ExampleViewModel viewModel;

  const ExamplePage({
    Key key,
    @required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: appStore.isDarkModeOn ? [appStore.cardColor, appStore.cardColor] : [HS_colorPrimary, HS_colorPrimary],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            tileMode: TileMode.clamp,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SleekCircularSlider(
              onChangeStart: (double value) {},
              onChangeEnd: (double value) {},
              innerWidget: viewModel.innerWidget,
              appearance: viewModel.appearance,
              min: viewModel.min,
              max: viewModel.max,
              initialValue: viewModel.value,
            ),
          ),
        ),
      ),
    );
  }
}
