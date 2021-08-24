import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/utils/HSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'appearance.dart';

class SliderLabel extends StatelessWidget {
  final double value;
  final CircularSliderAppearance appearance;

  const SliderLabel({Key key, this.value, this.appearance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: builtInfo(appearance),
    );
  }

  List<Widget> builtInfo(CircularSliderAppearance appearance) {
    var widgets = <Widget>[];
    if (appearance.infoTopLabelText != null) {
      widgets.add(Text(
        appearance.infoTopLabelText,
        style: appearance.infoTopLabelStyle,
      ));
    }
    final modifier = appearance.infoModifier(value);
    widgets.add(Column(
      children: [
        Text("\u2103", style: primaryTextStyle(color: appStore.isDarkModeOn ? HS_colorPrimary : Colors.black, size: 14)),
        Text('$modifier', style: appearance.infoMainLabelStyle),
        Text("cooling", style: primaryTextStyle(color: appStore.isDarkModeOn ? HS_colorPrimary : Colors.black, size: 14)),
      ],
    ));
    if (appearance.infoBottomLabelText != null) {
      widgets.add(Text(
        appearance.infoBottomLabelText,
        style: appearance.infoBottomLabelStyle,
      ));
    }
    return widgets;
  }
}
