import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/QRScan.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class FAScanDocumentScreen extends StatefulWidget {
  static String tag = '/FAScanDocumentScreen';

  @override
  FAScanDocumentScreenState createState() => FAScanDocumentScreenState();
}

class FAScanDocumentScreenState extends State<FAScanDocumentScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appStore.isDarkModeOn ? Colors.transparent : Colors.black, statusBarBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(fa_color_primary);

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: QRScan(),
      ),
    );
  }
}
