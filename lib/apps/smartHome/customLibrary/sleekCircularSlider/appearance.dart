import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';

typedef String PercentageModifier(double percentage);

class CircularSliderAppearance {
  static const double _defaultSize = 280.0;
  static const double _defaultStartAngle = 200.0;
  static const double _defaultAngleRange = 240.0;

  static const Color _defaultTrackColor = Color.fromRGBO(66, 66, 66, 1.0);

  static const List<Color> _defaultBarColors = [
    Color.fromRGBO(255, 142, 54, 1),
    Color.fromRGBO(255, 204, 67, 1),
  ];

  static const double _defaultGradientStartAngle = 0.0;
  static const double _defaultGradientEndAngle = 180.0;
  static const double _defaultTrackGradientStartAngle = 0.0;
  static const double _defaultTrackGradientEndAngle = 180.0;
  static const bool _defaultDynamicGradient = false;
  static const bool _defaultHideShadow = false;
  static const Color _defaultShadowColor = Color.fromRGBO(44, 87, 192, 1.0);
  static const double _defaultShadowMaxOpacity = 0.2;
  static const Color _defaultDotColor = Colors.white;

  String _defaultPercentageModifier(double value) {
    final roundedValue = value.toInt();
    return '$roundedValue';
  }

  final double size;
  final double startAngle;
  final double angleRange;
  final bool animationEnabled;
  final bool spinnerMode;
  final bool counterClockwise;
  final double animDurationMultiplier;
  final int spinnerDuration;
  final CustomSliderWidths customWidths;
  final CustomSliderColors customColors;
  final InfoProperties infoProperties;

  double get _customTrackWidth => customWidths != null ? customWidths.trackWidth : null;

  double get _customProgressBarWidth => customWidths != null ? customWidths.progressBarWidth : null;

  double get _customShadowWidth => customWidths != null ? customWidths.shadowWidth : null;

  double get _customHandlerSize => customWidths != null ? customWidths.handlerSize : null;

  double get trackWidth => _customTrackWidth ?? progressBarWidth / 1.2;

  double get progressBarWidth => _customProgressBarWidth ?? size / 6.0;

  double get handlerSize => _customHandlerSize ?? progressBarWidth / 5.0;

  double get shadowWidth => _customShadowWidth ?? progressBarWidth * 1.0;

  Color get _customTrackColor => customColors != null ? customColors.trackColor : null;

  List<Color> get _customProgressBarColors {
    if (customColors != null) {
      if (customColors.progressBarColors != null) {
        return customColors.progressBarColors;
      } else if (customColors.progressBarColor != null) {
        return [customColors.progressBarColor, customColors.progressBarColor];
      }
    }
    return null;
  }

  List<Color> get _customTrackColors {
    if (customColors != null) {
      if (customColors.trackColors != null) {
        return customColors.trackColors;
      } else {
        return null;
      }
    }
    return null;
  }

  double get _gradientStartAngle => customColors != null ? customColors.gradientStartAngle : null;

  double get _gradientEndAngle => customColors != null ? customColors.gradientEndAngle : null;

  double get _trackGradientStartAngle => customColors != null ? customColors.trackGradientStartAngle : null;

  double get _trackGradientEndAngle => customColors != null ? customColors.trackGradientEndAngle : null;

  bool get _dynamicGradient => customColors != null ? customColors.dynamicGradient : null;

  Color get _customShadowColor => customColors != null ? customColors.shadowColor : null;

  double get _customShadowMaxOpacity => customColors != null ? customColors.shadowMaxOpacity : null;

  double get _customShadowStep => customColors != null ? customColors.shadowStep : null;

  Color get _customDotColor => customColors != null ? customColors.dotColor : null;

  bool get _hideShadow => customColors != null ? customColors.hideShadow : null;

  Color get trackColor => _customTrackColor ?? _defaultTrackColor;

  List<Color> get trackColors => _customTrackColors ?? null;

  List<Color> get progressBarColors => _customProgressBarColors ?? _defaultBarColors;

  double get gradientStartAngle => _gradientStartAngle ?? _defaultGradientStartAngle;

  double get gradientStopAngle => _gradientEndAngle ?? _defaultGradientEndAngle;

  double get trackGradientStartAngle => _trackGradientStartAngle ?? _defaultTrackGradientStartAngle;

