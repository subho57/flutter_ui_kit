import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/model/FDModel.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDShippingDetailNextScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDColors.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDDataProviders.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDImages.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDTrapezoidShape.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/utils/FDWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class FDShippingDetailScreen extends StatefulWidget {
  static String tag = '/FDShippingDetailScreen';
  final FDMyOrderCommingItemModel data;

  FDShippingDetailScreen({this.data});

  @override
  FDShippingDetailScreenState createState() => FDShippingDetailScreenState();
}

class FDShippingDetailScreenState extends State<FDShippingDetailScreen> {
  List<FDShippingDetailsModel> shippingDetails = fdGetShippingDetails();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fdAppBarWidget(title: 'Shipping detail', elevation: 0, context: context, actions: [
        IconButton(
          icon: ImageIcon(AssetImage(FDDetailsIcon)),
          onPressed: () {
            FDShippingDetailNextScreen().launch(context);
          },
          iconSize: 20,
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: List.generate(shippingDetails.length, (index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        if (index > 0) Container(width: 2, height: 15, color: grey) else 15.height,
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(shape: BoxShape.circle, color: shippingDetails[index].color),
                        ),
                        if (index < shippingDetails.length - 1) Container(width: 2, height: 50, color: grey),
                      ],
                    ),
                    20.width,
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: shippingDetails[index].color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        shippingDetails[index].text,
                        style: secondaryTextStyle(color: shippingDetails[index].color),
                      ),
                      width: 200,
                      padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    ),
                    20.width,
                    shippingDetails[index].time != null ? Text(shippingDetails[index].time).paddingTop(10) : SizedBox(),
                  ],
                );
              }),
            ).paddingOnly(left: 50, top: 30),
            30.height,
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Trapezoid(
                  cutLength: 20.0,
                  child: Container(
                    width: context.width() - 32,
                    height: 150,
                    color: FDPrimaryColor,
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        30.height,
                        Text(widget.data.name, style: boldTextStyle(color: white)),
                        Text('\$${widget.data.dollarPrice.toDouble()}', style: secondaryTextStyle(color: white)),
                      ],
                    ),
                  ).cornerRadiusWithClipRRect(16),
                ),
                Image.asset(
                  widget.data.image,
                  width: context.width() * 0.4,
                  fit: BoxFit.fill,
                ),
                // ),
              ],
            ).paddingBottom(16),
          ],
        ),
      ),
    );
  }
}
