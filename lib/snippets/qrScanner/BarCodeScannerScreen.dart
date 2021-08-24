import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class BarCodeScannerScreen extends StatefulWidget {
  static String tag = '/BarCodeScannerScreen';

  @override
  BarCodeScannerScreenState createState() => BarCodeScannerScreenState();
}

class BarCodeScannerScreenState extends State<BarCodeScannerScreen> {
  String scanBarcode = '';

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
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              child: Text("Bar Code Scanner", style: boldTextStyle(size: 14)),
              onTap: () {
                scanBarcodeNormal();
              },
            ),
            8.height,
            Text('Scan result : $scanBarcode\n', style: boldTextStyle(size: 14)).visible(scanBarcode.isNotEmpty),
          ],
        ),
      ),
    );
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes = '';
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#4C76EA", "Cancel", true, ScanMode.BARCODE);

      if (barcodeScanRes != null && barcodeScanRes.validate() != '-1') {
        scanBarcode = barcodeScanRes;
      } else {
        scanBarcode = '';
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
  }
}