  double get trackGradientStopAngle => _trackGradientEndAngle ?? _defaultTrackGradientEndAngle;

  bool get dynamicGradient => _dynamicGradient ?? _defaultDynamicGradient;

  bool get hideShadow => _hideShadow ?? _defaultHideShadow;

  Color get shadowColor => _customShadowColor ?? _defaultShadowColor;

  double get shadowMaxOpacity => _customShadowMaxOpacity ?? _defaultShadowMaxOpacity;

  double get shadowStep => _customShadowStep;

  Color get dotColor => _customDotColor ?? _defaultDotColor;

  String get _topLabelText => infoProperties != null ? infoProperties.topLabelText : null;

  String get _bottomLabelText => infoProperties != null ? infoProperties.bottomLabelText : null;

  TextStyle get _mainLabelStyle => infoProperties != null ? infoProperties.mainLabelStyle : null;

  TextStyle get _topLabelStyle => infoProperties != null ? infoProperties.topLabelStyle : null;

  TextStyle get _bottomLabelStyle => infoProperties != null ? infoProperties.bottomLabelStyle : null;

  PercentageModifier get _modifier => infoProperties != null ? infoProperties.modifier : null;

  PercentageModifier get infoModifier => _modifier ?? _defaultPercentageModifier;

  String get infoTopLabelText => _topLabelText ?? null;

  String get infoBottomLabelText => _bottomLabelText ?? null;

  TextStyle get infoMainLabelStyle {
    if (_mainLabelStyle != null) return _mainLabelStyle;

    return TextStyle(fontWeight: FontWeight.w100, fontSize: 30, color: appStore.isDarkModeOn ? Color.fromRGBO(251, 251, 251, 1) : Color.fromRGBO(66, 66, 66, 1));
  }

  TextStyle get infoTopLabelStyle {
    if (_topLabelStyle != null) return _topLabelStyle;
    return TextStyle(fontWeight: FontWeight.w600, fontSize: size / 5.0, color: Color.fromRGBO(66, 66, 66, 1));
  }

  TextStyle get infoBottomLabelStyle {
    if (_bottomLabelStyle != null) return _bottomLabelStyle;
    return TextStyle(fontWeight: FontWeight.w600, fontSize: size / 5.0, color: Color.fromRGBO(66, 66, 66, 1.0));
  }

  const CircularSliderAppearance(
      {this.customWidths,
      this.customColors,
      this.size = _defaultSize,
      this.startAngle = _defaultStartAngle,
      this.angleRange = _defaultAngleRange,
      this.infoProperties,
      this.animationEnabled = true,
      this.counterClockwise = false,
      this.spinnerMode = false,
      this.spinnerDuration = 1500,
      this.animDurationMultiplier = 1.0});
}

class CustomSliderWidths {
  final double trackWidth;
  final double progressBarWidth;
  final double handlerSize;
  final double shadowWidth;

  CustomSliderWidths({this.trackWidth, this.progressBarWidth, this.handlerSize, this.shadowWidth});
}

class CustomSliderColors {
  final Color trackColor;
  final Color progressBarColor;
  final List<Color> progressBarColors;
  final double gradientStartAngle;
  final double gradientEndAngle;
  final List<Color> trackColors;
  final double trackGradientStartAngle;
  final double trackGradientEndAngle;
  final bool dynamicGradient;
  final bool hideShadow;
  final Color shadowColor;
  final double shadowMaxOpacity;
  final double shadowStep;
  final Color dotColor;

  CustomSliderColors(
      {this.trackColor,
      this.progressBarColor,
      this.progressBarColors,
      this.gradientStartAngle,
      this.gradientEndAngle,
      this.trackColors,
      this.trackGradientStartAngle,
      this.trackGradientEndAngle,
      this.hideShadow,
      this.shadowColor,
      this.shadowMaxOpacity,
      this.shadowStep,
      this.dotColor,
      this.dynamicGradient = false});
}

class InfoProperties {
  final PercentageModifier modifier;
  final TextStyle mainLabelStyle;
  final TextStyle topLabelStyle;
  final TextStyle bottomLabelStyle;
  final String topLabelText;
  final String bottomLabelText;

  InfoProperties({this.topLabelText, this.bottomLabelText, this.mainLabelStyle, this.topLabelStyle, this.bottomLabelStyle, this.modifier});
}
