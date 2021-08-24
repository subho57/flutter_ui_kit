import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

double dynamicWidth(BuildContext context) {
  return isMobile ? context.width() : 350;
}
