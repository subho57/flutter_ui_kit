import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class StripePaymentScreen extends StatefulWidget {
  static String tag = '/StripePaymentScreen';

  @override
  StripePaymentScreenState createState() => StripePaymentScreenState();
}

class StripePaymentScreenState extends State<StripePaymentScreen> {
  String paymentMethodId;
  String errorMessage = "";
  final stripePayment = FlutterStripePayment();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    stripePayment.setStripeSettings(StripePublishableKey, StripeApplePayMerchantIdentifier);
    stripePayment.onCancel = () {
      print("the payment form was cancelled");
    };
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppButton(
                color: appStore.cardColor,
                height: 40,
                width: 160,
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
                child: Text('Click to Pay', style: boldTextStyle(size: 14)),
                onTap: () async {
                  var paymentResponse = await stripePayment.addPaymentMethod();
                  setState(() {
                    if (paymentResponse.status == PaymentResponseStatus.succeeded) {
                      paymentMethodId = paymentResponse.paymentMethodId;
                    } else {
                      errorMessage = paymentResponse.errorMessage;
                    }
                  });
                },
              ),
              10.height,
              paymentMethodId != null
                  ? Text("Successfully Payment $paymentMethodId", textAlign: TextAlign.center, style: secondaryTextStyle(color: black))
                  : Container(child: Text(errorMessage, style: primaryTextStyle())),
            ],
          ),
        ),
      ),
    );
  }
}
