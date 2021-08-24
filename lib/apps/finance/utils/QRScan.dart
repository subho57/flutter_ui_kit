import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAColors.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScan extends StatefulWidget {
  static String tag = '/QRScan';

  @override
  QRScanState createState() => QRScanState();
}

class QRScanState extends State<QRScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: fa_color_secondary,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: 230,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildQrView(context),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
                  onPressed: () async {
                    finish(context);
                  },
                ),
                Icon(Icons.info_outline, color: Colors.white)
              ],
            ).paddingOnly(top: 8, right: 16),
            Text('Front of Card', style: boldTextStyle(color: Colors.white, size: 18)),
            8.height,
            Text(
              'Position all 4 corners of th front clearly in the frame',
              style: primaryTextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ).paddingOnly(left: 16, right: 16),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.flash_on),
                    ).onTap(() async {}),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle, color: fa_color_secondary),
                      padding: EdgeInsets.all(16),
                      child: Icon(Icons.check, color: Colors.white),
                    ),
                    Container(
                      child: FutureBuilder(
                        future: controller?.getCameraInfo(),
                        builder: (context, snapshot) {
                          if (snapshot.data != null) {
                            return Image.asset(fa_switch_camera_icon, height: 24, width: 24);
                          } else {
                            return Text('loading');
                          }
                        },
                      ),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      padding: EdgeInsets.all(12),
                    ).onTap(() async {
                      await controller?.flipCamera();
                      setState(() {});
                    }),
                  ],
                ).paddingBottom(30)
              ],
            ),
          ),
        )
      ],
    );
  }
}
