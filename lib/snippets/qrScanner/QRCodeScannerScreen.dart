import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class QRCodeScannerScreen extends StatefulWidget {
  static String tag = '/QRCodeScannerScreen';

  @override
  QRCodeScannerScreenState createState() => QRCodeScannerScreenState();
}

class QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
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
    return SafeArea(
      child: Scaffold(
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
                child: Text("QR Code Scanner", style: boldTextStyle(size: 14)),
                onTap: () {
                  scanQR();
                },
              ),
              8.height,
              Text('Scan result : $scanBarcode\n', style: boldTextStyle(size: 14)).visible(scanBarcode.isNotEmpty),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes = '';
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#4C76EA", "Cancel", true, ScanMode.QR);

      if (barcodeScanRes != null && barcodeScanRes.validate() != '-1') {
        scanBarcode = barcodeScanRes;
      } else {
        scanBarcode = '';
      }
      setState(() {});
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
  }
}
