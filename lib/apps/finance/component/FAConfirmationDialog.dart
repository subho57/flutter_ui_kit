import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/finance/utils/FAImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class FAConfirmationDialog extends StatefulWidget {
  static String tag = '/FAConfirmationDialog';

  @override
  FAConfirmationDialogState createState() => FAConfirmationDialogState();
}

class FAConfirmationDialogState extends State<FAConfirmationDialog> {
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
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 50, right: 16, left: 16),
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: Future.delayed(Duration(seconds: 3)),
            builder: (c, s) => s.connectionState == ConnectionState.done
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        fa_payment_done,
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                      30.height,
                      Text("Complete", style: boldTextStyle(size: 20)),
                      8.height,
                      Text(
                        'Your payment was successful!',
                        style: primaryTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        fa_payment_processing,
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                        color: appStore.isDarkModeOn ? Colors.white : Colors.black,
                      ),
                      16.height,
                      Text("Processing...", style: boldTextStyle(size: 20)),
                      8.height,
                      Text(
                        'Just hold a seconds, we are processing your payment',
                        style: primaryTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
